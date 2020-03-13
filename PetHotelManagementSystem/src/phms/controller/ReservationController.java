package phms.controller;

import java.time.LocalDate;
import java.util.ArrayList;
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

import common.priceCalculator;
import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.dto.SizeDto;
import phms.dto.UserDto;
import phms.dto.VisitorDto;
import phms.service.ReservationService;
import phms.service.RoomService;
import phms.service.SizeService;
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

	@Autowired
	SizeService sizeService;
	
	@Autowired
	priceCalculator priceCalc;

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

	// 예약확인 페이지
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
		SizeDto sizeDto = sizeService.selectOneSize(Integer.parseInt(rSNum));

		ArrayList<Object> totalPriceList = priceCalc.getTotalPrice(reCheckInStr, reCheckOutStr, rSNum);
		
		model.addAttribute("rSNum", rSNum);
		model.addAttribute("rSNumStr", sizeDto.getsSize());
		model.addAttribute("numberOfPerson", numberOfPerson);
		model.addAttribute("numberOfPet", numberOfPet);
		model.addAttribute("reCheckInStr", reCheckInStr);
		model.addAttribute("reCheckOutStr", reCheckOutStr);
		model.addAttribute("totalPrice", totalPriceList.get(0));
		model.addAttribute("totalPriceforShow", totalPriceList.get(1));

		return "reservationResult";
	}

	// 예약확인 후 결제 모듈 실행
	@PostMapping("/reservationResult")
	public String reservationResult(@RequestParam("uPhone1") String uPhone1, @RequestParam("uPhone2") String uPhone2,
			@RequestParam("reCheckInStr") String reCheckInStr, @RequestParam("reCheckOutStr") String reCheckOutStr,
			ReservationDto reservationDto, HttpSession session) {
		System.out.println(":::reservationResult");
		String id = (String) session.getAttribute("id");
		String from = (String) session.getAttribute("from");

		RoomDto roomDto = roomService.selectOneRoomBySize(reservationDto.getReSNum());
		int rNum = roomDto.getrNum();

		reservationDto.setReId(id);
		reservationDto.setReRNum(rNum);
		reservationDto.setReCheckIn(LocalDate.parse(reCheckInStr));
		reservationDto.setReCheckOut(LocalDate.parse(reCheckOutStr));
		reservationDto.setReDay(LocalDate.now());
		
		if (from == "phms") {
			UserDto user = userService.selectOneUser(id);
			user.setuRNum(rNum);
			userService.updateUserRoom(user);
		} else {
			reservationDto.setRePhone("010-" + uPhone1 + "-" + uPhone2);
			VisitorDto visitor = visitorService.selectOneVisitor(id);
			visitor.setvRoom(rNum);
			visitorService.updateVisitorRoom(visitor);
		}

		roomDto.setrStatus(1);
		roomService.updateRoomStatus(roomDto);

		int result = reserveService.insertReservation(reservationDto);

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
