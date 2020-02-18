package phms.dto;

public class PositionDto {

	private int poNum;
	private String poName;
	public int getPoNum() {
		return poNum;
	}
	public void setPoNum(int poNum) {
		this.poNum = poNum;
	}
	public String getPoName() {
		return poName;
	}
	public void setPoName(String poName) {
		this.poName = poName;
	}
	public PositionDto(int poNum, String poName) {
		super();
		this.poNum = poNum;
		this.poName = poName;
	}	
	
	public PositionDto() {
		super();
	}
	@Override
	public String toString() {
		return "PositionDto [poNum=" + poNum + ", poName=" + poName + "]";
	}
	
	
	
}
