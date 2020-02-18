package phms.dto;

import java.time.LocalDate;

public class EmployeeDto {

	private int eNum;
	private String eName;
	private int eDNum;
	private int ePoNum;
	private String ePhone;
	private LocalDate eHireDate;
	private int eSalary;
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public int geteDNum() {
		return eDNum;
	}
	public void seteDNum(int eDNum) {
		this.eDNum = eDNum;
	}
	public int getePoNum() {
		return ePoNum;
	}
	public void setePoNum(int ePoNum) {
		this.ePoNum = ePoNum;
	}
	public String getePhone() {
		return ePhone;
	}
	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}
	public LocalDate geteHireDate() {
		return eHireDate;
	}
	public void seteHireDate(LocalDate eHireDate) {
		this.eHireDate = eHireDate;
	}
	public int geteSalary() {
		return eSalary;
	}
	public void seteSalary(int eSalary) {
		this.eSalary = eSalary;
	}
	public EmployeeDto(int eNum, String eName, int eDNum, int ePoNum, String ePhone, LocalDate eHireDate, int eSalary) {
		super();
		this.eNum = eNum;
		this.eName = eName;
		this.eDNum = eDNum;
		this.ePoNum = ePoNum;
		this.ePhone = ePhone;
		this.eHireDate = eHireDate;
		this.eSalary = eSalary;
	}
	public EmployeeDto() {
		super();
	}
	@Override
	public String toString() {
		return "EmployeeDto [eNum=" + eNum + ", eName=" + eName + ", eDNum=" + eDNum + ", ePoNum=" + ePoNum
				+ ", ePhone=" + ePhone + ", eHireDate=" + eHireDate + ", eSalary=" + eSalary + "]";
	}
	
	
	
	
}
