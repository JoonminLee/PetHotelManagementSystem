package phms.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.NoDupliFileName;
import phms.dto.EmployeeDto;
import phms.dto.GuestDto;
import phms.dto.ReservationDto;
import phms.service.EmployeeService;
import phms.service.GuestService;
import phms.service.ReservationService;

@Controller
public class AdminController {

	@Autowired
	ReservationService reservationService;

	@Autowired
	GuestService guestService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	NoDupliFileName npfn;

	@GetMapping("/adminHome")
	public String adminHome(Model model, LocalDate today) {
		today = LocalDate.now();
		int thisYear = today.getYear();
		int thisMonth = today.getMonthValue();
		System.out.println("ThisYear:::" + thisYear);
		System.out.println("ThisMonth:::" + thisMonth);

		// 사원 사진
		EmployeeDto employee = employeeService.selectOneEmp(1);
		model.addAttribute("empPhoto", employee.getePhoto());

		// 오늘 예약한 사람
		int todayReserveCnt = reservationService.todayReserveCnt(today);
		model.addAttribute("todayReserveCnt", todayReserveCnt);

		// 오늘 방문자(회원)
		int todayGuestCnt = guestService.todayGuestCnt(today);
		model.addAttribute("todayGuestCnt", todayGuestCnt);

		// 이번달 예약자
		int thisMonthReserveCnt = 0;
		List<ReservationDto> reserveList = reservationService.selectAllReservation();
		for (int i = 0; i < reserveList.size(); i++) {

			int reDayYear = reserveList.get(i).getReDay().getYear();
			int reDayMonth = reserveList.get(i).getReDay().getMonthValue();

			// year이 같을 경우
			if (reDayYear == thisYear) {
				if (reDayMonth == thisMonth) {
					thisMonthReserveCnt += 1;
				}
			}
		}
		model.addAttribute("thisMonthReserveCnt", thisMonthReserveCnt);

		// 이번달 방문자
		int thisMonthGuestCnt = 0;
		List<GuestDto> guestList = guestService.selectAllGuest();
		for (int i = 0; i < guestList.size(); i++) {

			int gDayYear = guestList.get(i).getgDay().getYear();
			int gDayMonth = guestList.get(i).getgDay().getMonthValue();

			// year이 같을 경우
			if (gDayYear == thisYear) {
				if (gDayMonth == thisMonth) {
					thisMonthGuestCnt += 1;
				}
			}
		}
		model.addAttribute("thisMonthGuestCnt", thisMonthGuestCnt);

		// roomStatus
		System.out.println(":::adminHome로 고고");
		return "adminHome";

	}

	@PostMapping("/adminHome")
	public @ResponseBody String adminHome(MultipartFile[] filezData) {
		System.out.println(":::adminHomeUpload");
		String filezUploadFolder = "emp";
		List<String> filePathName = new ArrayList<String>();
		String filename;

		for (MultipartFile mf : filezData) {
			filename = npfn.noDupliFileName(mf);
			filePathName.add(filezUploadFolder + "/" + filename);

			File file = new File(filezUploadFolder);

			if (!file.exists()) {
				file.mkdirs();
				file = new File(filezUploadFolder, filename);
			} else {
				file = new File(filezUploadFolder, filename);
			}

			try {
				mf.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}

			EmployeeDto employee = employeeService.selectOneEmp(1);
			System.out.println(employee.toString());
			employee.setePhoto("/image/" + filePathName.get(0));
			System.out.println(employee.toString());
			
			employeeService.updateEmp(employee);

		}
		return "success";

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
