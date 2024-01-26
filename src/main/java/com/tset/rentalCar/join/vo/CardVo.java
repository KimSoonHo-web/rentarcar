package com.tset.rentalCar.join.vo;

public class CardVo {
	
	private int userNo;
	private int cardId;
	private String cardClsNm;
	private String cardNo;
	private String expDtm;
	private String cardPw;
	private String idNo;
	
	

	public CardVo() {
		// TODO Auto-generated constructor stub
	}



	public CardVo(int userNo, int cardId, String cardClsNm, String cardNo, String expDtm, String cardPw, String idNo) {
		super();
		this.userNo = userNo;
		this.cardId = cardId;
		this.cardClsNm = cardClsNm;
		this.cardNo = cardNo;
		this.expDtm = expDtm;
		this.cardPw = cardPw;
		this.idNo = idNo;
	}

	
	

	@Override
	public String toString() {
		return "CardVo [userNo=" + userNo + ", cardId=" + cardId + ", cardClsNm=" + cardClsNm + ", cardNo=" + cardNo
				+ ", expDtm=" + expDtm + ", cardPw=" + cardPw + ", idNo=" + idNo + "]";
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	
	
	
	

	
	
}
