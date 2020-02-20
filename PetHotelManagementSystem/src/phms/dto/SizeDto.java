package phms.dto;

public class SizeDto {

	private int sNum;
	private String sSize;
	private int sRPrice;
	private int sWPrice;
	
	public SizeDto() {
		super();
	}

	public SizeDto(int sNum, String sSize, int sRPrice, int sWPrice) {
		super();
		this.sNum = sNum;
		this.sSize = sSize;
		this.sRPrice = sRPrice;
		this.sWPrice = sWPrice;
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

	@Override
	public String toString() {
		return "SizeDto [sNum=" + sNum + ", sSize=" + sSize + ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice + "]";
	}
	
}
