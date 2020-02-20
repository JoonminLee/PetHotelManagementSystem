package phms.dto;

public class RoomDto {

	private int rNum;
	private int rSNum;
	private int rWPrice;
	private int rHPrice;
	private int rStatus;
	
	public int getrNum() {
		return rNum;
	}

	public RoomDto(int rNum, int rSNum, int rWPrice, int rHPrice, int rStatus) {
		super();
		this.rNum = rNum;
		this.rSNum = rSNum;
		this.rWPrice = rWPrice;
		this.rHPrice = rHPrice;
		this.rStatus = rStatus;
	}

	public int getrSNum() {
		return rSNum;
	}

	public void setrSNum(int rSNum) {
		this.rSNum = rSNum;
	}

	public int getrWPrice() {
		return rWPrice;
	}

	public void setrWPrice(int rWPrice) {
		this.rWPrice = rWPrice;
	}

	public int getrHPrice() {
		return rHPrice;
	}

	public void setrHPrice(int rHPrice) {
		this.rHPrice = rHPrice;
	}

	public int getrStatus() {
		return rStatus;
	}

	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "RoomDto [rNum=" + rNum + ", rSNum=" + rSNum + ", rWPrice=" + rWPrice + ", rHPrice=" + rHPrice
				+ ", rStatus=" + rStatus + "]";
	}
	
}

	