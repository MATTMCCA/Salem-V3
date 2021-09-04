/*
 * system.h
 *
 *  Created on: Aug 14, 2021
 *      Author: Matt
 */

#ifndef SYSTEM_H_
#define SYSTEM_H_

#include "adc.h"

#define ADC_TIMEOUT 500 //make bigger if adc failure

#define TS_CAL1 *((uint16_t*) 0x1FF8007A) 							//30* @ 3v
#define TS_CAL2 *((uint16_t*) 0x1FF8007E) 							//130* @ 3v

#define cal_1 (TS_CAL1 * (3.3/3.0))									//scaled to 3.3v
#define cal_2 (TS_CAL2 * (3.3/3.0))									//scaled to 3.3v

static const float AVG_SLOPE = (130.0 - 30.0) / (cal_2 - cal_1);	//slope for temp curve

class system {
public:
	system();
	system(ADC_HandleTypeDef* adcHandle);
	virtual ~system();

	uint8_t init();
	uint8_t update(void);

	float getTemp(void);
	float getVBat(void);
	uint8_t vbatCompare(float value);

private:
	float calcVbat(uint32_t raw_adc);
	float calcTemp(uint32_t raw_adc);

protected:
	ADC_HandleTypeDef* adch;
	uint32_t RAW[2];
	float vbat, tmp;

};

#endif /* SYSTEM_H_ */
