package phms.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.UserDto;
import phms.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	// selectOneUser
	@RequestMapping("/selectOneUser")
	public String selectOneUser(Model model) {
		System.out.println(":::selectOneUser");
		UserDto user = userService.selectOneUser("joonmandoo");
		System.out.println(user.toString());
		model.addAttribute("user", user);
		return "selectOneUser";
	}

	// selectAllUser
	@RequestMapping("/selectAllUser")
	public String selectAllUser(Model model) {
		System.out.println(":::selectAllUser");
		List<UserDto> listUser = userService.selectAllUser();
		System.out.println(listUser.toString());
		model.addAttribute("listUser", listUser);
		return "selectAllUser";
	}

	// insertUser
	@GetMapping("/insertUser")
	public String insertUser() {
		System.out.println(":::insertUser");
		return "insertUser";
	}

	// insertUser
	@PostMapping("/insertUser")
	public String insertUser(@RequestParam("uPhone1") String uPhone1, @RequestParam("uPhone2") String uPhone2,
			@RequestParam("uBirthStr") String uBirthStr, UserDto user) {
		System.out.println(":::insertUser");
		user.setuBirth(LocalDate.parse(uBirthStr));
		user.setuPhone("010-" + uPhone1 + "-" + uPhone2);
		System.out.println(user.toString());
		return null;
	}
}
