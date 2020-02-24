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

import phms.dto.PositionDto;
import phms.service.PositionService;

@Controller
@RequestMapping("/posi")
public class PositionController {
	@Autowired
	PositionService positionService;

	// selectOnePosition
	@RequestMapping("/selectOnePosition")
	public String selectOnePosition(Model model) {
		System.out.println(":::selectOnePosition");
		PositionDto position = positionService.selectOnePosition("관리자");
		System.out.println(position.toString());
		model.addAttribute("position", position);
		return "selectOnePosition";
	}
	// selectAllPosition
	@RequestMapping("/selectAllPosition")
	public @ResponseBody List<PositionDto> selectAllPosition() {
		System.out.println(":::selectAllPosition");
		List<PositionDto> listPosition = positionService.selectAllPosition();
		System.out.println(listPosition.toString());
		return listPosition;
	}
	// insertPosition
	@GetMapping("/insertPosition")
	public String insertPosition() {
		System.out.println(":::insertPosition");
		return "insertPosition";
	}
	@PostMapping("/insertPosition")
	public String insertPosition(PositionDto position, @RequestParam("poName") String poName) {
		System.out.println(":::insertPosition");
		int result = positionService.insertPosition(position);
		if (result == 1) {
			System.out.println("insertPosition 성공");
			return "redirect:/posi/selectAllPosition";
		} else {
			System.out.println("insertPosition 실패");
			return "redirect:/posi/insertPosition";
		}
	}
	

	// updatePosition
	@GetMapping("/updatePosition")
	public String updatePosition(Model model, @RequestParam("poName") String poName) {
		System.out.println(":::updatePosition");
		PositionDto position = positionService.selectOnePosition(poName);
		System.out.println(position.toString());
		model.addAttribute("position", position);
		return "updatePosition";
	}
	@PostMapping("/updatePosition")
	public String updateUser(PositionDto position) {
		System.out.println(":::updatePosition");
		System.out.println(position.toString());
		int result = positionService.updatePosition(position);
		if (result == 1) {
			System.out.println("updatePosition 성공");
			return "redirect:/posi/selectAllPosition";
		} else {
			System.out.println("updatePosition 실패");
			return "redirect:/posi/updatePosition";
		}
	}
	
	// deletePosition
	@RequestMapping("/deletePosition")
	public String deletePosition(Model model, @RequestParam("poName") String poName) {
		System.out.println(":::deletePosition");
		int result = positionService.deletePosition(poName);
		if (result == 1) {
			System.out.println("deletePosition 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/posi/selectAllPosition";
		} else {
			System.out.println("deletePosition 실패");
			model.addAttribute("result", "삭제 실패");
			System.out.println("testest");
			return "redirect:/posi/selectAllPosition";
		}
	}
}
