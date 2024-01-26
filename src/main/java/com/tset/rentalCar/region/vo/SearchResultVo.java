package com.tset.rentalCar.region.vo;

public class SearchResultVo {

	private int branchNo;
	private String branchName;
	private String branchStation;

	public SearchResultVo() {
	}

	public SearchResultVo(int branchNo, String branchName, String branchStation) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.branchStation = branchStation;
	}

	@Override
	public String toString() {
		return "SearchResultVo [branchNo=" + branchNo + ", branchName=" + branchName + ", branchStation="
				+ branchStation + "]";
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchStation() {
		return branchStation;
	}

	public void setBranchStation(String branchStation) {
		this.branchStation = branchStation;
	}

	
	
	
}
