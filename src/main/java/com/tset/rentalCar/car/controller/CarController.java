package com.tset.rentalCar.car.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tset.rentalCar.car.model.CarService;
import com.tset.rentalCar.car.vo.CarDetailVo;
import com.tset.rentalCar.car.vo.CarListVo;
import com.tset.rentalCar.login.vo.UserVo;
import com.tset.rentalCar.region.model.RegionService;
import com.tset.rentalCar.region.vo.RegionVo;

@Controller
public class CarController {
	@Autowired
	CarService carService;
	@Autowired
	RegionService regionService;
	@Autowired
	HttpSession session;

	// 차량 리스트
	@GetMapping("/carList.do")
	public String carListForm(@RequestParam("carTypes") String carTypes, @RequestParam("date") String date,
			@RequestParam("branch") String branchName, Model model) {
		
		

		// 차량리스트 조회
		List<CarListVo> carList = carService.carList(branchName);
		 System.out.println("carList : " + carList);

		// 지역리스트 조회
		List<RegionVo> regionList = regionService.getAllRegions();
		
		
		
		
		
		System.out.println("regionList : " + regionList);
		model.addAttribute("regionList", regionList);

		model.addAttribute("carList", carList);
		model.addAttribute("carTypes", carTypes);
		model.addAttribute("date", date);
		model.addAttribute("branch", branchName);

		return "/car/carList";
	}

	// 차량 상세
	@GetMapping("/carDetail.do")
	public String carDetailFrom(int carNo, @RequestParam("branch") String branchName, String date, Model model) {
		// 회원정보 조회
		UserVo userInfo = (UserVo) session.getAttribute("userInfo");
		System.out.println("UserVo : " + userInfo);

		CarDetailVo carDetail = carService.carDetail(carNo);

		model.addAttribute("carDetail", carDetail);
		model.addAttribute("date", date);

		return "/car/detail/carDetail";
	}

	// 지역 조회 사이드 바
	@GetMapping("/branchSideBar.do")
	public String branchSideForm(Model model) {

		return "/car/branchSideBar";
	}

	// 지점 조회 사이드 바

}
