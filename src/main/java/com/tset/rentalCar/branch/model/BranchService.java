package com.tset.rentalCar.branch.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.branch.mapper.BranchMapper;
import com.tset.rentalCar.branch.vo.BranchVo;

@Service
public class BranchService {
	
	@Autowired
	BranchMapper branchMapper;
	
	// 지점 조회
	public List<BranchVo> getBranchesByRegion(int regionNo) {
		return  branchMapper.getBranchesByRegion(regionNo);
	}

	// 지점 검색
	public List<BranchVo> searchBranches(String searchQuery) {
		// TODO Auto-generated method stub
		return branchMapper.searchBranches(searchQuery);
	}

}
