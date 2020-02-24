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
	
	@GetMapping("/admin")
	public String selectAllReserve(Model model) {
		System.out.println(":::adminPage로 고고");
		return "adminPage";
	}

}
