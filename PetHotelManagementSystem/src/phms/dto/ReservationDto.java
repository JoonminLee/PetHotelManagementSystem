package phms.dto;

import java.time.LocalDate;

public class ReservationDto {

	private int reNum;
	private String reId;
	private String rePhone;
	private String reRoom;
	private LocalDate reDate;
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
	public String getReRoom() {
		return reRoom;
	}
	public void setReRoom(String reRoom) {
		this.reRoom = reRoom;
	}
	public LocalDate getReDate() {
		return reDate;
	}
	public void setReDate(LocalDate reDate) {
		this.reDate = reDate;
	}
	public ReservationDto(int reNum, String reId, String rePhone, String reRoom, LocalDate reDate) {
		super();
		this.reNum = reNum;
		this.reId = reId;
		this.rePhone = rePhone;
		this.reRoom = reRoom;
		this.reDate = reDate;
	}
	public ReservationDto() {
		super();
	}
	@Override
	public String toString() {
		return "ReservationDto [reNum=" + reNum + ", reId=" + reId + ", rePhone=" + rePhone + ", reRoom=" + reRoom
				+ ", reDate=" + reDate + "]";
	}
	
	
	
}
