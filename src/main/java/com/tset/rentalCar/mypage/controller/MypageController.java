package com.tset.rentalCar.mypage.controller;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;
import com.tset.rentalCar.mypage.model.MypageService;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;

	@Autowired
	HttpSession session;

	// 마이 페이지
	@GetMapping("/mypage.do")
	public String mypageForm(Model model) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo != null) {
			model.addAttribute("userInfo", userInfo);

			return "/mypage/mypage";
		}

		return "redirect:/login.do";
	}

	// 비밀번호 체크
	@PostMapping("/checkPassword")
	@ResponseBody
	public ResponseEntity<?> checkUserPassword(@RequestParam String enteredPassword) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo != null) {
			String userPassword = userInfo.getUserPassword();
			boolean isMatch = mypageService.comparePassword(enteredPassword, userPassword);
			return ResponseEntity.ok(isMatch);
		}
		return ResponseEntity.status(HttpStatus.SC_BAD_REQUEST).body("No user info available");
	}

	// 마이페이지 디테일
	@GetMapping("/myDetail.do")
	public String myDetailFome(Model model) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo != null) {
			int userNo = userInfo.getUserNo();

			// 운전면허 조회
			LicenseVo licensInfo = mypageService.selectlicensInfo(userNo);
			model.addAttribute("licensInfo", licensInfo);
			session.setAttribute("licensInfo", licensInfo);
			// 카드정보 조회
			CardVo carInfo = mypageService.selectcarInfo(userNo);
			session.setAttribute("carInfo", carInfo);
			model.addAttribute("carInfo", carInfo);

			return "/mypage/detail/myDetail";
		}

		return "redirect:/login.do";
	}

	// 비밀번호 체크
	@PostMapping("/checkNewPassword")
	@ResponseBody
	public boolean checkNewPassword(@RequestParam("newPwd") String newPwd) {
		UserVo currentUser = (UserVo) session.getAttribute("userInfo");

		if (currentUser != null) {
			// 세션에서 현재 사용자의 암호화된 비밀번호를 가져옵니다.
			String currentPassword = currentUser.getUserPassword();

			// 서비스 레이어의 isNewPasswordDifferent 메소드를 호출하여 새 비밀번호와 기존 비밀번호를 비교합니다.
			return mypageService.isNewPasswordDifferent(newPwd, currentPassword);
		}

		return false;
	}

	// 비밀번호 변경
	@PostMapping("/changePassword")
	@ResponseBody
	public void changePassword(@RequestParam("newPassword") String newPassword) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		int userNo = userInfo.getUserNo();
		mypageService.changePassword(newPassword, userNo);
	}

	// 휴대폰 번호 변경
	@PostMapping("/updatePhoneNumber")
	@ResponseBody
	public void changePhone(@RequestParam("newPhoneNumber") String newPhoneNumber) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		int userNo = userInfo.getUserNo();
		mypageService.changePhone(newPhoneNumber, userNo);
		// 업데이트 후, 업데이트된 사용자 정보를 가져옵니다.
		UserVo updatedUserInfo = mypageService.getUserInfo(userNo);
		// 세션에서 userInfo 객체를 업데이트합니다.
		session.setAttribute("userInfo", updatedUserInfo);
	}

	// 주소 업데이트
	@PostMapping("/update-address")
	@ResponseBody
	public void deleteAddress(@RequestParam("userAddress1") String userAddress1,
			@RequestParam("userAddress2") String userAddress2, @RequestParam("userAddress3") String userAddress3) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		int userNo = userInfo.getUserNo();
		mypageService.deleteUserAddresses(userNo, userAddress1, userAddress2, userAddress3);
		// 사용자 정보를 다시 조회
		UserVo updatedUserInfo = mypageService.getUserInfo(userNo);

		// 세션에 최신 사용자 정보 설정
		session.setAttribute("userInfo", updatedUserInfo);
	}

	@GetMapping("/getUpdatedAddress")
	public String getUpdatedAddress(Model model) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		int userNo = userInfo.getUserNo();
		// 사용자 정보를 다시 조회
		UserVo updatedUserInfo = mypageService.getUserInfo(userNo);
		// 세션에 최신 사용자 정보 설정
		session.setAttribute("userInfo", updatedUserInfo);

		model.addAttribute("userInfo", updatedUserInfo);
		return "/mypage/detail/change/addNew";
	}

	// 운전면허 삭제
	@PostMapping("/delect-license")
	@ResponseBody
	public void deletelicense() {
		LicenseVo licensInfo = (LicenseVo) session.getAttribute("licensInfo");
		int userNo = licensInfo.getUserNo();
		mypageService.deleteUserlicense(userNo);
		// 사용자 정보를 다시 조회
		LicenseVo updatedlicensInfo = mypageService.getlicensInfo(userNo);
		// 세션에 최신 사용자 정보 설정
		session.setAttribute("licensInfo", updatedlicensInfo);
	}

	@GetMapping("/getUpdatedlicense")
	public String getUpdatedlicense(Model model) {
		LicenseVo licensInfo = (LicenseVo) session.getAttribute("licensInfo	");

		model.addAttribute("licensInfo", licensInfo);
		return "/mypage/detail/change/licenseNew";
	}

	// 주소 업데이트 폼
	@GetMapping("/mypage/info/address")
	public String addChange(Model model) {
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		model.addAttribute("userInfo", userInfo);
		return "/mypage/detail/info/address";
	}

	// 주소 업데이트
	@PostMapping("/updateAddress")
	@ResponseBody
	public String updateAddress(@RequestParam("zipNo") String zipNo, @RequestParam("addr") String addr,
			@RequestParam("dtlAddr") String dtlAddr) {


		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo == null) {
			return "세션이 만료되었습니다";
		}
		int userNo = userInfo.getUserNo();

		try {
			boolean updateSuccess = mypageService.updateAddress(userNo, zipNo, addr, dtlAddr);
			if (updateSuccess) {
				UserVo updatedUserInfo = mypageService.getUserInfo(userNo);
				session.setAttribute("userInfo", updatedUserInfo);
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return "error";
		}
	}

	// 운전면허 업데이트 폼
	@GetMapping("/mypage/info/license")
	public String licenseChange(Model model) {
		LicenseVo licensInfo = (LicenseVo) session.getAttribute("licensInfo");
		model.addAttribute("licensInfo", licensInfo);
		return "/mypage/detail/info/license";
	}

	// 주소 업데이트
	@PostMapping("/updatelicense")
	@ResponseBody
	public String updateLicense(@RequestParam("licenseType") String licenseType,
	                            @RequestParam("licenseNumber") String licenseNumber, 
	                            @RequestParam("issueDate") String issueDate,
	                            @RequestParam("expirationDate") String expirationDate) {
	    
	    LicenseVo licensInfo = (LicenseVo) session.getAttribute("licensInfo");
	    UserVo userInfo = (UserVo) session.getAttribute("userInfo");

	    if (userInfo == null) {
	        return "세션이 만료되었습니다"; // 사용자 정보가 없으면 오류 반환
	    }

	    int userNo = userInfo.getUserNo();

	    try {
	        if (licensInfo == null) {
	            // 운전면허 정보가 없으면 새로운 정보 삽입
	            mypageService.insertLicenseInfo(userNo, licenseType, licenseNumber, issueDate, expirationDate);
	            System.out.println("insert");
	        } else {
	            // 기존 운전면허 정보 업데이트
	            mypageService.updateLicenseInfo(userNo, licenseType, licenseNumber, issueDate, expirationDate);
	        }
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 로깅
	        return "error";
	    }
	}
	//회원 삭제
	@PostMapping("/deactivate-account")
	@ResponseBody
	public ResponseEntity<?> deactivateAccount() {
	    UserVo userInfo = (UserVo) session.getAttribute("userInfo");

	    if (userInfo != null) {
	        int userNo = userInfo.getUserNo();
	        mypageService.deactivateUser(userNo);
	     // 세션 무효화
	        session.invalidate();
	        return ResponseEntity.ok().build(); // 성공적으로 처리됨을 응답
	    } else {
	        return ResponseEntity.status(HttpStatus.SC_UNAUTHORIZED).body("사용자 정보를 찾을 수 없습니다."); // 사용자 정보가 없을 경우 오류 응답
	    }
	}
}
