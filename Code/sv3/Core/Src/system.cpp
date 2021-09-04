/*
 * system.cpp
 *
 *  Created on: Aug 14, 2021
 *      Author: Matt
 */

#include "system.h"

system::system() {
	// TODO Auto-generated constructor stub

}

system::system(ADC_HandleTypeDef* adcHandle) {
	adch = adcHandle;
}

system::~system() {
	// TODO Auto-generated destructor stub
}

uint8_t system::init() {
	if(HAL_ADCEx_Calibration_Start(adch, ADC_SINGLE_ENDED) != HAL_OK)
		return 1;
	return update();
}

uint8_t system::update(void) {
	  if(HAL_ADC_Start(adch) != HAL_OK)			  						return 1;
	  if(HAL_ADC_PollForConversion(adch, ADC_TIMEOUT) != HAL_OK) 		return 1;
	  RAW[0] = HAL_ADC_GetValue(adch);
	  if(HAL_ADC_PollForConversion(adch, ADC_TIMEOUT) != HAL_OK) 		return 1;
	  RAW[1] = HAL_ADC_GetValue(adch);
	  if(HAL_ADC_Stop(adch) != HAL_OK) 									return 1;

	  vbat = calcVbat(RAW[0]);
	  tmp = calcTemp(RAW[1]);
	  return 0;
};

float system::getTemp(void)	{
	return tmp;
};

float system::getVBat(void) {
	return vbat;
};

float system::calcVbat(uint32_t raw_adc) {
    return (float) 2.0 * ( raw_adc * (3.3 / 0xFFF) );
};

float system::calcTemp(uint32_t raw_adc) {
	return (float) ( AVG_SLOPE * (raw_adc - cal_1) ) + 30.0;
};

uint8_t system::vbatCompare(float value) {
    if(vbat <= value)
        return 1; 			//bat <= value
    return 0; 				//bat > value
}


