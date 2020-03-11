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

import phms.dto.ReservationDto;
import phms.dto.UserDto;
import phms.dto.UserRoomSizeDto;
import phms.dto.VisitorDto;
import phms.dto.VisitorRoomSizeDto;
import phms.service.ReservationService;
import phms.service.RoomService;
import phms.service.UserService;
import phms.service.VisitorService;

@Controller
@RequestMapping("/reserve")
public class ReservationController {

	@Autowired
	ReservationService reserveService;

	@Autowired
	RoomService roomService;

	@Autowired
	UserService userService;

	@Autowired
	VisitorService visitorService;

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

	@GetMapping("/reservationResult")
	public String reservationResult(@RequestParam("rSNum") String rSNum,
			@RequestParam("reCheckInStr") String reCheckInStr, @RequestParam("reCheckOutStr") String reCheckOutStr,
			@RequestParam("numberOfPerson") String numberOfPerson, @RequestParam("numberOfPet") String numberOfPet,
			HttpSession session, Model model) {
		System.out.println(":::reservationResult");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");
		if (from == "phms") {
			UserDto user = userService.selectOneUser(id);
			model.addAttribute("user", user);
		} else {
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			model.addAttribute("visitor", visitor);
		}
		model.addAttribute("rSNum", rSNum);
		model.addAttribute("numberOfPerson", numberOfPerson);
		model.addAttribute("numberOfPet", numberOfPet);
		model.addAttribute("reCheckInStr", reCheckInStr);
		model.addAttribute("reCheckOutStr", reCheckOutStr);
		return "reservationResult";
	}

	@PostMapping("/reservationResult")
	public String reservationResult(@RequestParam("uPhone1") String uPhone1, @RequestParam("uPhone2") String uPhone2,
			@RequestParam("rSNum") String rSNum, @RequestParam("reCheckInStr") String reCheckInStr,
			@RequestParam("reCheckOutStr") String reCheckOutStr, ReservationDto reservation, HttpSession session) {
		System.out.println(":::reservationResult");
		String id = (String) session.getAttribute("id");

		int rNum = roomService.selectOneRoomBySize(Integer.parseInt(rSNum));
		System.out.println(rNum);

		reCheckInStr = reCheckInStr.replaceAll(" ", "");
		reCheckOutStr = reCheckOutStr.replaceAll(" ", "");
		
		reservation.setReId(id);
		reservation.setReDay(LocalDate.now());
		reservation.setRePhone("010-" + uPhone1 + "-" + uPhone2);
		reservation.setReSNum(Integer.parseInt(rSNum));
		reservation.setReNum(rNum);
		reservation.setReCheckIn(LocalDate.parse(reCheckInStr));
		reservation.setReCheckOut(LocalDate.parse(reCheckOutStr));

		int result = reserveService.insertReservation(reservation);

		if (result == 1) {
			System.out.println("insertReserve 성공");
			return "redirect:/my/myPage01";
		} else {
			System.out.println("insertReserve 실패");
			return "redirect:/room/selectAvailableRoom";
		}
	}

	// 관리자페이지
	@GetMapping("/updateReserveAdmin")
	public @ResponseBody ReservationDto updateReserveAdmin(@RequestParam("reId") String reId) {
		System.out.println(":::updateReserve");
		ReservationDto reserve = reserveService.selectOneReservation(reId);
		System.out.println(reserve.toString());
		return reserve;
	}

	// 관리자페이지
	@PostMapping("/updateReserveAdmin")
	public @ResponseBody List<ReservationDto> updateReserveAdmin(ReservationDto reservation,
			@RequestParam("reCheckInStr") String reCheckInStr, @RequestParam("reCheckOutStr") String reCheckOutStr) {

		System.out.println(":::updateReserve");
		reservation.setReCheckIn(LocalDate.parse(reCheckInStr));
		reservation.setReCheckOut(LocalDate.parse(reCheckOutStr));

		System.out.println(reservation.toString());

		reserveService.updateReservation(reservation);
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		return listReserve;
	}

	// 관리자페이지
	@RequestMapping("/deleteReserveAdmin")
	public @ResponseBody List<ReservationDto> deleteReserveAdmin(@RequestParam("reNum") int reNum) {
		System.out.println(":::deleteReserve");
		reserveService.deleteReservation(reNum);
		List<ReservationDto> listReserve = reserveService.selectAllReservation();
		return listReserve;
	}

}
