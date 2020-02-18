package phms.dto;

public class SizeDto {

	private int sNum;
	private String sSize;
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
	public SizeDto(int sNum, String sSize) {
		super();
		this.sNum = sNum;
		this.sSize = sSize;
	}
	public SizeDto() {
		super();
	}
	@Override
	public String toString() {
		return "SizeDto [sNum=" + sNum + ", sSize=" + sSize + "]";
	}
	
	
	
}
