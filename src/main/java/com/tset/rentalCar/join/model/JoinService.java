package com.tset.rentalCar.join.model;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.join.mapper.JoinMapper;
import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class JoinService {

	@Autowired
	JoinMapper joinMapper;
	
	@Autowired
     PasswordEncoder passwordEncoder;
	
	// 휴대폰 중복 검사
	 public boolean isPhoneNumberExists(String phone) {
	        return joinMapper.checkPhoneNumberExists(phone) > 0;
	    }
	
	

	// 아이디 중복검사
	public boolean isIdAvailable(String userId) {
		// joinMapper를 사용하여 ID가 데이터베이스에 존재하는지 확인
		return joinMapper.countById(userId) == 0;
	}

	// 휴대폰 인증
	public void certifiedPhoneNumber(String userPhon, String cerNum) {

		String api_key = "NCS5A6B7M9WDC6RT";
		String api_secret = "YW943QDUWRVTNLZMUQ5VV1HSQW1M7ZYK";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhon); // 수신전화번호
		params.put("from", userPhon); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "랜터카 휴대폰인증 테스트 메시지 : 인증번호는" + "[" + cerNum + "]" + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	// 회원 가입
	public void createUser(UserVo userVo, LicenseVo licenseVo, CardVo cardVo) {

		// 비밀번호 암호화
		String encodedPassword = passwordEncoder.encode(userVo.getUserPassword());
		userVo.setUserPassword(encodedPassword); // 암호화된 비밀번호 설정

		joinMapper.insertUser(userVo); // 회원 정보 삽입

		// 운전 면허 정보가 제공되었는지 확인
		if (licenseVo.getLicenseType() != null) {
			licenseVo.setUserNo(userVo.getUserNo()); // 생성된 사용자 ID 설정
			joinMapper.insertLicense(licenseVo); // 운전 면허 정보 삽입
		}

		// 카드 정보가 제공되었는지 확인
		if (cardVo.getCardClsNm() != null) {
			cardVo.setUserNo(userVo.getUserNo()); // 생성된 사용자 ID 설정
			joinMapper.insertCard(cardVo); // 카드 정보 삽입
		}
	}


}
