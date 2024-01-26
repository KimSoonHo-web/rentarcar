package com.tset.rentalCar.car.vo;

public class CarListVo {
	
	private int carNo;
	private int branchNo;
	private String carMake;
	private String carModel;
	private String carName;
	private int carYear;
	private int carSeatCount;
	private int carPrice;
	private String imageCarPath;
	private String imageMarkPath;
	private String dcTitle;
	private int dcNo;
	
	public CarListVo() {
		// TODO Auto-generated constructor stub
	}

	public CarListVo(int carNo, int branchNo, String carMake, String carModel, String carName, int carYear,
			int carSeatCount, int carPrice, String imageCarPath, String imageMarkPath, String dcTitle, int dcNo) {
		super();
		this.carNo = carNo;
		this.branchNo = branchNo;
		this.carMake = carMake;
		this.carModel = carModel;
		this.carName = carName;
		this.carYear = carYear;
		this.carSeatCount = carSeatCount;
		this.carPrice = carPrice;
		this.imageCarPath = imageCarPath;
		this.imageMarkPath = imageMarkPath;
		this.dcTitle = dcTitle;
		this.dcNo = dcNo;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getCarMake() {
		return carMake;
	}

	public void setCarMake(String carMake) {
		this.carMake = carMake;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public int getCarYear() {
		return carYear;
	}

	public void setCarYear(int carYear) {
		this.carYear = carYear;
	}

	public int getCarSeatCount() {
		return carSeatCount;
	}

	public void setCarSeatCount(int carSeatCount) {
		this.carSeatCount = carSeatCount;
	}

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}

	public String getImageCarPath() {
		return imageCarPath;
	}

	public void setImageCarPath(String imageCarPath) {
		this.imageCarPath = imageCarPath;
	}

	public String getImageMarkPath() {
		return imageMarkPath;
	}

	public void setImageMarkPath(String imageMarkPath) {
		this.imageMarkPath = imageMarkPath;
	}

	public String getDcTitle() {
		return dcTitle;
	}

	public void setDcTitle(String dcTitle) {
		this.dcTitle = dcTitle;
	}

	public int getDcNo() {
		return dcNo;
	}

	public void setDcNo(int dcNo) {
		this.dcNo = dcNo;
	}

	@Override
	public String toString() {
		return "CarListVo [carNo=" + carNo + ", branchNo=" + branchNo + ", carMake=" + carMake + ", carModel="
				+ carModel + ", carName=" + carName + ", carYear=" + carYear + ", carSeatCount=" + carSeatCount
				+ ", carPrice=" + carPrice + ", imageCarPath=" + imageCarPath + ", imageMarkPath=" + imageMarkPath
				+ ", dcTitle=" + dcTitle + ", dcNo=" + dcNo + "]";
	}

	
	
	
	

	
}
