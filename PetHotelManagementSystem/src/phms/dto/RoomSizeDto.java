package phms.dto;

public class RoomSizeDto {

	private int rNum;
	private int rSNum;
	private int rStatus;
	private int sNum;
	private String sSize;
	private int sRPrice;
	private int sWPrice;

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

	public RoomSizeDto(int rNum, int rSNum, int rStatus, int sNum, String sSize, int sRPrice, int sWPrice) {
		super();
		this.rNum = rNum;
		this.rSNum = rSNum;
		this.rStatus = rStatus;
		this.sNum = sNum;
		this.sSize = sSize;
		this.sRPrice = sRPrice;
		this.sWPrice = sWPrice;
	}

	public RoomSizeDto() {
		super();
	}

	@Override
	public String toString() {
		return "RoomSizeDto [rNum=" + rNum + ", rSNum=" + rSNum + ", rStatus=" + rStatus + ", sNum=" + sNum + ", sSize="
				+ sSize + ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice + "]";
	}

}
