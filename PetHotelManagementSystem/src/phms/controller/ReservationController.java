package phms.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.service.ReservationService;
import phms.service.RoomService;

@Controller
@RequestMapping("/reserve")
public class ReservationController {

	@Autowired
	ReservationService reserveService;

	// selectOneReserve
	@RequestMapping("/selectOneReserve")
	public String selectOneReserve(Model model) {
		System.out.println(":::selectOneReserve");
		ReservationDto reserve = reserveService.selectOneReservation("노창옥");
		System.out.println(reserve.toString());
		model.addAttribute("reserve", reserve);
		return "selectOneReserve";
	}

	// selectAllReservation
	@RequestMapping("/selectAllReserve")
	public String selectAllReserve(Model model) {
		System.out.println(":::selectAllReserve");
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		System.out.println(listReserve.toString());
		model.addAttribute("listReserve", listReserve);
		return "selectAllReserve";
	}

	// insertReserve
	@GetMapping("/insertReserve")
	public String insertReserve() {
		System.out.println(":::insertReserve");
		return "insertReserve";
	}

	@PostMapping("/insertReserve")
	public String insertReserve(@RequestParam("uPhone1") String uPhone1, @RequestParam("uPhone2") String uPhone2,
			@RequestParam("reDateStr") String reDateStr, ReservationDto reservation) {
		System.out.println(":::insertReserve");
		reservation.setReDate(LocalDate.parse(reDateStr));
		reservation.setRePhone("010-" + uPhone1 + "-" + uPhone2);
		int result = reserveService.insertReservation(reservation);
		if (result == 1) {
			System.out.println("insertReserve 성공");
			return "redirect:/reserve/selectAllReserve";
		} else {
			System.out.println("insertReserve 실패");
			return "redirect:/reserve/insertReserve";
		}
	}
}
