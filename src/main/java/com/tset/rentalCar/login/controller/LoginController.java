package com.tset.rentalCar.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tset.rentalCar.login.model.LoginService;
import com.tset.rentalCar.login.vo.UserVo;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	@Autowired
	HttpSession session;

	// 로그인
	@GetMapping("/login.do")
	public String LoinForm() {
		session.invalidate();
		
		return "/login/login";
	}

	// 로그인 실행
	@PostMapping("/login.dox")
	@ResponseBody
	public String handleLogin(@RequestParam("userId") String userId, @RequestParam("userPassword") String userPassword,
			Model model) {

		UserVo userInfo = loginService.authenticateUser(userId, userPassword);

		if (userInfo != null) {
			// 회원 탈퇴 여부 확인
			String userDeleted = userInfo.getUserDelete();
			if (userDeleted != null) {
				// userDelete 값이 있다면 로그인 거부
				return "deactivated"; // 회원 탈퇴된 계정임을 나타내는 응답
			}

			// 로그인 성공 처리
			session.setAttribute("userInfo", userInfo);
			model.addAttribute("userInfo", userInfo);

			return "success"; // 로그인 성공
		}

		return "fail"; // 로그인 실패

	}

	// 로그아웃
	@PostMapping("/logout.dox")
	@ResponseBody
	public String handleLogout() {

		session.invalidate();

		return "success";
	}

	// 로그아웃 후 헤더
	@GetMapping("/fetchHeaderContent")
	public String getHeaderContent(Model model) {

		return "/common/new/header";
	}

	// 아이디 찾기
	@GetMapping("/checkMember")
	@ResponseBody
	public String checkMember(@RequestParam String userName, @RequestParam String userPhone) {
		UserVo userVo = loginService.checkMember(userName, userPhone);
		if (userVo != null) {
			// 회원 정보가 존재하는 경우
			session.setAttribute("userInfo", userVo);
			return "success";
		} else {
			// 회원 정보가 존재하지 않는 경우
			return "fail";
		}
	}

	// 로그인 비밀번호 찾기 폼
	@GetMapping("/find.do")
	public String idPwform(Model model) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");

		// userInfo가 null이면 로그인 페이지로 리디렉션
		if (userInfo == null) {
			return "redirect:/login.do";
		}

		model.addAttribute("userInfo", userInfo);
		return "/login/find/findAcc";
	}

}
