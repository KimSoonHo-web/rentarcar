package com.tset.rentalCar.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;

@Mapper
public interface MypageMapper {
//	
//	/**
//	 * MY 페이지 내정보 조회
//	 * @param userNo 내정보 조회
//	 * @return
//	 */
//	MypageVo myInfo(int userNo);

	/**
	 * 비밀번호 변경
	 * 
	 * @param encodedPassword 암호화한 비밀번호 삽입
	 * @param userNo          유저 번호 조회
	 */
	void changePassword(String encodedPassword, int userNo);

	/**
	 * 휴대폰 번호 변경
	 * 
	 * @param newPhoneNumber 전화번호 삽입
	 * @param userNo         유저번호 조회
	 */
	void changePhone(String newPhoneNumber, int userNo);

	/**
	 * 주소 삭제
	 * 
	 * @param userNo       유저 번호로 주소 조회 후 삭제
	 * @param userAddress1
	 * @param userAddress2
	 * @param userAddress3
	 * @return
	 */
	int deleteUserAddresses(int userNo, String userAddress1, String userAddress2, String userAddress3);
	
	/**
	 * 운전면허 삭제
	 * @param userNo
	 */
	void deleteUserlicense(int userNo);

	/**
	 * 운전면허 조회
	 * @param userNo
	 * @return
	 */
	LicenseVo selectlicensInfo(int userNo);

	/**
	 * 카드정보 조회
	 * @param userNo
	 * @return
	 */
	CardVo selectcarInfo(int userNo);
	
	/**
	 * 유저 정보 업데이트
	 * @param userNo
	 * @return
	 */
	UserVo getUserInfo(int userNo);
	
	/**
	 * 운전면허 업데이트
	 * @param userNo
	 * @return
	 */
	LicenseVo getlicensInfo(int userNo);
	
	/**
	 * 주소 업데이트
	 * @param userNo
	 * @param zipNo
	 * @param addr
	 * @param dtlAddr
	 * @return
	 */
	boolean updateAddress(int userNo, String zipNo, String addr, String dtlAddr);

	/**
	 * 운전면허 삽입
	 * @param userNo 
	 * @param licenseType
	 * @param licenseNumber
	 * @param issueDate
	 * @param expirationDate
	 * @return
	 */
	int insertLicenseInfo(int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate);
	
	/**
	 * 운전면허 업데이트
	 * @param userNo
	 * @param licenseType
	 * @param licenseNumber
	 * @param issueDate
	 * @param expirationDate
	 * @return
	 */
	int updateLicenseInfo(int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate);
	
	/**
	 * 유저정보 삭제 ( 삭제날자 업데이트)
	 * @param userNo
	 */
	void deactivateUser(int userNo);
	
	
}
