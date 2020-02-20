package phms.dto;

public class RoomDto {

	private int rNum;
	private int rSNum;
	private int rStatus;
	
	public RoomDto() {
		super();
	}

	public RoomDto(int rNum, int rSNum, int rStatus) {
		super();
		this.rNum = rNum;
		this.rSNum = rSNum;
		this.rStatus = rStatus;
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
		return "RoomDto [rNum=" + rNum + ", rSNum=" + rSNum + ", rStatus=" + rStatus + "]";
	}
	
}

	