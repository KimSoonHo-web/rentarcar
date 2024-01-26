package com.tset.rentalCar.reservation.vo;

public class ReservationVo {
	
	private int reNo;
	private int reTotalPrice;
	private String reStatus; 
	private int userNo;
	private int carNo;
	private String date;
	
	
	public ReservationVo() {
		// TODO Auto-generated constructor stub
	}


	public ReservationVo(int reNo, int reTotalPrice, String reStatus, int userNo, int carNo, String date) {
		super();
		this.reNo = reNo;
		this.reTotalPrice = reTotalPrice;
		this.reStatus = reStatus;
		this.userNo = userNo;
		this.carNo = carNo;
		this.date = date;
	}


	public int getReNo() {
		return reNo;
	}


	public void setReNo(int reNo) {
		this.reNo = reNo;
	}


	public int getReTotalPrice() {
		return reTotalPrice;
	}


	public void setReTotalPrice(int reTotalPrice) {
		this.reTotalPrice = reTotalPrice;
	}


	public String getReStatus() {
		return reStatus;
	}


	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getCarNo() {
		return carNo;
	}


	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "ReservationVo [reNo=" + reNo + ", reTotalPrice=" + reTotalPrice + ", reStatus=" + reStatus + ", userNo="
				+ userNo + ", carNo=" + carNo + ", date=" + date + "]";
	}



	
	

	
	
	
	
	
}
