package phms.controller;

import java.util.List;

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

	// selectOneUser
	@RequestMapping("/selectOneUser")
	public String selectOneUser(Model model) {
		System.out.println(":::selectOneUser");
		UserDto user = userservice.selectOneUser("joonmandoo");
		System.out.println(user.toString());
		model.addAttribute("user", user);
		return "selectOneUser";
	}

	// selectAllUser
	@RequestMapping("/selectAllUser")
	public String selectAllUser(Model model) {
		System.out.println(":::selectAllUser");
		List<UserDto> listUser = userservice.selectAllUser();
		System.out.println(listUser.toString());
		model.addAttribute("listUser", listUser);
		return "selectAllUser";
	}
}
