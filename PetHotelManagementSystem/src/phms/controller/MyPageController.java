package phms.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.ReservationDto;
import phms.dto.RoomSizeDto;
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
	
	//myPage 초기화면
	@RequestMapping(value = "/myPage", produces = "application/text; charset=utf8")	
	public String myPage(Model model, HttpSession session) {
		String uId = (String)session.getAttribute("id");
		UserDto user = userService.selectOneUser(uId);
		ReservationDto reservation = reserveService.selectOneReservation(uId);
		VisitorDto visitor = visitorService.selectOneVisitor(uId);
		UserRoomSizeDto userRoom = userService.selectUserRoom(uId);
		VisitorRoomSizeDto visitorRoom = visitorService.selectVisitorRoom(uId);
		System.out.println(visitor);
		System.out.println(user);
		System.out.println(reservation);
		System.out.println(userRoom);
		model.addAttribute("userRoom", userRoom);
		model.addAttribute("user",user);
		model.addAttribute("reservation",reservation);
		model.addAttribute("visitor",visitor);
		model.addAttribute("visitorRoom",visitorRoom);
		return "myPage";
	}
	//ajax 회원정보 부분
	@RequestMapping(value = "/selectOneVisitor")
	public @ResponseBody Object selectOneVisitor(String id, String from) {
		System.out.println(id);
		System.out.println(from);
		System.out.println(":::selectOneVisitor");
		if (from.equals("phms")) {
			UserDto user = userService.selectOneUser(id);
			return user;
		}else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			return visitor;
		}
	}		
	//ajax 회원정보 수정부분
	@RequestMapping(value = "/selectOneUser")
	public @ResponseBody Object selectOneUser(String uId, String uEmail, String uPhone, String uPhone1, String uPhone2) {
	System.out.println(":::selectOneUser");
	UserDto user = userService.selectOneUser(uId);
	user.setuEmail(uEmail);
	user.setuPhone(uPhone+"-"+uPhone1+"-"+uPhone2);
	userService.updateUser(user);
	return user;
	}
	
	//ajax 비회원정보 수정부분
	@RequestMapping(value = "/changeVisitor")
	public @ResponseBody Object changeVisitor(String vId, String vName) {
		
		System.out.println(":::changeVisitor");
		VisitorDto visitor = visitorService.selectOneVisitor(vId);
		visitor.setvName(vName);
		visitorService.updateVisitor(visitor);
		
		return visitor;
	}
	
	//ajax 회원정보 수정 업데이트 부분
	@RequestMapping("/updateUser")
	public @ResponseBody Object updateUser(String id, String from) {
		System.out.println(id);
		System.out.println(from);
		System.out.println(":::updateUser");
		if (from.equals("phms")) {
			UserDto user = userService.selectOneUser(id);		
			return user;
		}else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			visitor.getvName();
			visitorService.updateVisitor(visitor);
			return visitor;
		}
	}
	// 회원 예약정보 삭제 부분
	@RequestMapping("/deleteUserRoom")
	public @ResponseBody List<UserRoomSizeDto> deleteUserRoom(String uId){
		System.out.println(":::deleteUserRoom");
		userService.deleteUserRoom(uId);
		List<UserRoomSizeDto> listUserRoom = userService.selectUserRoomAll();
		return listUserRoom;
	}
	// 비회원 예약정보 삭제 부분
	@RequestMapping("/deleteVisitorRoom")
	public @ResponseBody List<VisitorRoomSizeDto> deleteVisitorRoom(String vId){
		System.out.println(":::deleteVisitorRoom");
		visitorService.deleteVisitorRoom(vId);
		List<VisitorRoomSizeDto> listVisitorRoom = visitorService.selectVisitorRoomAll();
		return listVisitorRoom;
	}
}
