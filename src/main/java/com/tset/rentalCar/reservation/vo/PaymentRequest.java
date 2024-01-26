package com.tset.rentalCar.reservation.vo;

public class PaymentRequest {

	private String paymentMethod;
	private String amount;
	private String userNo;
	private String carNo;
	private String branchName;
	private String carName;
	private String date;
	private String partnerOrderId;

	public PaymentRequest() {
		// TODO Auto-generated constructor stub
	}

	public PaymentRequest(String paymentMethod, String amount, String userNo, String carNo, String branchName,
			String carName, String date, String partnerOrderId) {
		super();
		this.paymentMethod = paymentMethod;
		this.amount = amount;
		this.userNo = userNo;
		this.carNo = carNo;
		this.branchName = branchName;
		this.carName = carName;
		this.date = date;
		this.partnerOrderId = partnerOrderId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPartnerOrderId() {
		return partnerOrderId;
	}

	public void setPartnerOrderId(String partnerOrderId) {
		this.partnerOrderId = partnerOrderId;
	}

	@Override
	public String toString() {
		return "PaymentRequest [paymentMethod=" + paymentMethod + ", amount=" + amount + ", userNo=" + userNo
				+ ", carNo=" + carNo + ", branchName=" + branchName + ", carName=" + carName + ", date=" + date
				+ ", partnerOrderId=" + partnerOrderId + "]";
	}
	

	
	
	
	
	
	
	
	
}
