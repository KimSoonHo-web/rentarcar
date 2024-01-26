package com.tset.rentalCar.branch.vo;

public class BranchVo {
	private int branchNo;
	private String branchName;
	private String branchStation;
	private String branchAddress1;
	private String branchAddress2;
	private String branchPhon;
	private String branchRenta;
	private String branchReturn;
	private int regionNo;
	private String regionName;
	private String regionBox1;
	private String regionBox2;

	public BranchVo() {
		// TODO Auto-generated constructor stub
	}

	public BranchVo(int branchNo, String branchName, String branchStation, String branchAddress1, String branchAddress2,
			String branchPhon, String branchRenta, String branchReturn, int regionNo, String regionName,
			String regionBox1, String regionBox2) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.branchStation = branchStation;
		this.branchAddress1 = branchAddress1;
		this.branchAddress2 = branchAddress2;
		this.branchPhon = branchPhon;
		this.branchRenta = branchRenta;
		this.branchReturn = branchReturn;
		this.regionNo = regionNo;
		this.regionName = regionName;
		this.regionBox1 = regionBox1;
		this.regionBox2 = regionBox2;
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

	public String getBranchAddress1() {
		return branchAddress1;
	}

	public void setBranchAddress1(String branchAddress1) {
		this.branchAddress1 = branchAddress1;
	}

	public String getBranchAddress2() {
		return branchAddress2;
	}

	public void setBranchAddress2(String branchAddress2) {
		this.branchAddress2 = branchAddress2;
	}

	public String getBranchPhon() {
		return branchPhon;
	}

	public void setBranchPhon(String branchPhon) {
		this.branchPhon = branchPhon;
	}

	public String getBranchRenta() {
		return branchRenta;
	}

	public void setBranchRenta(String branchRenta) {
		this.branchRenta = branchRenta;
	}

	public String getBranchReturn() {
		return branchReturn;
	}

	public void setBranchReturn(String branchReturn) {
		this.branchReturn = branchReturn;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getRegionBox1() {
		return regionBox1;
	}

	public void setRegionBox1(String regionBox1) {
		this.regionBox1 = regionBox1;
	}

	public String getRegionBox2() {
		return regionBox2;
	}

	public void setRegionBox2(String regionBox2) {
		this.regionBox2 = regionBox2;
	}

	@Override
	public String toString() {
		return "BranchVo [branchNo=" + branchNo + ", branchName=" + branchName + ", branchStation=" + branchStation
				+ ", branchAddress1=" + branchAddress1 + ", branchAddress2=" + branchAddress2 + ", branchPhon="
				+ branchPhon + ", branchRenta=" + branchRenta + ", branchReturn=" + branchReturn + ", regionNo="
				+ regionNo + ", regionName=" + regionName + ", regionBox1=" + regionBox1 + ", regionBox2=" + regionBox2
				+ "]";
	}

	
	
}
