package phms.controller;

import java.time.LocalDate;
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
	
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/adminHome")
	public String adminHome(Model model, LocalDate today) {
		today = LocalDate.now();
		
		//오늘 예약한 사람
		int todayReserveCnt = reservationService.todayReserveCnt(today);
		model.addAttribute("todayReserveCnt", todayReserveCnt);
		System.out.println(":::adminHome로 고고");
		return "adminHome";
	}
	
	@GetMapping("/updateDeleteAdmin")
	public String userAdmin() {
		System.out.println(":::updateDeleteAdmin로 고고");
		return "updateDeleteAdmin";
	}
	
	@GetMapping("/insertAdmin")
	public String reserveAdmin() {
		System.out.println(":::insertAdmin로 고고");
		return "insertAdmin";
	}
	

}
