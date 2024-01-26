package com.tset.rentalCar.reservation.vo;

public class KakaoReadyResponse {
	private String tid; // 결제 고유 번호
	private String next_redirect_pc_url; // pc 웹일 경우 받는 결제 페이지
	private String created_at;
	
	
	public KakaoReadyResponse() {
		// TODO Auto-generated constructor stub
	}


	public KakaoReadyResponse(String tid, String next_redirect_pc_url, String created_at) {
		super();
		this.tid = tid;
		this.next_redirect_pc_url = next_redirect_pc_url;
		this.created_at = created_at;
	}


	public String getTid() {
		return tid;
	}


	public void setTid(String tid) {
		this.tid = tid;
	}


	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}


	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}


	public String getCreated_at() {
		return created_at;
	}


	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}


	@Override
	public String toString() {
		return "KakaoReadyResponse [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + "]";
	}
	
	
	

	
	
}
