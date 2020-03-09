package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import phms.dto.ReservationDto;
import phms.service.ReservationService;


@Controller
public class AdminController {
	
	@GetMapping("/adminHome")
	public String adminHome() {
		System.out.println(":::adminHome로 고고");
		return "adminHome";
	}
	
	@GetMapping("/userAdmin")
	public String userAdmin() {
		System.out.println(":::userAdmin로 고고");
		return "userAdmin";
	}
	
	@GetMapping("/empAdmin")
	public String empAdmin() {
		System.out.println(":::empAdmin로 고고");
		return "empAdmin";
	}
	
	@GetMapping("/reserveAdmin")
	public String reserveAdmin() {
		System.out.println(":::reserveAdmin로 고고");
		return "reserveAdmin";
	}
	

}
