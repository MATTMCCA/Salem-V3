/*
 * buzzer.h
 *
 *  Created on: Aug 2, 2021
 *      Author: Matt
 */

#ifndef BUZZER_H_
#define BUZZER_H_

#include "tim.h"

static const uint16_t PRESCALE 	= 4;
static const float FREQ_DIV 	= 32000000.0 / (PRESCALE + 1); /* 32Mhz = Timer Clock */

class buzzer {
public:

	buzzer();
	uint8_t init(TIM_HandleTypeDef *htim, uint32_t Channel);
	uint8_t start(void);
	uint8_t stop(void);
	uint8_t setFreq(float hz);
	uint8_t chirp(float hz, int ms);
	uint8_t chime(float a, float b, float c, int ms);

	virtual ~buzzer();

private:

	uint16_t calcFreqPer(float hz);

protected:

	TIM_HandleTypeDef *btim;
	uint32_t chan;
	float new_freq = 0;
};

#endif /* BUZZER_H_ */
