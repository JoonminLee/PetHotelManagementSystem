package phms.dto;

import java.time.LocalDate;

public class UserRoomSizeDto {

	private int uNum;
	private String uId;
	private String uPwd;
	private String uName;
	private String uGender;
	private String uPhone;
	private String uEmail;
	private LocalDate uBirth;
	private int uRNum;
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
	
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public LocalDate getuBirth() {
		return uBirth;
	}
	public void setuBirth(LocalDate uBirth) {
		this.uBirth = uBirth;
	}
	public int getuRNum() {
		return uRNum;
	}
	public void setuRNum(int uRNum) {
		this.uRNum = uRNum;
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
	public UserRoomSizeDto(int uNum, String uId, String uPwd, String uName, String uGender, String uPhone,
			String uEmail, LocalDate uBirth, int uRNum, int rNum, int rSNum, int rStatus, int sNum, String sSize,
			int sRPrice, int sWPrice, int reNum, String reId, String rePhone, int reSNum, int reRNum,
			LocalDate reCheckIn, LocalDate reCheckOut) {
		super();
		this.uNum = uNum;
		this.uId = uId;
		this.uPwd = uPwd;
		this.uName = uName;
		this.uGender = uGender;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uBirth = uBirth;
		this.uRNum = uRNum;
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
	public UserRoomSizeDto() {
		super();
	}
	@Override
	public String toString() {
		return "UserRoomSizeDto [uNum=" + uNum + ", uId=" + uId + ", uPwd=" + uPwd + ", uName=" + uName + ", uGender="
				+ uGender + ", uPhone=" + uPhone + ", uEmail=" + uEmail + ", uBirth=" + uBirth + ", uRNum=" + uRNum
				+ ", rNum=" + rNum + ", rSNum=" + rSNum + ", rStatus=" + rStatus + ", sNum=" + sNum + ", sSize=" + sSize
				+ ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice + ", reNum=" + reNum + ", reId=" + reId + ", rePhone="
				+ rePhone + ", reSNum=" + reSNum + ", reRNum=" + reRNum + ", reCheckIn=" + reCheckIn + ", reCheckOut="
				+ reCheckOut + "]";
	}
	
	
	
}