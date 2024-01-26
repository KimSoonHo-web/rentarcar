package com.tset.rentalCar.branch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tset.rentalCar.branch.vo.BranchVo;

@Mapper
public interface BranchMapper {
	
	/**
	 *  지역번호로 지점 조회
	 * @param regionNo
	 * @return
	 */
	List<BranchVo> getBranchesByRegion(int regionNo);
	
	
	/**
	 * 지점 검색
	 * @param searchQuery
	 * @return
	 */
	List<BranchVo> searchBranches(String searchQuery);

}
