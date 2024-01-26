package com.tset.rentalCar.region.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tset.rentalCar.region.vo.RegionVo;

@Mapper
public interface RegionMapper {

	/**
	 * 지역 리스트
	 * 
	 * @return
	 */
	List<RegionVo> findAllRegions();

	


}
