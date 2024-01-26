package com.tset.rentalCar.reservation.mapper;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface ReservationMapper {
	
	/**
	 * 
	 * @param carNo
	 * @param userNo
	 * @param dateTime 
	 * @param amount
	 * @return
	 */
	void insertReservation(int carNo, int userNo, int reTotalPrice, String dateTime);
	

}
