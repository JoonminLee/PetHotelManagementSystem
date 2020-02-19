package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import phms.dto.DepartmentDto;
import phms.service.DepartmentService;

@Controller
@RequestMapping("/dep")
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;

	// selectOneDepartment
	@RequestMapping("/selectOneDepartment")
	public String selectOneDepartment(Model model) {
		System.out.println(":::selectOneDepartment");
		DepartmentDto department = departmentService.selectOneDepartment("사무관리부");
		System.out.println(department.toString());
		model.addAttribute("department", department);
		return "selectOneDepartment";
	}
	// selectAllDepartment
	@RequestMapping("/selectAllDepartment")
	public String selectAllDepartment(Model model) {
		System.out.println(":::selectAllDepartment");
		List<DepartmentDto> listDepartment = departmentService.selectAllDepartment();
		System.out.println(listDepartment.toString());
		model.addAttribute("listDepartment", listDepartment);
		return "selectAllDepartment";
	}
	// insertDepartment
	@GetMapping("/insertDepartment")
	public String insertDepartment() {
		System.out.println(":::insertDepartment");
		return "insertDepartment";
	}

}
