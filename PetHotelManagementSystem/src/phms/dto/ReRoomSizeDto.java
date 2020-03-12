package phms.dto;

import java.time.LocalDate;

public class ReRoomSizeDto {
	int reNum;
	String reId;
	String rePhone;
	int reSNum;
	int reRNum;
	LocalDate reCheckIn;
	LocalDate reCheckOut;
	LocalDate reDay;
	int sNum;
	String sSize;
	int sRPrice;
	int sWPrice;
	int rNum;
	int rSNum;
	int rStatus;

	public ReRoomSizeDto() {
		super();
	}

	public ReRoomSizeDto(int reNum, String reId, String rePhone, int reSNum, int reRNum, LocalDate reCheckIn,
			LocalDate reCheckOut, LocalDate reDay, int sNum, String sSize, int sRPrice, int sWPrice, int rNum,
			int rSNum, int rStatus) {
		super();
		this.reNum = reNum;
		this.reId = reId;
		this.rePhone = rePhone;
		this.reSNum = reSNum;
		this.reRNum = reRNum;
		this.reCheckIn = reCheckIn;
		this.reCheckOut = reCheckOut;
		this.reDay = reDay;
		this.sNum = sNum;
		this.sSize = sSize;
		this.sRPrice = sRPrice;
		this.sWPrice = sWPrice;
		this.rNum = rNum;
		this.rSNum = rSNum;
		this.rStatus = rStatus;
	}

	public int getReNum() {
		return reNum;
	}

	public void setReNum(int reNum) {
		this.reNum = reNum;
	}

	public String getReId() {
		return reId;
	}

	public void setReId(String reId) {
		this.reId = reId;
	}

	public String getRePhone() {
		return rePhone;
	}

	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}

	public int getReSNum() {
		return reSNum;
	}

	public void setReSNum(int reSNum) {
		this.reSNum = reSNum;
	}

	public int getReRNum() {
		return reRNum;
	}

	public void setReRNum(int reRNum) {
		this.reRNum = reRNum;
	}

	public LocalDate getReCheckIn() {
		return reCheckIn;
	}

	public void setReCheckIn(LocalDate reCheckIn) {
		this.reCheckIn = reCheckIn;
	}

	public LocalDate getReCheckOut() {
		return reCheckOut;
	}

	public void setReCheckOut(LocalDate reCheckOut) {
		this.reCheckOut = reCheckOut;
	}

	public LocalDate getReDay() {
		return reDay;
	}

	public void setReDay(LocalDate reDay) {
		this.reDay = reDay;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsSize() {
		return sSize;
	}

	public void setsSize(String sSize) {
		this.sSize = sSize;
	}

	public int getsRPrice() {
		return sRPrice;
	}

	public void setsRPrice(int sRPrice) {
		this.sRPrice = sRPrice;
	}

	public int getsWPrice() {
		return sWPrice;
	}

	public void setsWPrice(int sWPrice) {
		this.sWPrice = sWPrice;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getrSNum() {
		return rSNum;
	}

	public void setrSNum(int rSNum) {
		this.rSNum = rSNum;
	}

	public int getrStatus() {
		return rStatus;
	}

	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "ReRoomSizeDto [reNum=" + reNum + ", reId=" + reId + ", rePhone=" + rePhone + ", reSNum=" + reSNum
				+ ", reRNum=" + reRNum + ", reCheckIn=" + reCheckIn + ", reCheckOut=" + reCheckOut + ", reDay=" + reDay
				+ ", sNum=" + sNum + ", sSize=" + sSize + ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice + ", rNum="
				+ rNum + ", rSNum=" + rSNum + ", rStatus=" + rStatus + "]";
	}

}
