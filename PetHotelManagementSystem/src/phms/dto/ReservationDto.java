package phms.dto;

import java.time.LocalDate;

public class ReservationDto {

	private int reNum;
	private String reId;
	private String rePhone;
	private int reSNum;
	private int reRNum;
	private LocalDate reCheckIn;
	private LocalDate reCheckOut;
	private LocalDate reDay;
	
	public ReservationDto() {
		super();
	}

	public ReservationDto(int reNum, String reId, String rePhone, int reSNum, int reRNum, LocalDate reCheckIn,
			LocalDate reCheckOut, LocalDate reDay) {
		super();
		this.reNum = reNum;
		this.reId = reId;
		this.rePhone = rePhone;
		this.reSNum = reSNum;
		this.reRNum = reRNum;
		this.reCheckIn = reCheckIn;
		this.reCheckOut = reCheckOut;
		this.reDay = reDay;
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

	@Override
	public String toString() {
		return "ReservationDto [reNum=" + reNum + ", reId=" + reId + ", rePhone=" + rePhone + ", reSNum=" + reSNum
				+ ", reRNum=" + reRNum + ", reCheckIn=" + reCheckIn + ", reCheckOut=" + reCheckOut + ", reDay=" + reDay
				+ "]";
	}
	
}
