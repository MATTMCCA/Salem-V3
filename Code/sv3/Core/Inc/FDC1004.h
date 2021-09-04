/*
 * FDC1004.h
 *
 *  Created on: Aug 1, 2021
 *      Author: Matt
 *
 *      - Spliced together github code and TI sample code
 *      						[see repo for sample code]
 *      - org: https://github.com/Protocentral/ProtoCentral_fdc1004_breakout
 *
 *      - Made a few small changes
 *      - Now compatible with STM
 *
 */

#ifndef FDC1004_H_
#define FDC1004_H_

#include <cstdint>
#include "i2c.h"

#define FDC1004_100HZ (0x01)
#define FDC1004_200HZ (0x02)
#define FDC1004_400HZ (0x03)
#define FDC1004_IS_RATE(x) (x == FDC1004_100HZ || x == FDC1004_200HZ || x == FDC1004_400HZ)

#define FDC1004_CAPDAC_MAX (0x1F)

#define FDC1004_CHANNEL_MAX (0x03)
#define FDC1004_IS_CHANNEL(x) (x >= 0 && x <= FDC1004_CHANNEL_MAX)

#define FDC1004_MEAS_MAX (0x03)
#define FDC1004_IS_MEAS(x) (x >= 0 && x <= FDC1004_MEAS_MAX)

#define FDC_REGISTER (0x0C)

static const uint8_t ADDRESS 			= 0b10100000;
static const uint8_t MEAS_CONFIG[4] 	= {0x08, 0x09, 0x0A, 0x0B};
static const uint8_t MEAS_MSB[4] 		= {0x00, 0x02, 0x04, 0x06};
static const uint8_t MEAS_LSB[4] 		= {0x01, 0x03, 0x05, 0x07};

static const float CAPDAC_MULTI			= 3.125;
static const float CONSTA 				= 2048.0;
static const float CONSTB 				= 1048576.0;

class FDC1004 {

public:
	FDC1004();
	FDC1004(uint16_t rate, I2C_HandleTypeDef* i2c);

	uint8_t configureMeasurementSingle(uint8_t measurement, uint8_t channel, uint8_t capdac);
	uint8_t triggerSingleMeasurement(uint8_t measurement, uint8_t rate);
	uint8_t readMeasurement(uint8_t measurement, uint32_t *value);
	uint8_t readCap(uint8_t measurement, float* ptr);

	virtual ~FDC1004();

private:
	HAL_StatusTypeDef read16(uint8_t reg, uint16_t *ptr);
	HAL_StatusTypeDef write16(uint8_t reg, uint16_t ptr);

protected:

	I2C_HandleTypeDef* hi2c;

	uint8_t _rate;
	uint8_t lb1, lb2, lb3;
	uint16_t fdc_register, msb, lsb;

	unsigned int lbb1, lbb2, lbb3;

	float _capdac;

};

#endif /* FDC1004_H_ */
