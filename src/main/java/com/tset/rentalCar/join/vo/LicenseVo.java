package com.tset.rentalCar.join.vo;

public class LicenseVo {
		
	private int licenseNo;  //면호 고유번호
	private int userNo;
	private String licenseType; // 면허증종류
	private String licenseNumber; // 면허증 번호 
	private String issueDate; // 면허증 취득날짜
	private String expirationDate; // 면하증 만료 날짜

	
	public LicenseVo() {
		// TODO Auto-generated constructor stub
	}


	public LicenseVo(int licenseNo, int userNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate) {
		super();
		this.licenseNo = licenseNo;
		this.userNo = userNo;
		this.licenseType = licenseType;
		this.licenseNumber = licenseNumber;
		this.issueDate = issueDate;
		this.expirationDate = expirationDate;
	}


	public int getLicenseNo() {
		return licenseNo;
	}


	public void setLicenseNo(int licenseNo) {
		this.licenseNo = licenseNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getLicenseType() {
		return licenseType;
	}


	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}


	public String getLicenseNumber() {
		return licenseNumber;
	}


	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}


	public String getIssueDate() {
		return issueDate;
	}


	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}


	public String getExpirationDate() {
		return expirationDate;
	}


	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}


	@Override
	public String toString() {
		return "LicenseVo [licenseNo=" + licenseNo + ", userNo=" + userNo + ", licenseType=" + licenseType
				+ ", licenseNumber=" + licenseNumber + ", issueDate=" + issueDate + ", expirationDate=" + expirationDate
				+ "]";
	}



	
	
	
	
	
	
}
