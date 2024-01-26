package com.tset.rentalCar.mypage.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;
import com.tset.rentalCar.mypage.mapper.MypageMapper;
import com.tset.rentalCar.mypage.vo.MypageVo;

@Service
public class MypageService {

	@Autowired
	MypageMapper mypageMapper;
	@Autowired
	HttpSession session;
	@Autowired
	PasswordEncoder passwordEncoder;

	// 세션에서 사용자 정보를 가져와서 비밀번호를 비교하는 메소드
	public boolean checkUserPassword(String enteredPassword) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo != null) {
			String userPassword = userInfo.getUserPassword();
			return comparePassword(enteredPassword, userPassword);
		}
		return false;
	}

	// 입력된 비밀번호와 세션에 저장된 암호화된 비밀번호 비교
	public boolean comparePassword(String enteredPassword, String userPassword) {
		return passwordEncoder.matches(enteredPassword, userPassword);
	}

//	// 내정보 조회
//	public MypageVo myInfo(int userNo) {
//		return mypageMapper.myInfo(userNo);
//	}

	// 비밀번호 체크
	// 새 비밀번호가 기존 비밀번호와 다른지 확인
	public boolean isNewPasswordDifferent(String newRawPassword, String currentEncryptedPassword) {
		// 새 비밀번호를 암호화하여 기존 비밀번호와 비교
		return !passwordEncoder.matches(newRawPassword, currentEncryptedPassword);
	}

	// 비밀번호 변경
	public void changePassword(String newPassword, int userNo) {

		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(newPassword);

		mypageMapper.changePassword(encodedPassword, userNo);
	}

	// 휴대번호 변경
	public void changePhone(String newPhoneNumber, int userNo) {

		mypageMapper.changePhone(newPhoneNumber, userNo);

	}

	// 주소 삭제(업데이트)
	public void deleteUserAddresses(int userNo, String userAddress1, String userAddress2, String userAddress3) {
		mypageMapper.deleteUserAddresses(userNo, userAddress1, userAddress2, userAddress3);
	}

	// 운전면허 삭제
	public void deleteUserlicense(int userNo) {
		mypageMapper.deleteUserlicense(userNo);

	}

	// 운전면허 조회
	public LicenseVo selectlicensInfo(int userNo) {

		return mypageMapper.selectlicensInfo(userNo);
	}

	// 카드정보 조회
	public CardVo selectcarInfo(int userNo) {
		// TODO Auto-generated method stub
		return mypageMapper.selectcarInfo(userNo);
	}

	// 업데이트 된 사용자 정보
	public UserVo getUserInfo(int userNo) {
		return mypageMapper.getUserInfo(userNo);
	}

	// 업데이트 된 운전면허
	public LicenseVo getlicensInfo(int userNo) {
		return mypageMapper.getlicensInfo(userNo);
	}

	public boolean updateAddress(int userNo, String zipNo, String addr, String dtlAddr) {
		return mypageMapper.updateAddress(userNo, zipNo, addr, dtlAddr);
	}

	// 운전면허 업데이트
	public boolean updatelicensInfo(int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate) {
		return false;
	}

	// 운전자 정보 삽입
	public boolean insertLicenseInfo(int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate) {
		return mypageMapper.insertLicenseInfo(userNo, licenseType, licenseNumber, issueDate, expirationDate) > 0;
	}

	// 운전자 정보 업데이트
	public boolean updateLicenseInfo(int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate) {
		return mypageMapper.updateLicenseInfo(userNo, licenseType, licenseNumber, issueDate, expirationDate) > 0;
	}
		
	
	// 회원정보 삭제(수정날자 업데이트)
	public void deactivateUser(int userNo) {
		 mypageMapper.deactivateUser(userNo);
	}

}
