package common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import phms.dto.UserDto;
import phms.service.UserService;

@Component
public class loginAuthentication {

	@Autowired
	UserService userService;

	public int loginIdPwdCheck(String uId, String uPwd) {
		System.out.println(":::loginAuthentication");
		UserDto user = userService.selectOneUser(uId);
		if (user.getuId().equals(uId) && user.getuPwd().equals(uPwd)) {
			return 1;
		} else {
			return 0;
		}
	}
}
