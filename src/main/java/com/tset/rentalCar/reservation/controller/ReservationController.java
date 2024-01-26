package com.tset.rentalCar.reservation.controller;

import java.awt.Window;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tset.rentalCar.car.model.CarService;
import com.tset.rentalCar.car.vo.CarDetailVo;
import com.tset.rentalCar.join.vo.CardVo;
import com.tset.rentalCar.join.vo.LicenseVo;
import com.tset.rentalCar.login.vo.UserVo;
import com.tset.rentalCar.mypage.model.MypageService;
import com.tset.rentalCar.reservation.model.ReservationService;
import com.tset.rentalCar.reservation.vo.KakaoReadyResponse;
import com.tset.rentalCar.reservation.vo.PaymentRequest;
import com.tset.rentalCar.reservation.vo.ReservationVo;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reservationService;
	@Autowired
	CarService carService;
	@Autowired
	HttpSession session;
	@Autowired
	MypageService mypageService;

	// 예약 폼
	@GetMapping("reservation.do")
	public String ReservationForm(int carNo, String date, Model model) {

		// 회원정보 조회
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		model.addAttribute("userInfo", userInfo);
		if (userInfo == null) {
			return "redirect:/login.do";
		}
		int userNo = userInfo.getUserNo();
		// 운전면허 조회
		LicenseVo licensInfo = mypageService.selectlicensInfo(userNo);
		// 자동차 디테일 조회
		CarDetailVo carDetail = carService.carDetail(carNo);
		model.addAttribute("carDetail", carDetail);
		model.addAttribute("licensInfo", licensInfo);
		model.addAttribute("date", date);

		return "/reservation/reservation";
	}

	// 결제 페이지
	@PostMapping("/payForm.do")
	public String payForm(String date, int carNo, int userNo, Model model, int priceRegular, int insurancePremium,
			int memberDiscount, int totalPayment) {

		System.out.println("금액 내용 : " + priceRegular);
		System.out.println("금액 내용 : " + insurancePremium);
		System.out.println("금액 내용 : " + memberDiscount);
		System.out.println("금액 내용 : " + totalPayment);
		model.addAttribute("priceRegular", priceRegular);
		model.addAttribute("insurancePremium", insurancePremium);
		model.addAttribute("memberDiscount", memberDiscount);
		model.addAttribute("totalPayment", totalPayment);
		model.addAttribute("date", date);
		// 운전면허 조회
		LicenseVo licensInfo = mypageService.selectlicensInfo(userNo);
		System.out.println("licensInfo : " + licensInfo);
		model.addAttribute("licensInfo", licensInfo);

		// 카드정보 조회
		CardVo cardInfo = mypageService.selectcarInfo(userNo);
		System.out.println("cardInfo : " + cardInfo);
		model.addAttribute("cardInfo", cardInfo);

		// 자동차 디테일 조회
		CarDetailVo carDetail = carService.carDetail(carNo);
		System.out.println("carDetail : " + carDetail);
		model.addAttribute("carDetail", carDetail);

		return "/reservation/payment";
	}

	// 카카오 결제 준비
	@PostMapping("/payment/kakao")
	@ResponseBody
	public String handleKakaoPayment(@RequestBody PaymentRequest paymentRequest) {
		session.setAttribute("paymentRequest", paymentRequest);
		// 결제 요청 데이터를 서비스로 전달하고 처리
		KakaoReadyResponse kakaoReadyResponse = reservationService.processPayment(paymentRequest);
		return kakaoReadyResponse.getNext_redirect_pc_url();

	}

	// 결제준비 취소
	@GetMapping("/payment/cancel")
	public String paymentCancel(Model model) {
		return "/reservation/kakao/kakaoCancelled";
	}

	// 결제 완료
	@GetMapping("/reservation/kakao/kakaoSuccess")
	public void paymentSuccess(@RequestParam String pg_token, Model model) {
		PaymentRequest paymentRequest = (PaymentRequest) session.getAttribute("paymentRequest");
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		if (userInfo == null) {
		//	return "redirect:/main.do";
		}
		int userNo = userInfo.getUserNo();
		String carStringNo = paymentRequest.getCarNo();
		String totalPrice = paymentRequest.getAmount();
		int carNo = Integer.valueOf(carStringNo).intValue();
		int reTotalPrice = Integer.valueOf(totalPrice).intValue();
		String dateTime = paymentRequest.getDate();

		System.out.println("paymentRequest : " + paymentRequest);
		System.out.println("userInfo : " + userInfo);

		CarDetailVo carDetail = carService.carDetail(carNo);

		// 예약테이블 디비 저장
		 reservationService.insertReservation(carNo, userNo, reTotalPrice,dateTime);


	    model.addAttribute("carDetail", carDetail);
	    model.addAttribute("userInfo", userInfo);
		model.addAttribute("paymentRequest", paymentRequest);
		

		System.out.println("carNo : " + carNo);
		System.out.println("userNo : " + userNo);
		System.out.println("amount : " + reTotalPrice);
		System.out.println("dateTime : " + dateTime);


	}

	// 예약내역 확인
	@GetMapping("/reservationOk.do")
	public String reservationDetaillFrom() {

		System.out.println("예약 내역 페이지");

		return "/reservation/reservationDetail/reservationDetail";
	}

}
