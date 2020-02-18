package phms.dto;

import java.util.Date;

public class UserDto {

	private int uNum;
	private String uId;
	private String uPwd;
	private String uName;
	private String uPhone;
	private String uEmail;
	private Date uBirth;
	private String uGender;
	private int uRNum;
	
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
	public Date getuBirth() {
		return uBirth;
	}
	public void setuBirth(Date uBirth) {
		this.uBirth = uBirth;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public int getuRNum() {
		return uRNum;
	}
	public void setuRNum(int uRNum) {
		this.uRNum = uRNum;
	}
	public UserDto(int uNum, String uId, String uPwd, String uName, String uPhone, String uEmail, Date uBirth,
			String uGender, int uRNum) {
		super();
		this.uNum = uNum;
		this.uId = uId;
		this.uPwd = uPwd;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uBirth = uBirth;
		this.uGender = uGender;
		this.uRNum = uRNum;
	}
	public UserDto() {
		super();
	}
	@Override
	public String toString() {
		return "UserDto [uNum=" + uNum + ", uId=" + uId + ", uPwd=" + uPwd + ", uName=" + uName + ", uPhone=" + uPhone
				+ ", uEmail=" + uEmail + ", uBirth=" + uBirth + ", uGender=" + uGender + ", uRNum=" + uRNum + "]";
	}
	
	
}
