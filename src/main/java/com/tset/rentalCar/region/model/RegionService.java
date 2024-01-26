package com.tset.rentalCar.region.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.region.mapper.RegionMapper;
import com.tset.rentalCar.region.vo.RegionVo;

@Service
public class RegionService {

	@Autowired
	RegionMapper regionMapper;
	
	
	
	// 지역리스트 조회
	public List<RegionVo> getAllRegions() {
        return regionMapper.findAllRegions();
    }

	
	
	
}
