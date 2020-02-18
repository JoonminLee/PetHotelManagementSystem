package phms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import phms.dto.UserDto;
import phms.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userservice;

	@RequestMapping("/userSelectOne")
	public String userSelectOne(Model model) {
		System.out.println("userSelectOne");
		UserDto user = userservice.selectOneUser("joonmandoo");
		System.out.println(user.toString());
		model.addAttribute("user", user);
		return "userSelectOneTest";
	}
}
