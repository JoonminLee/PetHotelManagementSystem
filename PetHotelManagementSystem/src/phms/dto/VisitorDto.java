package phms.dto;

public class VisitorDto {

	private int vNum;
	private String vName;
	private String vPhone;
	private int vRoom;
	
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public String getvName() {
		return vName;
	}
	public void setvName(String vName) {
		this.vName = vName;
	}
	public String getvPhone() {
		return vPhone;
	}
	public void setvPhone(String vPhone) {
		this.vPhone = vPhone;
	}
	public int getvRoom() {
		return vRoom;
	}
	public void setvRoom(int vRoom) {
		this.vRoom = vRoom;
	}
	public VisitorDto(int vNum, String vName, String vPhone, int vRoom) {
		super();
		this.vNum = vNum;
		this.vName = vName;
		this.vPhone = vPhone;
		this.vRoom = vRoom;
	}
	public VisitorDto() {
		super();
	}
	@Override
	public String toString() {
		return "VisitorDto [vNum=" + vNum + ", vName=" + vName + ", vPhone=" + vPhone + ", vRoom=" + vRoom + "]";
	}
	
	
	
}
