package phms.dto;

import java.util.Date;

public class ReservationDto {

	private int reNum;
	private String reName;
	private String rePhone;
	private String reRoom;
	private Date reDate;
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public String getReName() {
		return reName;
	}
	public void setReName(String reName) {
		this.reName = reName;
	}
	public String getRePhone() {
		return rePhone;
	}
	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}
	public String getReRoom() {
		return reRoom;
	}
	public void setReRoom(String reRoom) {
		this.reRoom = reRoom;
	}
	public Date getReDate() {
		return reDate;
	}
	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}
	public ReservationDto(int reNum, String reName, String rePhone, String reRoom, Date reDate) {
		super();
		this.reNum = reNum;
		this.reName = reName;
		this.rePhone = rePhone;
		this.reRoom = reRoom;
		this.reDate = reDate;
	}
	public ReservationDto() {
		super();
	}
	@Override
	public String toString() {
		return "ReservationDto [reNum=" + reNum + ", reName=" + reName + ", rePhone=" + rePhone + ", reRoom=" + reRoom
				+ ", reDate=" + reDate + "]";
	}
	
	
	
}
