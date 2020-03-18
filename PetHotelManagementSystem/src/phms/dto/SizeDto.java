package phms.dto;

public class SizeDto {

	private int sNum;
	private String sSize;
	private int sRPrice;
	private int sWPrice;
	private String sMax;
	private String sSpace;
	private String sView;
	private String sBed;
	private String sLounge;
	private String sLimit;
	private int sCare;
	private int sBath;

	public SizeDto() {
		super();
	}

	public SizeDto(int sNum, String sSize, int sRPrice, int sWPrice, String sMax, String sSpace, String sView,
			String sBed, String sLounge, String sLimit, int sCare, int sBath) {
		super();
		this.sNum = sNum;
		this.sSize = sSize;
		this.sRPrice = sRPrice;
		this.sWPrice = sWPrice;
		this.sMax = sMax;
		this.sSpace = sSpace;
		this.sView = sView;
		this.sBed = sBed;
		this.sLounge = sLounge;
		this.sLimit = sLimit;
		this.sCare = sCare;
		this.sBath = sBath;
	}

	public String getsMax() {
		return sMax;
	}

	public void setsMax(String sMax) {
		this.sMax = sMax;
	}

	public String getsSpace() {
		return sSpace;
	}

	public void setsSpace(String sSpace) {
		this.sSpace = sSpace;
	}

	public String getsView() {
		return sView;
	}

	public void setsView(String sView) {
		this.sView = sView;
	}

	public String getsBed() {
		return sBed;
	}

	public void setsBed(String sBed) {
		this.sBed = sBed;
	}

	public String getsLounge() {
		return sLounge;
	}

	public void setsLounge(String sLounge) {
		this.sLounge = sLounge;
	}

	public String getsLimit() {
		return sLimit;
	}

	public void setsLimit(String sLimit) {
		this.sLimit = sLimit;
	}

	public int getsCare() {
		return sCare;
	}

	public void setsCare(int sCare) {
		this.sCare = sCare;
	}

	public int getsBath() {
		return sBath;
	}

	public void setsBath(int sBath) {
		this.sBath = sBath;
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
		return "SizeDto [sNum=" + sNum + ", sSize=" + sSize + ", sRPrice=" + sRPrice + ", sWPrice=" + sWPrice
				+ ", sMax=" + sMax + ", sSpace=" + sSpace + ", sView=" + sView + ", sBed=" + sBed + ", sLounge="
				+ sLounge + ", sLimit=" + sLimit + ", sCare=" + sCare + ", sBath=" + sBath + "]";
	}

}
