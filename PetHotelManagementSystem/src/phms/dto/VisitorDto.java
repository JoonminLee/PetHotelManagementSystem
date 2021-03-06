package phms.dto;

public class VisitorDto {

	private int vNum;
	private String vId;
	private String vName;
	private String vEmail;
	private String vFrom;
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

	public String getvName() {
		return vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
	}

	public String getvEmail() {
		return vEmail;
	}

	public void setvEmail(String vEmail) {
		this.vEmail = vEmail;
	}

	public String getvFrom() {
		return vFrom;
	}

	public void setvFrom(String vFrom) {
		this.vFrom = vFrom;
	}

	public int getvRoom() {
		return vRoom;
	}

	public void setvRoom(int vRoom) {
		this.vRoom = vRoom;
	}

	public VisitorDto(int vNum, String vId, String vName, String vEmail, String vFrom, int vRoom) {
		super();
		this.vNum = vNum;
		this.vId = vId;
		this.vName = vName;
		this.vEmail = vEmail;
		this.vFrom = vFrom;
		this.vRoom = vRoom;
	}

	public VisitorDto() {
		super();
	}

	@Override
	public String toString() {
		return "VisitorDto [vNum=" + vNum + ", vId=" + vId + ", vName=" + vName + ", vEmail=" + vEmail + ", vFrom="
				+ vFrom + ", vRoom=" + vRoom + "]";
	}

}
