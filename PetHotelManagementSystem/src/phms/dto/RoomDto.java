package phms.dto;

public class RoomDto {

	private int rNum;
	private int rSize;
	private int rStatus;
	private int rWPrice;
	private int rHPrice;
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getrSize() {
		return rSize;
	}
	public void setrSize(int rSize) {
		this.rSize = rSize;
	}
	public int getrStatus() {
		return rStatus;
	}
	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
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
	public RoomDto(int rNum, int rSize, int rStatus, int rWPrice, int rHPrice) {
		super();
		this.rNum = rNum;
		this.rSize = rSize;
		this.rStatus = rStatus;
		this.rWPrice = rWPrice;
		this.rHPrice = rHPrice;
	}
	public RoomDto() {
		super();
	}
	@Override
	public String toString() {
		return "RoomDto [rNum=" + rNum + ", rSize=" + rSize + ", rStatus=" + rStatus + ", rWPrice=" + rWPrice
				+ ", rHPrice=" + rHPrice + "]";
	}
	
	
	
}
