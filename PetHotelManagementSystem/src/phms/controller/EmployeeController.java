package phms.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.EmployeeDto;
import phms.service.EmployeeService;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	// selectOneEmp
	@RequestMapping("/selectOneEmp")
	public String selectOneEmp(Model model) {
		System.out.println(":::selectOneEmp");
		EmployeeDto employee = employeeService.selectOneEmp(1);
		System.out.println(employee.toString());
		model.addAttribute("employee", employee);
		return "selectOneEmp";
	}

	// selectAllEmp
	@RequestMapping("/selectAllEmp")
	public @ResponseBody List<EmployeeDto> selectAllEmp() {
		System.out.println(":::selectAllEmp");
		List<EmployeeDto> listEmployee = employeeService.selectAllEmp();
		System.out.println(listEmployee.toString());
		return listEmployee;
	}

	// insertEmp
	@GetMapping("/insertEmp")
	public String insertEmp() {
		System.out.println(":::insertEmp");
		return "insertEmp";
	}

	// insertEmp
	@PostMapping("/insertEmp")
	public String insertEmp(@RequestParam("ePhone1") String ePhone1, @RequestParam("ePhone2") String ePhone2,
			@RequestParam("eHireDateStr") String eHireDateStr, EmployeeDto employee) {
		System.out.println(":::insertEmp");
		employee.seteHireDate(LocalDate.parse(eHireDateStr));
		employee.setePhone("010-" + ePhone1 + "-" + ePhone2);
		int result = employeeService.insertEmp(employee);
		if (result == 1) {
			System.out.println("insertEmp 성공");
			return "redirect:/emp/selectAllEmp";
		} else {
			System.out.println("insertEmp 실패");
			return "redirect:/emp/insertEmp";
		}
	}

	@GetMapping("/updateEmp")
	public String updateEmp(Model model, @RequestParam("eNum") String eNum) {
		System.out.println(":::updateEmp");
		EmployeeDto employee = employeeService.selectOneEmp(Integer.parseInt(eNum));
		System.out.println(employee.toString());
		model.addAttribute("employee", employee);
		return "updateEmp";
	}

	@PostMapping("/updateEmp")
	public String updateEmp(EmployeeDto employee) {
		System.out.println(":::updateEmp");
		System.out.println(employee.toString());
		int result = employeeService.updateEmp(employee);
		if (result == 1) {
			System.out.println("updateEmp 성공");
			return "redirect:/emp/selectAllEmp";
		} else {
			System.out.println("updateEmp 실패");
			return "redirect:/emp/updateEmp";
		}
	}

	@RequestMapping("/deleteEmp")
	public String deleteEmp(Model model, @RequestParam("eNum") String eNum) {
		System.out.println(":::deleteUser");
		int result = employeeService.deleteEmp(Integer.parseInt(eNum));
		if (result == 1) {
			System.out.println("deleteEmp 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/emp/selectAllEmp";
		} else {
			System.out.println("deleteEmp 실패");
			model.addAttribute("result", "삭제 실패 : 고객센터에 문의해주세요");
			return "redirect:/emp/selectAllEmp";
		}
	}

}
