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

import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;
import phms.dto.VisitorDto;
import phms.dto.VisitorRoomSizeDto;
import phms.service.ReservationService;
import phms.service.UserService;
import phms.service.VisitorService;

@Controller
@RequestMapping("/my")
public class MyPageController {

	@Autowired
	UserService userService;

	@Autowired
	ReservationService reserveService;

	@Autowired
	VisitorService visitorService;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// ID로 회원정보 조회
	@RequestMapping("/myPage01")
	public String myPage01(Model model, HttpSession session) {
		System.out.println(":::myPage");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			UserDto user = userService.selectOneUser(id);
			List<UserRoomSizeDto> userReserve = userService.selectUserRoom(id);
			model.addAttribute("user", user);
			model.addAttribute("userReserve", userReserve);
		} else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			List<VisitorRoomSizeDto> visitorReserve = visitorService.selectVisitorRoom(id);
			model.addAttribute("visitor", visitor);
			model.addAttribute("visitorReserve", visitorReserve);
		}
		return "myPage01";

	}

	@GetMapping("/myPageUpdate")
	public String myPageUpdate(Model model, HttpSession session) {
		System.out.println(":::myPageUpdate");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			UserDto user = userService.selectOneUser(id);
			model.addAttribute("user", user);
			return "myPageUpdateUser";
		} else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			model.addAttribute("visitor", visitor);
			return "myPageUpdateVisitor";
		}
	}

	@PostMapping("/myPageUpdate")
	public String myPageUpdate(UserDto user, @RequestParam("uBirthStr") String uBirthStr, VisitorDto visitor, HttpSession session) {
		System.out.println(":::myPageUpdate");
		System.out.println(uBirthStr);
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			user.setuBirth(LocalDate.parse(uBirthStr));
			userService.myPageUpdateUser(user);
		} else {
			visitorService.myPageUpdateVisitor(visitor);
		}
		return "redirect:/my/myPage01";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// User 회원정보 부분
	@PostMapping("/selectOneUser")
	public @ResponseBody UserDto selectOneUser(HttpSession session) {
		System.out.println("selectOneUser :::");
		String uId = (String) session.getAttribute("id");
		UserDto user = userService.selectOneUser(uId);
		return user;
	}

	// Visitor 회원정보 부분
	@PostMapping("/selectOneVisitor")
	public @ResponseBody VisitorDto selectOneVisitor(HttpSession session) {
		System.out.println("selectOneVisitor :::");
		String uId = (String) session.getAttribute("id");
		VisitorDto visitor = visitorService.selectOneVisitor(uId);
		return visitor;
	}

	// User 예약정보
	@PostMapping("/selectUserReserveList")
	public @ResponseBody List<UserRoomSizeDto> selectUserReserveList(HttpSession session) {
		System.out.println("selectUserReserveList :::");
		String uId = (String) session.getAttribute("id");
		System.out.println("uID :::" + uId);
		List<UserRoomSizeDto> userReserveList = userService.selectUserRoom(uId);
		System.out.println("userReserveList :::" + userReserveList);
		return userReserveList;
	}

	// Visitor 예약정보
	@PostMapping("/selectVisitorReserveList")
	public @ResponseBody List<VisitorRoomSizeDto> selectVisitorReserveList(HttpSession session) {
		String vId = (String) session.getAttribute("id");
		List<VisitorRoomSizeDto> visitorReserveList = visitorService.selectVisitorRoom(vId);
		return visitorReserveList;
	}

//	//ajax 회원정보 수정부분
//	@RequestMapping(value = "/selectOneUser")
//	public @ResponseBody Object selectOneUser(String uId, String uEmail, String uPhone, String uPhone1, String uPhone2) {
//	System.out.println(":::selectOneUser");
//	UserDto user = userService.selectOneUser(uId);
//	user.setuEmail(uEmail);
//	user.setuPhone(uPhone+"-"+uPhone1+"-"+uPhone2);
//	userService.updateUser(user);
//	return user;
//	}

	// ajax 비회원정보 수정부분
	@RequestMapping(value = "/changeVisitor")
	public @ResponseBody Object changeVisitor(String vId, String vName) {

		System.out.println(":::changeVisitor");
		VisitorDto visitor = visitorService.selectOneVisitor(vId);
		visitor.setvName(vName);
		visitorService.updateVisitor(visitor);

		return visitor;
	}

	// ajax 회원정보 수정 업데이트 부분
	@RequestMapping("/updateUser")
	public @ResponseBody Object updateUser(String id, String from) {
		System.out.println(id);
		System.out.println(from);
		System.out.println(":::updateUser");
		if (from.equals("phms")) {
			UserDto user = userService.selectOneUser(id);
			return user;
		} else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			visitor.getvName();
			visitorService.updateVisitor(visitor);
			return visitor;
		}
	}

	// 회원 예약정보 삭제 부분
	@RequestMapping("/deleteUserRoom")
	public @ResponseBody List<UserRoomSizeDto> deleteUserRoom(String uId) {
		System.out.println(":::deleteUserRoom");
		userService.deleteUserRoom(uId);
		List<UserRoomSizeDto> listUserRoom = userService.selectUserRoomAll();
		return listUserRoom;
	}

	// 비회원 예약정보 삭제 부분
	@RequestMapping("/deleteVisitorRoom")
	public @ResponseBody List<VisitorRoomSizeDto> deleteVisitorRoom(String vId) {
		System.out.println(":::deleteVisitorRoom");
		visitorService.deleteVisitorRoom(vId);
		List<VisitorRoomSizeDto> listVisitorRoom = visitorService.selectVisitorRoomAll();
		return listVisitorRoom;
	}
}
