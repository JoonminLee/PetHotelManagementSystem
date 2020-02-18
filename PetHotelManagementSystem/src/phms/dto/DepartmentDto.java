package phms.dto;

public class DepartmentDto {

	private int dNum;
	private String dName;
	public int getdNum() {
		return dNum;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public DepartmentDto(int dNum, String dName) {
		super();
		this.dNum = dNum;
		this.dName = dName;
	}
	public DepartmentDto() {
		super();
	}
	@Override
	public String toString() {
		return "DepartmentDto [dNum=" + dNum + ", dName=" + dName + "]";
	}
	
	
	
}
