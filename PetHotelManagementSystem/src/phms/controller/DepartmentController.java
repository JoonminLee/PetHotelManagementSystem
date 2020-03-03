package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.DepartmentDto;
import phms.service.DepartmentService;

@Controller
@RequestMapping("/dep")
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;

	// selectOneDepartment
	@RequestMapping("/selectOneDepartment")
	public @ResponseBody DepartmentDto selectOneDepartment(@RequestParam("dNum") int dNum) {
		System.out.println(":::selectOneDepartment");
		DepartmentDto department = departmentService.selectOneDepartment(dNum);
		System.out.println(department.toString());
		return department;
	}
	// selectAllDepartment
	@RequestMapping("/selectAllDepartment")
	public @ResponseBody List<DepartmentDto> selectAllDepartment() {
		System.out.println(":::selectAllDepartment");
		List<DepartmentDto> listDepartment = departmentService.selectAllDepartment();
		System.out.println(listDepartment.toString());
		return listDepartment;
	}
	// insertDepartment
	@GetMapping("/insertDepartment")
	public String insertDepartment() {
		System.out.println(":::insertDepartment");
		return "insertDepartment";
	}
	@PostMapping("/insertDepartment")
	public String insertDepartment(DepartmentDto department) {
		System.out.println(":::insertDepartmen");
		departmentService.insertDepartment(department);
		return "redirect:/dep/selectAllDepartment";
	}

	// updateDepartment
	@GetMapping("/updateDepartment")
	public @ResponseBody DepartmentDto updateDepartment(@RequestParam("dNum") int dNum) {
		System.out.println(":::updateDepartment");
		DepartmentDto department = departmentService.selectOneDepartment(dNum);
		System.out.println(department.toString());
		return department;
	}
	
	@PostMapping("/updateDepartment")
	public @ResponseBody List<DepartmentDto> DepartmentDtoupdateUser(DepartmentDto department) {
		System.out.println(":::updateDepartment");
		System.out.println(department.toString());
		departmentService.updateDepartment(department);
		List<DepartmentDto> listDepartment = departmentService.selectAllDepartment();
		return listDepartment;
	}

	// deleteDepartment
	@RequestMapping("/deleteDepartment")
	public @ResponseBody List<DepartmentDto> deleteDepartment(@RequestParam("dNum") int dNum) {
		System.out.println(":::deleteDepartment");
		departmentService.deleteDepartment(dNum);
		List<DepartmentDto> listDepartment = departmentService.selectAllDepartment();
		return listDepartment;
	}

}
