package phms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.UserDto;
import phms.service.UserService;

@Controller
@RequestMapping("/idpwd")
public class IdPwdController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/search")
	public String search() {
		return "IdPwdSearch";
	}
	
	@RequestMapping(value = "/idSearch", produces = "application/text; charset=utf8")
	public @ResponseBody String idSearch(String name, String eMail) {
		UserDto user = userService.selectSearchUser(name);
		System.out.println(user);
		String uName = user.getuName();
		System.out.println(user.getuName());
		String uEmail = user.getuEmail();
		System.out.println(user.getuEmail());
		if(uName == name && uEmail == eMail) {
			System.out.println("맞음");
			return "성공";
		}else {
			return "실패";
		}
	}
}
