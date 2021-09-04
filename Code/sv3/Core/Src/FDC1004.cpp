/*
 * FDC1004.cpp
 *
 *  Created on: Aug 1, 2021
 *      Author: Matt
 *
 *      - Spliced together github code and TI sample code
 *      						[see repo for sample code]
 *
 *      - Made a few small changes
 *      - Now compatible with STM
 *
 */

#include "FDC1004.h"


FDC1004::FDC1004() {
	// TODO Auto-generated constructor stub

}

FDC1004::FDC1004(uint16_t rate, I2C_HandleTypeDef* i2c) {
	_rate = rate;
	hi2c = i2c;
}

uint8_t FDC1004::configureMeasurementSingle(uint8_t measurement, uint8_t channel, uint8_t capdac) {
	_capdac = capdac * CAPDAC_MULTI;

    //Verify data
    if (!FDC1004_IS_MEAS(measurement) || !FDC1004_IS_CHANNEL(channel) || capdac > FDC1004_CAPDAC_MAX)
        return 1;

    //build 16 bit configuration
    uint16_t configuration_data;
    configuration_data =  ((uint16_t) channel) << 13; 					//CHA
    configuration_data |= ((uint16_t) 0x04)    << 10; 					//CHB disable / CAPDAC enable
    configuration_data |= ((uint16_t) capdac)  << 5;  					//CAPDAC value
    if(write16(MEAS_CONFIG[measurement], configuration_data) != HAL_OK)
    	return 1;

    return 0;
}

uint8_t FDC1004::triggerSingleMeasurement(uint8_t measurement, uint8_t rate) {
    if (!FDC1004_IS_MEAS(measurement) || !FDC1004_IS_RATE(rate)) //verify data
    	return 1;

    uint16_t trigger_data;
    trigger_data = ((uint16_t) rate) << 10; 			// sample rate
    trigger_data |= 0 << 8; 							// repeat disabled
    trigger_data |= (1 << (7 - measurement)); 			// 0 > bit 7, 1 > bit 6, etc
    if(write16(FDC_REGISTER, trigger_data) != HAL_OK)
    	return 1; 										//error

    return 0;
}

uint8_t FDC1004::readMeasurement(uint8_t measurement, uint32_t *value) {
    if (!FDC1004_IS_MEAS(measurement))                  return 1; //error

    //check if measurement is complete
    if(read16(FDC_REGISTER, &fdc_register) != HAL_OK)   return 1; //error
    if (! (fdc_register & ( 1 << (3 - measurement))))   return 2; //still processing

    //read the value
    if(read16(MEAS_MSB[measurement], &msb) != HAL_OK)   return 1; //error
    if(read16(MEAS_LSB[measurement], &lsb) != HAL_OK)   return 1; //error

    *value = (msb << 8) | (lsb >> 8);

    return 0;
}

uint8_t FDC1004::readCap(uint8_t measurement, float* ptr) {
	uint32_t value;
	uint8_t ret = readMeasurement(measurement, &value);
	if(ret != 0) return ret;

	lb1 = (value >> 16) & 0xFF;
	lb2 = (value >> 8) & 0xFF;
	lb3 = value & 0xFF;

	lbb1 = lb1 * 256 + lb2;
	lbb2 = lbb1 >> 11;
	lbb3 =  0x7FF & lbb1;

	*ptr = lbb2 + ((float)lbb3/CONSTA) + ((float)lb3/CONSTB) + _capdac;

	return 0;
}

HAL_StatusTypeDef FDC1004::read16(uint8_t reg, uint16_t *ptr) {
	HAL_StatusTypeDef ret;
	ret = HAL_I2C_Master_Transmit(hi2c, ADDRESS, &reg, 1, HAL_MAX_DELAY);
	if(ret != HAL_OK) return ret;
	ret = HAL_I2C_Master_Receive(hi2c, ADDRESS, (uint8_t*)ptr, 2, HAL_MAX_DELAY);
	*ptr = ((*ptr >> 8) & 0xFF) | (*ptr << 8);

	return ret;
}

HAL_StatusTypeDef FDC1004::write16(uint8_t reg, uint16_t ptr) {

	uint8_t RX[3] = { reg, (uint8_t)((ptr >> 8) & 0xFF), (uint8_t) (ptr & 0xFF) };

	return HAL_I2C_Master_Transmit(hi2c, ADDRESS, RX, 3, HAL_MAX_DELAY);
}

FDC1004::~FDC1004() {
	// TODO Auto-generated destructor stub
}

