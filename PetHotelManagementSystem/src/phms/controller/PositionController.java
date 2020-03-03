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
	public String selectOnePosition(Model model, @RequestParam("poNum") int poNum) {
		System.out.println(":::selectOnePosition");
		PositionDto position = positionService.selectOnePosition(poNum);
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
	public String insertPosition(PositionDto position) {
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
	public @ResponseBody PositionDto updatePosition(@RequestParam("poNum") int poNum) {
		System.out.println(":::updatePosition");
		PositionDto position = positionService.selectOnePosition(poNum);
		System.out.println(position.toString());
		return position;
	}
	@PostMapping("/updatePosition")
	public @ResponseBody List<PositionDto> updateUser(PositionDto position) {
		System.out.println(":::updatePosition");
		System.out.println(position.toString());
		positionService.updatePosition(position);
		List<PositionDto> listPosition = positionService.selectAllPosition();
		return listPosition;
	}
	
	// deletePosition
	@RequestMapping("/deletePosition")
	public @ResponseBody List<PositionDto> deletePosition(@RequestParam("poNum") int poNum) {
		System.out.println(":::deletePosition");
		positionService.deletePosition(poNum);
		List<PositionDto> listPosition = positionService.selectAllPosition();
		return listPosition;
	}
}
