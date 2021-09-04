/* USER CODE BEGIN Header */

/*------------------------------------------------------------------------------
 *       _____ ___    __    ________  ___   ____________
 *      / ___//   |  / /   / ____/  |/  /  /  _/  _/  _/
 *      \__ \/ /| | / /   / __/ / /|_/ /   / / / / / /
 *     ___/ / ___ |/ /___/ /___/ /  / /  _/ /_/ /_/ /
 *    /____/_/  |_/_____/_____/_/  /_/  /___/___/___/
 *
 *                                  Matthew McCardle
 *                                              2021
 *
 *------------------------------------------------------------------------------
 *
 *      RELEASE STATS
 *      FLASH:......... 25.37kb USED,  102.63KB FREE [19.82%]
 *      RAM:........... 1.89kb  USED,   18.11kb FREE [ 9.45%]
 *
 *------------------------------------------------------------------------------
 *              [ !!!! TESTED ON HARDWARE [SV3] !!!! ]
 *------------------------------------------------------------------------------
 *------------------------------------------------------------------------------
 *
 *						 Code Version 1.0.2
 *
 *------------------------------------------------------------------------------
 *------------------------------------------------------------------------------
 *
 */


/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "adc.h"
#include "i2c.h"
#include "tim.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "system.h"
#include "FDC1004.h"
#include "buzzer.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define SAMPLE_RATE 1024

#define INITIAL_SENSITIVITY 2.0

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

static const int table_size       = 23;

static const uint16_t F_TABLE[23] = {  800,  900, 1000, 1100, 1200, 1400, 1600, 1700, 1800, 1900,
										 0,    0,    0,
								      2100, 2200, 2300, 2400, 2500, 2600, 2800, 3000, 3100, 3200};

static const uint8_t L_SHOW[23]   =  {0x0F, 0x07, 0x0B, 0x03, 0x05, 0x09, 0x01, 0x02, 0x04, 0x08,
		                              0x00, 0x00, 0x00,
									  0x01, 0x02, 0x04, 0x08, 0x09, 0x0A, 0x0C, 0x0D, 0x0E, 0x0F};

static const uint8_t FULL_LED_SHOW[16]  = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
                                           0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F};

static const float VBAT_MAX             = 3.0;              /* max battery voltage 1.5v * 2 [2xAA] */
static const float VBAT_THRESH          = 1.9;              /* minimum battery voltage, boost works down to ~0.9v */
static const float ALPHA                = (15.0 / 100.0);	/* EWMA Alpha value*/
static const float temp_delta 			= 2.0; 				/* temperature delta */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

void EWMA(float *ewma, float newVal, float alpha);      /* Exponential weighted moving average function */
void setLedShow(const uint8_t *ptr, uint8_t index);     /* used led map to display cap change, kinda like gray code */
uint8_t LEDShowBat(float vbat);             			/* shows the battery voltage 0% - 100%, 4 steps */
uint8_t getCapValue(FDC1004 *ptr, float *cap);          /* gets cap value in pico F */
uint8_t readButton(uint8_t AB);                         /* returns true if button is pressed */


int calc_index(float value, float baseline, float per, int steps);
void setLedShow(uint8_t val);

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC_Init();
  MX_I2C1_Init();
  MX_TIM2_Init();
  /* USER CODE BEGIN 2 */

  int cal_update							= 1;
  int system_update 						= 1; 					//update counter

  float capVal 								= 0; 					//raw cap value
  float smoothCap 							= 0; 					//smoothed cap value
  float base_line 							= 0; 					//Ambient capacitance
  float threshold 							= INITIAL_SENSITIVITY; 	//Sensitivity
  float threshold_percent 					= (threshold / 100.0); 	//Sensitivity %
  float ambiant_temp 						= 0; 					//temperature value


  /*********************************************************************************************/

  /* ----------- LED Awesomeness --------------- */
  setLedShow(FULL_LED_SHOW,  1);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  3);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  7);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW, 15);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  7);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  3);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  1);  HAL_Delay(100);
  setLedShow(FULL_LED_SHOW,  0);
 /* --------------------------------------------- */

  /* start up ADC */
  system mySys(&hadc);
  if(mySys.init() != 0)
	  Error_Handler();

  /* start up FDC1004 */
  FDC1004 FDC(FDC1004_100HZ, &hi2c1);
  if (FDC.configureMeasurementSingle(0, 0, 0))
      Error_Handler();

  /* init buzzer */
  buzzer buzz;
  if(buzz.init(&htim2, TIM_CHANNEL_1))
      Error_Handler();

  /*------- check vbat before main -------*/
  /* display battery level on led's */
  if(LEDShowBat(mySys.getVBat()) != 0)
      Error_Handler();

  /* fault if vbat < threshold */
  if(mySys.vbatCompare(VBAT_THRESH))
	  Error_Handler();

  /*******************************************/
  /* Get Baseline From FDC1004 */

  /* init baseline with reading != 0 */
  if(getCapValue(&FDC, &base_line))
      Error_Handler();

  /* read 100 samples */
  for(uint8_t i = 0; i < 100; i++) {
      if(getCapValue(&FDC, &capVal))
          Error_Handler();
      EWMA(&base_line, capVal, ALPHA);
  }
  smoothCap = base_line;
  /*********************************************************************/

  /*------- record ambient temp -------*/
  /* after x cycles the chip should be at steady thermal state */
  if(mySys.update() != 0)
	  Error_Handler();
  ambiant_temp = mySys.getTemp();

  /* ready chime */
  setLedShow(FULL_LED_SHOW, 0);
  buzz.chime(4000, 4600, 4000, 50);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  int SEQUENCE_ACTIVE = 0;

      /******************************************************************/
      /******************************************************************/
      /*----------------------------------------------------------------*/
      /* Read Cap Value */
      if(getCapValue(&FDC, &capVal))
          Error_Handler();

      /* smooth value */
      EWMA(&smoothCap, capVal, ALPHA);

      /* check cap value against set */
      // 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22
      int _index = calc_index(smoothCap, base_line, threshold_percent, table_size);
      if((_index != 10) && (_index != 11) && (_index != 12)) {
    	  SEQUENCE_ACTIVE = 1;
      }

      setLedShow(L_SHOW[_index]);
	  if(buzz.setFreq(F_TABLE[_index]) != 0)
		  Error_Handler();

      /*----------------------------------------------------------------*/
      /******************************************************************/
      /******************************************************************/
      /*----------------------------------------------------------------*/
      /* read buttons */
      //do things 'n' stuff for button 2 [top button]
      if(readButton(2)) {

          threshold += 0.05;
          threshold_percent = (threshold / 100.0);

          if(buzz.chirp(1500, 200))
              Error_Handler();

          //while(readButton(2)); //TODO debug
      }

      //do things 'n' stuff for button 1 [bottom button]
      if(readButton(1)) {

          threshold -= 0.05;
          threshold_percent = (threshold / 100.0);

          if(buzz.chirp(1300, 200))
              Error_Handler();

          //while(readButton(1)); //TODO debug
      }

      /*----------------------------------------------------------------*/
      /******************************************************************/
      /******************************************************************/
      /*----------------------------------------------------------------*/
      /* Read ADC VBAT + RECAL */

	  if(system_update == 0)
	  {
		  if(mySys.update() != 0)
			  Error_Handler();

		  if(mySys.vbatCompare(VBAT_THRESH))
			  Error_Handler();

		  if(SEQUENCE_ACTIVE == 0)
		  {
			  float tmp = mySys.getTemp();
			  if((tmp >= (ambiant_temp + temp_delta)) || (tmp <= (ambiant_temp - temp_delta)))
			  {
				  if(tmp >= (ambiant_temp + temp_delta)) {
					  if(buzz.chime(700, 800, 900, 100)) //chime up
						  Error_Handler();
				  }
				  else {
					  if(buzz.chime(900, 800, 700, 100)) //chime down
						  Error_Handler();
				  }
				  ambiant_temp = tmp;
			  }

			  if(cal_update == 0)
			  {
				  base_line = smoothCap;
			  }
		  }
	  }

	  system_update = (system_update + 1) %  SAMPLE_RATE;    //Increment loop update
	  cal_update    = (cal_update    + 1) % (SAMPLE_RATE*4); //Increment loop update
      /*----------------------------------------------------------------*/

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLLMUL_4;
  RCC_OscInitStruct.PLL.PLLDIV = RCC_PLLDIV_2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_I2C1;
  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* calc index value based in percent */
int calc_index(float value, float baseline, float per, int steps) {
    int h = 1 - ((steps / 2) + 1);
    for (int i = h; i < steps + h; i++) {
        float b = baseline + (i * per);
        if (value < b)
            return i + (steps + h) - 1;
    }
    return steps - 1;
}

/* get new cap value */
uint8_t getCapValue(FDC1004 *ptr, float *cap) {
    uint8_t ret = 0;
    if(ptr->triggerSingleMeasurement(0, FDC1004_100HZ))
        return 1; //trigger error

      do
      {
        ret = ptr->readCap(0, cap);
        HAL_Delay(1);
      } while(ret == 2); //still processing

      return ret; //all ok
}

/* Exponentially Weighted Moving Average */
void EWMA(float *ewma, float newVal, float alpha) {
    *ewma = (1.0 - alpha) * (*ewma) + alpha * newVal;
}

/* buttons are active low, hardware debounce */
uint8_t readButton(uint8_t AB) {
    if(AB == 1) return !HAL_GPIO_ReadPin(B1_GPIO_Port, B1_Pin);
    if(AB == 2) return !HAL_GPIO_ReadPin(B2_GPIO_Port, B2_Pin);
    return 0;
}

void setLedShow(uint8_t val) {
    GPIO_PinState state;

    state = (val & 0x08) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED4_GPIO_Port, LED4_Pin, state);

    state = (val & 0x04) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, state);

    state = (val & 0x02) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, state);

    state = (val & 0x01) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, state);
}

void setLedShow(const uint8_t *ptr, uint8_t index) {
    GPIO_PinState state;

    state = (ptr[index] & 0x08) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED4_GPIO_Port, LED4_Pin, state);

    state = (ptr[index] & 0x04) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, state);

    state = (ptr[index] & 0x02) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, state);

    state = (ptr[index] & 0x01) ? GPIO_PIN_RESET : GPIO_PIN_SET;
    HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, state);
}

uint8_t LEDShowBat(float vbat) {
    float _div = (VBAT_MAX - VBAT_THRESH) / 4.0;

    uint8_t bat_led[5] = { 0, 1, 3, 7, 15 };
    float bat_check[5] = { (float) (VBAT_THRESH + _div * 0.0),
                           (float) (VBAT_THRESH + _div * 1.0),
                           (float) (VBAT_THRESH + _div * 2.0),
                           (float) (VBAT_THRESH + _div * 3.0),
                           (float) (VBAT_THRESH + _div * 4.0)};

    for(int i = 0; i < 5; i++) {
        if((vbat < bat_check[i]) || i == 4) {
            setLedShow(FULL_LED_SHOW, bat_led[i]);
            break;
        }
    }

    HAL_Delay(800);
    return 0;
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

	HAL_TIM_PWM_Stop(&htim2, TIM_CHANNEL_1); //kill buzzer

	while(1) {
		  setLedShow(FULL_LED_SHOW, 10);   HAL_Delay(300);
		  setLedShow(FULL_LED_SHOW, 5);    HAL_Delay(300);
	}

  __disable_irq();

  while (1)
  {

  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
