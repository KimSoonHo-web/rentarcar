package com.tset.rentalCar.login.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tset.rentalCar.login.vo.UserVo;

@Mapper
public interface LoginMapper {
	
	
	
	/**
	 * 
	 * @param userId 유저 아이디로 조회
	 * @return
	 */
	UserVo findByUserId(String userId);
	
	/**
	 * 아이디 찾기
	 * @param userName
	 * @param userPhone
	 * @return
	 */
	UserVo checkMember(String userName, String userPhone);
	
	

	
}
