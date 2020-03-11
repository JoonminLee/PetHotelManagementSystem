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
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.dto.UserDto;
import phms.service.ReservationService;
import phms.service.RoomService;

@Controller
@RequestMapping("/reserve")
public class ReservationController {

	@Autowired
	ReservationService reserveService;

	// selectOneReserve
	@RequestMapping("/selectOneReserve")
	public String selectOneReserve(Model model, @RequestParam("reId") String reId) {
		System.out.println(":::selectOneReserve");
		ReservationDto reserve = reserveService.selectOneReservation(reId);
		System.out.println(reserve.toString());
		model.addAttribute("reserve", reserve);
		return "selectOneReserve";
	}

	// selectAllReservation
	@RequestMapping("/selectAllReserve")
	public @ResponseBody List<ReservationDto> selectAllReserve() {
		System.out.println(":::selectAllReserve");
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		System.out.println(listReserve.toString());
		return listReserve;
	}

	// insertReserve
	// 예약하기화면.
	@GetMapping("/insertReserve")
	public String insertReserve() {
		System.out.println(":::insertReserve");
		return "insertReserve";
	}

	@PostMapping("/insertReserve")
	public String insertReserve(@RequestParam("uPhone1") String uPhone1, @RequestParam("uPhone2") String uPhone2,
			@RequestParam("reCheckInStr") String reCheckInStr, @RequestParam("reCheckOutStr") String reCheckOutStr,
			ReservationDto reservation) {

		System.out.println(":::insertReserve");

		reservation.setReCheckIn(LocalDate.parse(reCheckInStr));
		reservation.setReCheckOut(LocalDate.parse(reCheckOutStr));
		reservation.setRePhone("010-" + uPhone1 + "-" + uPhone2);

		int result = reserveService.insertReservation(reservation);

		if (result == 1) {
			System.out.println("insertReserve 성공");
			return "redirect:/reserve/selectOneR";
		} else {
			System.out.println("insertReserve 실패");
			return "redirect:/reserve/insertReserve";
		}
	}
	
	@RequestMapping("/reservationResult")
	public String reservationResult() {
		System.out.println(":::reservationResult");
		return "reservationResult";
	}

	//관리자페이지
	@GetMapping("/updateReserveAdmin")
	public @ResponseBody ReservationDto updateReserveAdmin(@RequestParam("reId") String reId) {
		System.out.println(":::updateReserve");
		ReservationDto reserve = reserveService.selectOneReservation(reId);
		System.out.println(reserve.toString());
		return reserve;
	}
	
	//관리자페이지
	@PostMapping("/updateReserveAdmin")
	public @ResponseBody List<ReservationDto> updateReserveAdmin(ReservationDto reservation, @RequestParam("reCheckInStr") String reCheckInStr,
			@RequestParam("reCheckOutStr") String reCheckOutStr ) {
		
		System.out.println(":::updateReserve");
		reservation.setReCheckIn(LocalDate.parse(reCheckInStr));
		reservation.setReCheckOut(LocalDate.parse(reCheckOutStr));
		
		System.out.println(reservation.toString());
		
		reserveService.updateReservation(reservation);
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		return listReserve;
	}

	//관리자페이지
	@RequestMapping("/deleteReserveAdmin")
	public @ResponseBody List<ReservationDto> deleteReserveAdmin(@RequestParam("reNum") int reNum) {
		System.out.println(":::deleteReserve");
		reserveService.deleteReservation(reNum);
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		return listReserve;
	}
	
}
