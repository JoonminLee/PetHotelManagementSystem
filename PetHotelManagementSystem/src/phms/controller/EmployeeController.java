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
	public @ResponseBody EmployeeDto updateEmp(@RequestParam("eNum") int eNum) {
		System.out.println(":::updateEmp");
		EmployeeDto employee = employeeService.selectOneEmp(eNum);
		System.out.println(employee.toString());
		return employee;
	}
	
	//관리자 페이지
	@PostMapping("/updateEmp")
	public @ResponseBody List<EmployeeDto> updateEmp(EmployeeDto employee, @RequestParam("eHireDateStr") String eHireDateStr) {
		System.out.println(":::updateEmp");
		employee.seteHireDate(LocalDate.parse(eHireDateStr));
		employeeService.updateEmp(employee);
		System.out.println(employee.toString());
		List<EmployeeDto> listEmp = employeeService.selectAllEmp();
		return listEmp;
	}

	@RequestMapping("/deleteEmp")
	public @ResponseBody List<EmployeeDto> deleteEmp(@RequestParam("eNum") int eNum) {
		System.out.println(":::deleteUser");
		employeeService.deleteEmp(eNum);
		List<EmployeeDto> listEmp = employeeService.selectAllEmp();
		return listEmp;
		
	}

}
