package phms.dto;

public class VisitorDto {

	private int vNum;
	private String vId;
	private String vEmail;
	private int vRoom;
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public String getvId() {
		return vId;
	}
	public void setvId(String vId) {
		this.vId = vId;
	}
	public String getvEmail() {
		return vEmail;
	}
	public void setvEmail(String vEmail) {
		this.vEmail = vEmail;
	}
	public int getvRoom() {
		return vRoom;
	}
	public void setvRoom(int vRoom) {
		this.vRoom = vRoom;
	}
	public VisitorDto(int vNum, String vId, String vEmail, int vRoom) {
		super();
		this.vNum = vNum;
		this.vId = vId;
		this.vEmail = vEmail;
		this.vRoom = vRoom;
	}
	public VisitorDto() {
		super();
	}
	@Override
	public String toString() {
		return "VisitorDto [vNum=" + vNum + ", vId=" + vId + ", vEmail=" + vEmail + ", vRoom=" + vRoom + "]";
	}
	

	
	
}
