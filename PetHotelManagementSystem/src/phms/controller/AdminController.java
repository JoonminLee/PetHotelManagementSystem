package phms.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import phms.dto.GuestDto;
import phms.dto.ReservationDto;
import phms.service.GuestService;
import phms.service.ReservationService;


@Controller
public class AdminController {
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	GuestService guestService;
	
	@GetMapping("/adminHome") 
	public String adminHome(Model model, LocalDate today) {
		today = LocalDate.now();
		int thisYear = today.getYear();
		int thisMonth = today.getMonthValue();
		System.out.println("ThisYear:::"+thisYear);
		System.out.println("ThisMonth:::"+thisMonth);
		
		//오늘 예약한 사람
		int todayReserveCnt = reservationService.todayReserveCnt(today);
		model.addAttribute("todayReserveCnt", todayReserveCnt);
		
		//오늘 방문자(회원)
		int todayGuestCnt = guestService.todayGuestCnt(today);
		model.addAttribute("todayGuestCnt",todayGuestCnt);
		
		//이번달 예약자
		int thisMonthReserveCnt = 0;
		List<ReservationDto> reserveList = reservationService.selectAllReservation();
		for(int i=0; i<reserveList.size(); i++) {
			
			int reDayYear = reserveList.get(i).getReDay().getYear();
			int reDayMonth = reserveList.get(i).getReDay().getMonthValue();
			
			//year이 같을 경우
			if(reDayYear==thisYear) {
				if(reDayMonth==thisMonth) {
					thisMonthReserveCnt += 1;
				}
			}
		}
		model.addAttribute("thisMonthReserveCnt",thisMonthReserveCnt);
		
		//이번달 방문자
		int thisMonthGuestCnt =0;
		List<GuestDto> guestList = guestService.selectAllGuest();
		for(int i=0; i<guestList.size(); i++) {
			
			int gDayYear = guestList.get(i).getgDay().getYear();
			int gDayMonth = guestList.get(i).getgDay().getMonthValue();
			
			//year이 같을 경우
			if(gDayYear==thisYear) {
				if(gDayMonth==thisMonth) {
					thisMonthGuestCnt += 1;
				}
			}
		}
		model.addAttribute("thisMonthGuestCnt",thisMonthGuestCnt);
		
		//roomStatus
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
