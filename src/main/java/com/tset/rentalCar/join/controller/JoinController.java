package com.tset.rentalCar.join.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tset.rentalCar.join.model.JoinService;
import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;

@Controller
public class JoinController {
	@Autowired
	JoinService joinService;

	@Autowired
	PasswordEncoder passwordEncoder;

	// 휴대폰 중복 체크
	@GetMapping("/check-phone")
	public ResponseEntity<?> checkPhoneNumberExists(@RequestParam String phone) {
	    boolean exists = joinService.isPhoneNumberExists(phone);
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("exists", exists);
	    return ResponseEntity.ok().body(response);
	}

	// 휴대폰 인증
	@PostMapping("/sendSMS.dox")
	@ResponseBody
	public String sendSMS(@RequestParam String userPhon, Model model) {

		System.out.println("핸드폰 번호 : " + userPhon);

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		model.addAttribute("numStr", numStr);

		joinService.certifiedPhoneNumber(userPhon, numStr);
		return numStr;
	}

	// 회원가입 약관동의 및 아이디 비밀번호 입력
	@PostMapping("/clickWrap.do")
	public String clickWrapForm(@RequestParam("userName") String userName, @RequestParam("userPhone") String userPhone,
			Model model) {
		model.addAttribute("userName", userName);
		model.addAttribute("userPhone", userPhone);

		return "/join/clickWrap";
	}

	// 아이디 중복 체크
	@PostMapping("/check-id")
	@ResponseBody
	public boolean checkId(@RequestParam String userId) {
		// 서비스 메서드를 호출하여 ID가 사용 가능한지 확인
		boolean isDuplicate = !joinService.isIdAvailable(userId);

		return isDuplicate;
	}

	// 회원가입 주소 입력
	@PostMapping("/address.do")
	public String addressForm(@RequestParam("userName") String userName, @RequestParam("userPhone") String userPhone,
			@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword, Model model) {
		model.addAttribute("userPassword", userPassword);
		model.addAttribute("userId", userId);
		model.addAttribute("userName", userName);
		model.addAttribute("userPhone", userPhone);

		return "/join/address";
	}

	// 운전면허 등록
	@PostMapping("license.do")
	public String licenseForm(@RequestParam("userName") String userName, @RequestParam("userPhone") String userPhone,
			@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword,
			@RequestParam(value = "userAddress1", required = false) String userAddress1,
			@RequestParam(value = "userAddress2", required = false) String userAddress2,
			@RequestParam(value = "userAddress3", required = false) String userAddress3, Model model) {

		model.addAttribute("userId", userId);
		model.addAttribute("userPassword", userPassword);
		model.addAttribute("userName", userName);
		model.addAttribute("userPhone", userPhone);

		if (userAddress1 != null)
			model.addAttribute("userAddress1", userAddress1);
		if (userAddress2 != null)
			model.addAttribute("userAddress2", userAddress2);
		if (userAddress3 != null)
			model.addAttribute("userAddress3", userAddress3);

		return "/join/license";
	}

	// 카드 등록
	@PostMapping("/paymentReg.do")
	public String paymentRegForm(@RequestParam("userName") String userName, @RequestParam("userPhone") String userPhone,
			@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword,
			@RequestParam(value = "userAddress1", required = false) String userAddress1,
			@RequestParam(value = "userAddress2", required = false) String userAddress2,
			@RequestParam(value = "userAddress3", required = false) String userAddress3,
			@RequestParam(value = "licenseType", required = false) String licenseType,
			@RequestParam(value = "licenseNumber", required = false) String licenseNumber,
			@RequestParam(value = "issueDate", required = false) String issueDate,
			@RequestParam(value = "expirationDate", required = false) String expirationDate, Model model) {

		model.addAttribute("userId", userId);
		model.addAttribute("userPassword", userPassword);
		model.addAttribute("userId", userId);
		model.addAttribute("userPassword", userPassword);
		model.addAttribute("userName", userName);
		model.addAttribute("userPhone", userPhone);

		if (userAddress1 != null)
			model.addAttribute("userAddress1", userAddress1);
		if (userAddress2 != null)
			model.addAttribute("userAddress2", userAddress2);
		if (userAddress3 != null)
			model.addAttribute("userAddress3", userAddress3);
		if (licenseType != null)
			model.addAttribute("licenseType", licenseType);
		if (licenseNumber != null)
			model.addAttribute("licenseNumber", licenseNumber);
		if (issueDate != null)
			model.addAttribute("issueDate", issueDate);
		if (expirationDate != null)
			model.addAttribute("expirationDate", expirationDate);

		return "/join/paymentReg";
	}

	// 회원가입 실행
	@PostMapping("/join.dox")
	public String joinDox(UserVo userVo, LicenseVo licenseVo, CardVo cardVo) {

		joinService.createUser(userVo, licenseVo, cardVo);

		return "redirect:/login.do";
	}

}
