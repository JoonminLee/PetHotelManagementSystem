package phms.dto;

public class PetDto {

	private int pNum;
	private String pName;
	private String pType;
	private int pUNum;
	private int pVNum;
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public int getpUNum() {
		return pUNum;
	}
	public void setpUNum(int pUNum) {
		this.pUNum = pUNum;
	}
	public int getpVNum() {
		return pVNum;
	}
	public void setpVNum(int pVNum) {
		this.pVNum = pVNum;
	}
	public PetDto(int pNum, String pName, String pType, int pUNum, int pVNum) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.pType = pType;
		this.pUNum = pUNum;
		this.pVNum = pVNum;
	}
	public PetDto() {
		super();
	}
	@Override
	public String toString() {
		return "PetDto [pNum=" + pNum + ", pName=" + pName + ", pType=" + pType + ", pUNum=" + pUNum + ", pVNum="
				+ pVNum + "]";
	}
	
	
	
}
