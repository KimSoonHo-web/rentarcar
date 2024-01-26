package com.tset.rentalCar.region.vo;

public class RegionVo {
	
	
	private int regionNo;
	private String regionName;
	private String regionBox1;
	private String regionBox2;

	
	public RegionVo() {
		// TODO Auto-generated constructor stub
	}


	public RegionVo(int regionNo, String regionName, String regionBox1, String regionBox2) {
		super();
		this.regionNo = regionNo;
		this.regionName = regionName;
		this.regionBox1 = regionBox1;
		this.regionBox2 = regionBox2;
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
		return "RegionVo [regionNo=" + regionNo + ", regionName=" + regionName + ", regionBox1=" + regionBox1
				+ ", regionBox2=" + regionBox2 + "]";
	}

	
	
	
	
	
	
	
	

}
