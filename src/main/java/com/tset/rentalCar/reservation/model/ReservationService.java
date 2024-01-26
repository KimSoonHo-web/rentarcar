package com.tset.rentalCar.reservation.model;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.tset.rentalCar.reservation.mapper.ReservationMapper;
import com.tset.rentalCar.reservation.vo.KakaoReadyResponse;
import com.tset.rentalCar.reservation.vo.PaymentRequest;
import com.tset.rentalCar.reservation.vo.ReservationVo;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper reservationMapper;

	static final String cid = "TC0ONETIME"; // 카카오페이 테스트 CID
	static final String admin_Key = "bec76fe8992277b6e2573a4714a48365"; // 여기에 관리자 키를 입력하세요

	public KakaoReadyResponse processPayment(PaymentRequest paymentRequest) {
		// paymentRequest에서 정보 추출
		String totalAmount = paymentRequest.getAmount();
		String userNo = paymentRequest.getUserNo();
		String carNo = paymentRequest.getCarNo();
		String date = paymentRequest.getDate();
		String partnerOrderId = generatePartnerOrderId(userNo);
		
		paymentRequest.setPartnerOrderId(partnerOrderId);
		
		// 카카오페이 요청을 위한 요청 폼 생성
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("cid", cid);
		parameters.add("partner_order_id", partnerOrderId);
		parameters.add("partner_user_id", userNo);
		parameters.add("item_name", carNo);
		parameters.add("quantity", "1");
		parameters.add("total_amount", totalAmount);
		parameters.add("tax_free_amount", "0");
		parameters.add("date", date);
		parameters.add("approval_url", "http://localhost:8000/reservation/kakao/kakaoSuccess");
		parameters.add("cancel_url", "http://localhost:8000/payment/cancel");
		parameters.add("fail_url", "http://localhost:8000/payment/fail");
		
		System.out.println("date"+ date);

		// 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK " + admin_Key);
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 요청 엔티티 생성
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, headers);

		// 카카오페이로 요청 전송
		RestTemplate restTemplate = new RestTemplate();
		KakaoReadyResponse kakaoReady = restTemplate.postForObject("https://kapi.kakao.com/v1/payment/ready",
				requestEntity, KakaoReadyResponse.class);
		return kakaoReady;
	}

	// 주문번호 랜덤 생성
	private String generatePartnerOrderId(String userNo) {
		Random random = new Random();
		StringBuilder orderIdBuilder = new StringBuilder(userNo);

		for (int i = 0; i < 8; i++) {
			orderIdBuilder.append(random.nextInt(10));
		}

		return orderIdBuilder.toString();
	}

	// 예약 내역 저장
	public void insertReservation(int carNo, int userNo, int reTotalPrice, String dateTime) {
		 reservationMapper.insertReservation(carNo,userNo,reTotalPrice,dateTime);
	}

	


}
