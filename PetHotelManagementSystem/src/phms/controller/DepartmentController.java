package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@PostMapping("/insertDepartment")
	public String insertDepartment(DepartmentDto department, @RequestParam("dName") String dName) {
		System.out.println(":::insertDepartmen");
		int result = departmentService.insertDepartment(department);
		if (result == 1) {
			System.out.println("insertDepartment 성공");
			return "redirect:/dep/selectAllDepartment";
		} else {
			System.out.println("insertDepartment 실패");
			return "redirect:/dep/insertDepartment";
		}
	}
	

	// updateDepartment
	@GetMapping("/updateDepartment")
	public String updateDepartment(Model model, @RequestParam("dName") String dName) {
		System.out.println(":::updateDepartment");
		DepartmentDto department = departmentService.selectOneDepartment(dName);
		System.out.println(department.toString());
		model.addAttribute("department", department);
		return "updateDepartment";
	}
	@PostMapping("/updateDepartment")
	public String updateUser(DepartmentDto department) {
		System.out.println(":::updateDepartment");
		System.out.println(department.toString());
		int result = departmentService.updateDepartment(department);
		if (result == 1) {
			System.out.println("updateDepartment 성공");
			return "redirect:/dep/selectAllDepartment";
		} else {
			System.out.println("updateDepartment 실패");
			return "redirect:/dep/updateDepartment";
		}
	}

	// deleteDepartment
	@RequestMapping("/deleteDepartment")
	public String deleteDepartment(Model model, @RequestParam("dName") String dName) {
		System.out.println(":::deleteDepartment");
		int result = departmentService.deleteDepartment(dName);
		if (result == 1) {
			System.out.println("deleteDepartment 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/dep/selectAllDepartment";
		} else {
			System.out.println("deleteDepartment 실패");
			model.addAttribute("result", "삭제 실패");
			System.out.println("testest");
			return "redirect:/dep/selectAllDepartment";
		}
	}

}
