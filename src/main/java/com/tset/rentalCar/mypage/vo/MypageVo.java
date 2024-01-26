package com.tset.rentalCar.mypage.vo;

import java.security.Timestamp;

public class MypageVo {
	
	private int userNo; //번호
	private String userId; //이메일아이디
	private String userName; //이름	
	private String userPhone; //휴대폰번호
	private String userPassword;
	private String userAddress1;
	private String userAddress2;
	private String userAddress3;
	private Timestamp userCreate;
	private Timestamp userModify;
	private String userStatus;
	private Timestamp userDelete;
	private int cardId;
	private String cardClsNm; //카드유형
	private String cardNo; //카드번호
	private String expDtm; //유효기간
	private String cardPw; 
	private String idNo;//생년월일 6자리
	private int licenseNo;  //면호 고유번호
	private String licenseType; // 면허증종류
	private String licenseNumber; // 면허증 번호 
	private String issueDate; // 면허증 취득날짜
	private String expirationDate; // 면하증 만료 날짜

	public MypageVo() {
		// TODO Auto-generated constructor stub
	}

	public MypageVo(int userNo, String userId, String userName, String userPhone, String userPassword,
			String userAddress1, String userAddress2, String userAddress3, Timestamp userCreate, Timestamp userModify,
			String userStatus, Timestamp userDelete, int cardId, String cardClsNm, String cardNo, String expDtm,
			String cardPw, String idNo, int licenseNo, String licenseType, String licenseNumber, String issueDate,
			String expirationDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userPassword = userPassword;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userAddress3 = userAddress3;
		this.userCreate = userCreate;
		this.userModify = userModify;
		this.userStatus = userStatus;
		this.userDelete = userDelete;
		this.cardId = cardId;
		this.cardClsNm = cardClsNm;
		this.cardNo = cardNo;
		this.expDtm = expDtm;
		this.cardPw = cardPw;
		this.idNo = idNo;
		this.licenseNo = licenseNo;
		this.licenseType = licenseType;
		this.licenseNumber = licenseNumber;
		this.issueDate = issueDate;
		this.expirationDate = expirationDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getUserAddress3() {
		return userAddress3;
	}

	public void setUserAddress3(String userAddress3) {
		this.userAddress3 = userAddress3;
	}

	public Timestamp getUserCreate() {
		return userCreate;
	}

	public void setUserCreate(Timestamp userCreate) {
		this.userCreate = userCreate;
	}

	public Timestamp getUserModify() {
		return userModify;
	}

	public void setUserModify(Timestamp userModify) {
		this.userModify = userModify;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public Timestamp getUserDelete() {
		return userDelete;
	}

	public void setUserDelete(Timestamp userDelete) {
		this.userDelete = userDelete;
	}

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	public String getCardClsNm() {
		return cardClsNm;
	}

	public void setCardClsNm(String cardClsNm) {
		this.cardClsNm = cardClsNm;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getExpDtm() {
		return expDtm;
	}

	public void setExpDtm(String expDtm) {
		this.expDtm = expDtm;
	}

	public String getCardPw() {
		return cardPw;
	}

	public void setCardPw(String cardPw) {
		this.cardPw = cardPw;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public int getLicenseNo() {
		return licenseNo;
	}

	public void setLicenseNo(int licenseNo) {
		this.licenseNo = licenseNo;
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
		return "MypageVo [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userPhone="
				+ userPhone + ", userPassword=" + userPassword + ", userAddress1=" + userAddress1 + ", userAddress2="
				+ userAddress2 + ", userAddress3=" + userAddress3 + ", userCreate=" + userCreate + ", userModify="
				+ userModify + ", userStatus=" + userStatus + ", userDelete=" + userDelete + ", cardId=" + cardId
				+ ", cardClsNm=" + cardClsNm + ", cardNo=" + cardNo + ", expDtm=" + expDtm + ", cardPw=" + cardPw
				+ ", idNo=" + idNo + ", licenseNo=" + licenseNo + ", licenseType=" + licenseType + ", licenseNumber="
				+ licenseNumber + ", issueDate=" + issueDate + ", expirationDate=" + expirationDate + "]";
	}
	
	
	
	
}
