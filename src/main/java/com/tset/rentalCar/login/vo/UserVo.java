package com.tset.rentalCar.login.vo;


public class UserVo {

	private Integer userNo; //번호
	private String userId; //아이디
	private String userName; //이름	
	private String userPhone; //휴대폰번호
	private String userPassword;
	private String userAddress1;
	private String userAddress2;
	private String userAddress3;
	private String userCreate;
	private String userModify;
	private String userStatus;
	private String userDelete;
	
	
	
	public UserVo() {
		// TODO Auto-generated constructor stub
	}



	public UserVo(Integer userNo, String userId, String userName, String userPhone, String userPassword,
			String userAddress1, String userAddress2, String userAddress3, String userCreate, String userModify,
			String userStatus, String userDelete) {
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
	}



	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", userPassword=" + userPassword + ", userAddress1=" + userAddress1 + ", userAddress2=" + userAddress2
				+ ", userAddress3=" + userAddress3 + ", userCreate=" + userCreate + ", userModify=" + userModify
				+ ", userStatus=" + userStatus + ", userDelete=" + userDelete + "]";
	}



	public Integer getUserNo() {
		return userNo;
	}



	public void setUserNo(Integer userNo) {
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



	public String getUserCreate() {
		return userCreate;
	}



	public void setUserCreate(String userCreate) {
		this.userCreate = userCreate;
	}



	public String getUserModify() {
		return userModify;
	}



	public void setUserModify(String userModify) {
		this.userModify = userModify;
	}



	public String getUserStatus() {
		return userStatus;
	}



	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}



	public String getUserDelete() {
		return userDelete;
	}



	public void setUserDelete(String userDelete) {
		this.userDelete = userDelete;
	}


	
	
	
	
	
	
	
	
	
	
		
	
}
