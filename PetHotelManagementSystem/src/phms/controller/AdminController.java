package phms.controller;

import java.io.File;
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
import phms.dto.DepartmentDto;
import phms.dto.EmployeeDto;
import phms.dto.GuestDto;
import phms.dto.PositionDto;
import phms.dto.ReservationDto;
import phms.service.DepartmentService;
import phms.service.EmployeeService;
import phms.service.GuestService;
import phms.service.PositionService;
import phms.service.ReservationService;

@Controller
public class AdminController {

	@Autowired
	ReservationService reservationService;

	@Autowired
	GuestService guestService;

	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	PositionService positionService;
	
	@Autowired
	EmployeeService employeeService;

	@Autowired
	NoDupliFileName npfn;

	@GetMapping("/adminHome")
	public String adminHome(Model model, LocalDate today, HttpSession session) {
		today = LocalDate.now();
		int thisYear = today.getYear();
		int thisMonth = today.getMonthValue();
		System.out.println("ThisYear:::" + thisYear);
		System.out.println("ThisMonth:::" + thisMonth);
		int eNum = Integer.parseInt((String) session.getAttribute("id"));

		// 사원 사진
		EmployeeDto employee = employeeService.selectOneEmp(eNum);
		DepartmentDto department = departmentService.selectOneDepartment(employee.geteDNum());
		PositionDto position = positionService.selectOnePosition(employee.getePoNum());
		model.addAttribute("emp", employee);
		model.addAttribute("department", department);
		model.addAttribute("position", position);
		
		
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

	@GetMapping("/adminProfilePhoto")
	public String adminProfilePhoto() {
		return "adminProfilePhoto";
	}

	@PostMapping("/adminProfilePhoto")
	public @ResponseBody String adminProfilePhoto(MultipartFile[] filezData, HttpSession session) {
		System.out.println(":::adminProfilePhoto");
		String filezUploadFolder = "emp";
		List<String> filePathName = new ArrayList<String>();
		String filename;
		int eNum = Integer.parseInt((String) session.getAttribute("id"));

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

			EmployeeDto employee = employeeService.selectOneEmp(eNum);
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
