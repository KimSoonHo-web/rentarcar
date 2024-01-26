package com.tset.rentalCar.login.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.tset.rentalCar.login.mapper.LoginMapper;
import com.tset.rentalCar.login.vo.UserVo;

@Service
public class LoginService {

	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
    PasswordEncoder passwordEncoder;


	  public UserVo authenticateUser(String userId, String userPassword) {
		  
	        UserVo userVo = loginMapper.findByUserId(userId);
	        if (userVo != null && passwordEncoder.matches(userPassword, userVo.getUserPassword())) {
	            return userVo; // 인증 성공
	            
	        }

	        return null; // 인증 실패
	    }
	  
	  
	//	아이디 찾기
	public UserVo checkMember(String userName, String userPhone) {
		return loginMapper.checkMember(userName,userPhone);
	}
	}
