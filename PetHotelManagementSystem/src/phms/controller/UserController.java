package phms.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.loginAuthentication;
import phms.dto.GuestDto;
import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;
import phms.service.GuestService;
import phms.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	loginAuthentication loginAuth;

	@Autowired
	GuestService guestService;

	// selectOneUser
	@RequestMapping("/selectOneUser")
	public String selectOneUser(Model model, @RequestParam("uId") String uId) {
		System.out.println(":::selectOneUser");
		UserDto user = userService.selectOneUser(uId);
		model.addAttribute("user", user);
		return "selectOneUser";
	}

	// selectAllUser
	@RequestMapping("/selectAllUser")
	public @ResponseBody List<UserDto> selectAllUser() {
		System.out.println(":::selectAllUser");
		List<UserDto> listUser = userService.selectAllUser();
		return listUser;
	}

	// insertUser
	// 회원가입
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
		uBirthStr = uBirthStr.replaceAll(" ", "");
		System.out.println(uBirthStr);
		user.setuBirth(LocalDate.parse(uBirthStr));
		user.setuPhone("010-" + uPhone1 + "-" + uPhone2);
		int result = userService.insertUser(user);
		if (result == 1) {
			System.out.println("insertUser 성공");
			return "redirect:/user/selectAllUser";
		} else {
			System.out.println("insertUser 실패");
			return "redirect:/user/insertUser";
		}
	}

	// updateUser
	// 마이페이지.
	@GetMapping("/updateUser")
	public String updateUser(Model model, @RequestParam("uId") String uId) {
		System.out.println(":::updateUser");
		UserDto user = userService.selectOneUser(uId);
		model.addAttribute("user", user);
		return "updateUser";
	}

	// userAdminpage
	@GetMapping("/updateUserAdmin")
	public @ResponseBody UserDto updateUser(@RequestParam("uId") String uId) {
		System.out.println(":::updateUser");
		UserDto user = userService.selectOneUser(uId);
		return user;
	}

	@PostMapping("/updateUser")
	public @ResponseBody List<UserDto> updateUser(UserDto user, @RequestParam("uBirthStr") String uBirthStr) {
		System.out.println(":::updateUser");
		user.setuBirth(LocalDate.parse(uBirthStr));
		userService.updateUser(user);
		List<UserDto> listUser = userService.selectAllUser();
		return listUser;
	}

	// deleteUser
	@RequestMapping("/deleteUser")
	public @ResponseBody List<UserDto> deleteUser(@RequestParam("uId") String uId) {
		System.out.println(":::deleteUser");
		userService.deleteUser(uId);
		List<UserDto> listUser = userService.selectAllUser();
		return listUser;
	}

	// loginUser
	@GetMapping("/loginUser")
	public String loginUser() {
		System.out.println(":::loginUser");
		return "loginUser";
	}

	// loginUser
	@PostMapping("/loginUser")
	public String loginUser(Model model, @RequestParam("uId") String uId, @RequestParam("uPwd") String uPwd, HttpSession session) {
		System.out.println(":::loginUser");
		int result = loginAuth.loginIdPwdCheck(uId, uPwd);

		if (result == 1) {
			UserDto user = userService.selectOneUser(uId);
			String uName = user.getuName();
			String uFrom = "phms";
			System.out.println("로그인 성공");
			model.addAttribute("id", uId);
			model.addAttribute("from", "phms");
			LocalDate today = LocalDate.now();
			GuestDto guest = new GuestDto(0, uId, uName, today, uFrom);
			guestService.insertGuest(guest);
			System.out.println("guest :::" + guest);
			return "sessionLogin";
		} else if (result == 2) {
			System.out.println("직원 로그인 성공");
			session.setAttribute("id", uId);
			return "redirect:/adminHome";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/user/loginUser";
		}
	}
}
