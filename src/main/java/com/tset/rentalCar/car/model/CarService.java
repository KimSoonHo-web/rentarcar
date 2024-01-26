package com.tset.rentalCar.car.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.car.mapper.CarMapper;
import com.tset.rentalCar.car.vo.CarDetailVo;
import com.tset.rentalCar.car.vo.CarListVo;

@Service
public class CarService {
	
	@Autowired
	CarMapper carMapper;
	
	// 차량 리스트 조회
	public List<CarListVo> carList(String branchName) {
		
		
		return carMapper.carList(branchName);
	}
	
	// 차량 디테일
	public CarDetailVo carDetail(int carNo) {
		
		return carMapper.carDetail(carNo);
	}
}
