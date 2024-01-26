package com.tset.rentalCar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tset.rentalCar.branch.model.BranchService;
import com.tset.rentalCar.branch.vo.BranchVo;
import com.tset.rentalCar.region.model.RegionService;
import com.tset.rentalCar.region.vo.RegionVo;

@Controller
public class MainController {

	@Autowired
	RegionService regionService;
	@Autowired
	BranchService branchService;

	@Autowired
	HttpSession session;

	// 메인페이지
	@GetMapping("/main.do")
	public String mainForm(Model model) {

		// 지역리스트 조회
		List<RegionVo> regionList = regionService.getAllRegions();

		model.addAttribute("regionList", regionList);


		return "/main/main";
	}

}
