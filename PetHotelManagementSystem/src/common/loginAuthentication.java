package common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import phms.dto.EmployeeDto;
import phms.dto.UserDto;
import phms.service.EmployeeService;
import phms.service.UserService;

@Component
public class loginAuthentication {

	@Autowired
	UserService userService;

	@Autowired
	EmployeeService employeeService;

	public int loginIdPwdCheck(String uId, String uPwd) {
		System.out.println(":::loginAuthentication");
		if (userService.selectOneUser(uId) != null) {
			UserDto user = userService.selectOneUser(uId);
			if (user.getuId().equals(uId) && user.getuPwd().equals(uPwd)) {
				return 1;
			} else {
				return 0;
			}
		} else if (employeeService.selectOneEmp(Integer.parseInt(uPwd)) != null) {
			EmployeeDto employee = employeeService.selectOneEmp(Integer.parseInt(uPwd));
			String eNum = "" + employee.geteNum();
			if (eNum.equals(uPwd) && employee.geteName().equals(uId)) {
				return 2;
			} else {
				return 0;
			}
		}
		return 0;
	}
}
