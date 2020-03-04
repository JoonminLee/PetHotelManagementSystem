package phms.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.ReservationDto;
import phms.dto.UserDto;
import phms.dto.VisitorDto;
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
	
	@RequestMapping(value = "/myPage", produces = "application/text; charset=utf8")	
	public String myPage() {
		System.out.println("Mypage");
		return "myPage";
	}
	
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
		
	@RequestMapping(value = "/selectOneUser")
	public @ResponseBody Object selectOneUser(String uId, String uEmail, String uPhone, String uPhone1, String uPhone2) {
	System.out.println(":::selectOneUser");
	UserDto user = userService.selectOneUser(uId);
	user.setuEmail(uEmail);
	user.setuPhone(uPhone+"-"+uPhone1+"-"+uPhone2);
	userService.updateUser(user);
	return user;
	}
	
	@RequestMapping(value = "/changeVisitor")
	public @ResponseBody Object changeVisitor(String vId, String vName) {
		
		System.out.println(":::changeVisitor");
		VisitorDto visitor = visitorService.selectOneVisitor(vId);
		visitor.setvName(vName);
		visitorService.updateVisitor(visitor);
		
		return visitor;
	}
	
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
}
