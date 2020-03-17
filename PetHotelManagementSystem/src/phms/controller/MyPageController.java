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

import phms.dto.PetDto;
import phms.dto.ReRoomSizeDto;
import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;
import phms.dto.VisitorDto;
import phms.dto.VisitorRoomSizeDto;
import phms.service.PetService;
import phms.service.ReservationService;
import phms.service.RoomService;
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
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	PetService petService;
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 세션 아이디 값 가져와서 마이페이지에 정보 넘겨주기
	@RequestMapping("/myPage01")
	public String myPage01(Model model, HttpSession session) {
		System.out.println(":::myPage");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			UserDto user = userService.selectOneUser(id);		
			List<ReRoomSizeDto> userReserve = reserveService.selectAllReRoomSizeDto(id);
			List<PetDto> pet = petService.selectAllUserPet(user.getuNum());		
			model.addAttribute("user", user);
			model.addAttribute("pet", pet);
			model.addAttribute("userReserve", userReserve);
		} else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			List<ReRoomSizeDto> visitorReserve = reserveService.selectAllReRoomSizeDto(id);
			List<PetDto> pet = petService.selectAllVisitorPet(visitor.getvNum());
			model.addAttribute("visitor", visitor);
			model.addAttribute("pet", pet);
			model.addAttribute("visitorReserve", visitorReserve);
		}
		return "myPage01";
	}	

	//마이페이지 회원정보 업데이트 - user, visitor 분간해서 해당하는 jsp호출
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

	//회원정보 업데이트 및 마이페이지로 redirect
	@PostMapping("/myPageUpdate")
	public String myPageUpdate(UserDto user, @RequestParam("uBirthStr") String uBirthStr,
			@RequestParam("uPwd") String uPwd, VisitorDto visitor, HttpSession session) {
		System.out.println(":::myPageUpdate");
		System.out.println(uPwd);
		String pattern1 = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*?,./\\\\<>|_-[+]=\\`~\\(\\)\\[\\]\\{\\}])[A-Za-z[0-9]!@#$%^&*?,./\\\\<>|_-[+]=\\`~\\(\\)\\[\\]\\{\\}]{8,20}$";
		String from = (String) session.getAttribute("from");
		System.out.println(pattern1);
		System.out.println(uPwd.matches(pattern1));
		if (from == "phms" && uPwd.matches(pattern1)) {
			user.setuBirth(LocalDate.parse(uBirthStr));			
			user.setuPwd(uPwd);			
			userService.myPageUpdateUser(user);
		} else {
			visitorService.myPageUpdateVisitor(visitor);
		}
		return "redirect:/my/myPage01";
	}
	
	@RequestMapping("/myPageReserveCancle")
	public String myPageReserveCancle(HttpSession session) {
		System.out.println(":::myPageReserveCancle");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			ReservationDto reservationDto = reserveService.selectOneReservation(id);
			
			RoomDto roomDto = roomService.selectOneRoom(reservationDto.getReRNum());
			roomDto.setrStatus(0);
			roomService.updateRoom(roomDto);
			
			UserDto userDto = userService.selectOneUser(id);
			userDto.setuRNum(0);
			userService.updateUser(userDto);
			
			reserveService.deleteReservation(reservationDto.getReNum());
		}else {
			ReservationDto reservationDto = reserveService.selectOneReservation(id);
			
			RoomDto roomDto = roomService.selectOneRoom(reservationDto.getReRNum());
			roomDto.setrStatus(0);
			roomService.updateRoom(roomDto);
			
			VisitorDto visitorDto = visitorService.selectOneVisitor(id);
			visitorDto.setvRoom(0);
			visitorService.updateVisitor(visitorDto);
			
			reserveService.deleteReservation(reservationDto.getReNum());
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
	
	@RequestMapping("/myPet")
	public String myPet() {
		System.out.println(":::myPet");
		return "myPet";
	}
	
	@RequestMapping("/insertMyPet")
	public String insertMyPet(UserDto user, @RequestParam("pName") String pName, PetDto pet,
			@RequestParam("pType") String pType, VisitorDto visitor, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		System.out.println(pName);
		System.out.println(pType);
		System.out.println(id);
		System.out.println(from);
		if (from == "phms") {
			user = userService.selectOneUser(id);			
			pet.setpUNum(user.getuNum());
			pet.setpName(pName);
			pet.setpType(pType);
			petService.insertPet(pet);				
		}else {
			visitor = visitorService.selectOneVisitor(id);
			pet.setpVNum(visitor.getvNum());
			pet.setpName(pName);
			pet.setpType(pType);
			petService.insertPet(pet);
		}
		return "redirect:/my/myPage01";
	}
	
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

/*
 * // ajax 비회원정보 수정부분
 * 
 * @RequestMapping(value = "/changeVisitor") public @ResponseBody Object
 * changeVisitor(String vId, String vName) {
 * 
 * System.out.println(":::changeVisitor"); VisitorDto visitor =
 * visitorService.selectOneVisitor(vId); visitor.setvName(vName);
 * visitorService.updateVisitor(visitor);
 * 
 * return visitor; }
 * 
 * // ajax 회원정보 수정 업데이트 부분
 * 
 * @RequestMapping("/updateUser") public @ResponseBody Object updateUser(String
 * id, String from) { System.out.println(id); System.out.println(from);
 * System.out.println(":::updateUser"); if (from.equals("phms")) { UserDto user
 * = userService.selectOneUser(id); return user; } else { VisitorDto visitor =
 * visitorService.selectOneVisitor(id); visitor.getvName();
 * visitorService.updateVisitor(visitor); return visitor; } }
 * 
 * // 회원 예약정보 삭제 부분
 * 
 * @RequestMapping("/deleteUserRoom") public @ResponseBody List<UserRoomSizeDto>
 * deleteUserRoom(String uId) { System.out.println(":::deleteUserRoom");
 * userService.deleteUserRoom(uId); List<UserRoomSizeDto> listUserRoom =
 * userService.selectUserRoomAll(); return listUserRoom; }
 * 
 * // 비회원 예약정보 삭제 부분
 * 
 * @RequestMapping("/deleteVisitorRoom") public @ResponseBody
 * List<VisitorRoomSizeDto> deleteVisitorRoom(String vId) {
 * System.out.println(":::deleteVisitorRoom");
 * visitorService.deleteVisitorRoom(vId); List<VisitorRoomSizeDto>
 * listVisitorRoom = visitorService.selectVisitorRoomAll(); return
 * listVisitorRoom; } }
 */
