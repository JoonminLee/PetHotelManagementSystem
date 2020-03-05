package phms.dto;

import java.time.LocalDate;

public class VisitorRoomSizeDto {

	private int vNum;
	private String vId;
	private String vName;
	private String vEmail;
	private String vFrom;
	private int vRoom;
	private int rNum;
	private int rSNum;
	private int rStatus;
	private int sNum;
	private String sSize;
	private int sRPrice;
	private int sWPrice;
	private int reNum;
	private String reId;
	private String rePhone;
	private int reSNum;
	private int reRNum;
	private LocalDate reCheckIn;
	private LocalDate reCheckOut;
	
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public String getvId() {
		return vId;
	}
	public void setvId(String vId) {
		this.vId = vId;
	}
	public String getvName() {
		return vName;
	}
	public void setvName(String vName) {
		this.vName = vName;
	}
	public String getvEmail() {
		return vEmail;
	}
	public void setvEmail(String vEmail) {
		this.vEmail = vEmail;
	}
	public String getvFrom() {
		return vFrom;
	}
	public void setvFrom(String vFrom) {
		this.vFrom = vFrom;
	}
	public int getvRoom() {
		return vRoom;
	}
	public void setvRoom(int vRoom) {
		this.vRoom = vRoom;
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
	public VisitorRoomSizeDto(int vNum, String vId, String vName, String vEmail, String vFrom, int vRoom, int rNum,
			int rSNum, int rStatus, int sNum, String sSize, int sRPrice, int sWPrice, int reNum, String reId,
			String rePhone, int reSNum, int reRNum, LocalDate reCheckIn, LocalDate reCheckOut) {
		super();
		this.vNum = vNum;
		this.vId = vId;
		this.vName = vName;
		this.vEmail = vEmail;
		this.vFrom = vFrom;
		this.vRoom = vRoom;
		this.rNum = rNum;
		this.rSNum = rSNum;
		this.rStatus = rStatus;
		this.sNum = sNum;
		this.sSize = sSize;
		this.sRPrice = sRPrice;
		this.sWPrice = sWPrice;
		this.reNum = reNum;
		this.reId = reId;
		this.rePhone = rePhone;
		this.reSNum = reSNum;
		this.reRNum = reRNum;
		this.reCheckIn = reCheckIn;
		this.reCheckOut = reCheckOut;
	}
	public VisitorRoomSizeDto() {
		super();
	}
	@Override
	public String toString() {
		return "VisitorRoomSizeDto [vNum=" + vNum + ", vId=" + vId + ", vName=" + vName + ", vEmail=" + vEmail
				+ ", vFrom=" + vFrom + ", vRoom=" + vRoom + ", rNum=" + rNum + ", rSNum=" + rSNum + ", rStatus="
				+ rStatus + ", sNum=" + sNum + ", sSize=" + sSize + ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice
				+ ", reNum=" + reNum + ", reId=" + reId + ", rePhone=" + rePhone + ", reSNum=" + reSNum + ", reRNum="
				+ reRNum + ", reCheckIn=" + reCheckIn + ", reCheckOut=" + reCheckOut + "]";
	}
	
	
}
