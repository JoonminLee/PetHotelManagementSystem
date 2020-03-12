package phms.dto;

import java.time.LocalDate;

public class GuestDto {
	
	private int gNum;
	private String gId;
	private String gName;
	private LocalDate gDay;
	private String gFrom;
	
	public GuestDto() {
		super();
	}

	public GuestDto(int gNum, String gId, String gName, LocalDate gDay, String gFrom) {
		super();
		this.gNum = gNum;
		this.gId = gId;
		this.gName = gName;
		this.gDay = gDay;
		this.gFrom = gFrom;
	}

	public int getgNum() {
		return gNum;
	}

	public void setgNum(int gNum) {
		this.gNum = gNum;
	}

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
	} 

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public LocalDate getgDay() {
		return gDay;
	}

	public void setgDay(LocalDate gDay) {
		this.gDay = gDay;
	}

	public String getgFrom() {
		return gFrom;
	}

	public void setgFrom(String gFrom) {
		this.gFrom = gFrom;
	}

	@Override
	public String toString() {
		return "GuestDto [gNum=" + gNum + ", gId=" + gId + ", gName=" + gName + ", gDay=" + gDay + ", gFrom=" + gFrom
				+ "]";
	}

	
}
