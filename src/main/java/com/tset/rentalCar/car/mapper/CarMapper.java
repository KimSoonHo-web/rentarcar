package com.tset.rentalCar.car.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tset.rentalCar.car.vo.CarDetailVo;
import com.tset.rentalCar.car.vo.CarListVo;

@Mapper
public interface CarMapper {
	
	/**
	 *  차량 리스트 조회
	 * @param branch
	 * @return
	 */
	List<CarListVo> carList(String branchName);

	/**
	 *  차량 디테일
	 * @param carNo
	 * @return
	 */
	CarDetailVo carDetail(int carNo);

}
