/*
 * buzzer.cpp
 *
 *  Created on: Aug 2, 2021
 *      Author: Matt
 */

#include "buzzer.h"

buzzer::buzzer() {
	// TODO Auto-generated constructor stub
}

uint8_t buzzer::init(TIM_HandleTypeDef *htim, uint32_t Channel) {
	btim = htim;
	chan = Channel;

	if(HAL_TIM_Base_Start(btim) != HAL_OK)
		return 1;

	return 0;
}

uint8_t buzzer::start(void) {
	if(HAL_TIM_PWM_Start(btim, chan) != HAL_OK)
		return 1;
	return 0;
}

uint8_t buzzer::stop(void) {
	if(HAL_TIM_PWM_Stop(btim, chan) != HAL_OK)
		return 1;
	return 0;
}

uint8_t buzzer::setFreq(float hz) {
	if(hz == new_freq)
		return 0;

	new_freq = hz;

	if(new_freq == 0) {
		return stop();
	}
	else {
		if(TIM_CHANNEL_STATE_GET(btim, chan) == HAL_TIM_CHANNEL_STATE_READY) {
			if(start())
				return 1;
		}
	}

	uint16_t period = calcFreqPer(hz);
	uint16_t pulse = (uint16_t) ( period / 2.0 ); //50% duty always

	btim->Init.Prescaler = PRESCALE;
	btim->Init.Period = period;

	if (HAL_TIM_PWM_Init(btim) != HAL_OK)
		return 1;

	switch(chan)
	{
		case TIM_CHANNEL_1:
			btim->Instance->CCR1 = pulse;
			break;
		case TIM_CHANNEL_2:
			btim->Instance->CCR2 = pulse;
			break;
		case TIM_CHANNEL_3:
			btim->Instance->CCR3 = pulse;
			break;
		case TIM_CHANNEL_4:
			btim->Instance->CCR4 = pulse;
			break;
			/*
		case TIM_CHANNEL_5:
			btim->Instance->CCR5 = pulse;
			break;
		case TIM_CHANNEL_6:
			btim->Instance->CCR6 = pulse;
			break;
			*/
		default:
			return 1;
	}

	return 0;
}

uint8_t buzzer::chime(float a, float b, float c, int ms) {
	float old_freq = new_freq;
	if(setFreq(a))	      return 1;
	HAL_Delay(ms);
	if(setFreq(b))	      return 1;
	HAL_Delay(ms);
	if(setFreq(c))	      return 1;
	HAL_Delay(ms);
	if(setFreq(old_freq)) return 1;
	return 0;
}

uint8_t buzzer::chirp(float hz, int ms) {
	float old_freq = new_freq;
	if(setFreq(hz))  		return 1;
	HAL_Delay(ms);
	if(setFreq(old_freq)) 	return 1;
	return 0;
}

/*
 * assumes (PRE + 1) = (4 + 1)
 * FREQ = (32e^6) / ((ARR + 1) * (PRE + 1))
 *
 */
uint16_t buzzer::calcFreqPer(float hz) {
	//return (uint16_t) ( ( 6400000 / hz ) - 1.0 );
	return (uint16_t) ( ( FREQ_DIV / hz ) - 1.0 );
}

buzzer::~buzzer() {
	// TODO Auto-generated destructor stub
}

