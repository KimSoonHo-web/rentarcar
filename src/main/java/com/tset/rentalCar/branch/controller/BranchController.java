package com.tset.rentalCar.branch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tset.rentalCar.branch.model.BranchService;
import com.tset.rentalCar.branch.vo.BranchVo;

@Controller
public class BranchController {

	@Autowired
	BranchService branchService;

	// 지점 상세
	@GetMapping("/getBranches")
	public String getBranchesByRegion(@RequestParam("regionNo") int regionNo, Model model) {
		// 지역 코드를 이용해 지점 정보를 조회
		List<BranchVo> branche = branchService.getBranchesByRegion(regionNo);
		System.out.println("branche : " + branche);
		// 모델에 지점 정보 추가
		model.addAttribute("branche", branche);

		// 지점 정보를 보여줄 JSP 뷰의 경로 반환
		return "/main/sideBar/branchDetailSideBar";
	}

	// 지점 검색
	@GetMapping("/searchBranches")
	public String searchBranches(@RequestParam("searchQuery") String searchQuery, Model model) {
		System.out.println(searchQuery);
		List<BranchVo> branches = branchService.searchBranches(searchQuery.toLowerCase());
		System.out.println(branches);

		model.addAttribute("branches", branches);
		return "/main/sideBar/search/branchSearchPage"; // 검색 결과를 표시할 JSP 페이지
	}

}
