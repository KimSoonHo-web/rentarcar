package com.tset.rentalCar.join.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;

@Mapper
public interface JoinMapper {
	
	/**
	 * 휴대폰 중복 검사
	 * @param phone
	 * @return
	 */
	 int checkPhoneNumberExists(@Param("phone") String phone);

	/**
	 * 
	 * @param userId 유저 아이디로 확인
	 * @return 값이 있으면 1 , 없으면 0 
	 */
	int countById(@Param("userId") String userId);
	
	
	/**회원정보
	 * @param userVo  회원정보
	 */
	void insertUser(UserVo userVo);

	
	/**
	 * @param licenseVo  운전면허 정보
	 */
	void insertLicense(LicenseVo licenseVo);

	/**
	 * 
	 * @param cardVo  카드번호 
	 */
	void insertCard(CardVo cardVo);


}
