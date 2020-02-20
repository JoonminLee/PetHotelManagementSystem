package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.SizeDto;
import phms.service.SizeService;

@Controller
@RequestMapping("/size")
public class SizeController {

	@Autowired
	SizeService sizeService;

	// selectOneSize
	@RequestMapping("/selectOneSize")
	public String selectOneSize(Model model) {
		System.out.println(":::selectOneSize");

		SizeDto size = sizeService.selectOneSize(1);
		System.out.println(size.toString());
		model.addAttribute("size", size);
		return "selectOneSize";
	}

	// selectAllSize
	@RequestMapping("/selectAllSize")
	public String selectAllSize(Model model) {
		System.out.println(":::selectAllSize");

		List<SizeDto> listSize = sizeService.selectAllSize();
		System.out.println(listSize.toString());
		model.addAttribute("listSize", listSize);
		return "selectAllSize";
	}

	// insertSize
	@GetMapping("/insertSize")
	public String insertSize() {
		System.out.println(":::insertSize");
		return "insertSize";
	}

	@PostMapping("/insertSize")
	public String insertSize(SizeDto size) {

		System.out.println(":::insertSize");
		int result = sizeService.insertSize(size);

		if (result == 1) {
			System.out.println("insertRoom 성공");
			return "redirect:/size/selectAllSize";
		} else {
			System.out.println("insertRoom 실패");
			return "redirect:/size/insertSize";
		}
	}

	// updateSize
	@GetMapping("/updateSize")
	public String updateSize(Model model, @RequestParam("sNum") int sNum) {
		System.out.println(":::updateSize");
		
		SizeDto size = sizeService.selectOneSize(sNum);
		
		System.out.println(size.toString());
		model.addAttribute("room", size);
		return "updateSize";
	}

	@PostMapping("/updateSize")
	public String updateSize(SizeDto size) {
		System.out.println(":::updateSize");
		System.out.println(size.toString());
		int result = sizeService.updateSize(size);
		if (result == 1) {
			System.out.println("updateSize 성공");
			return "redirect:/size/selectAllSize";
		} else {
			System.out.println("updateRoom 실패");
			return "redirect:/size/updateSize";
		}
	}
	
	@RequestMapping("/deleteSize")
	public String deleteSize(Model model, @RequestParam("sNum") int sNum) {
		System.out.println(":::deleteSize");
		int result = sizeService.deleteSize(sNum);
		if (result == 1) {
			System.out.println("deleteSize 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/size/selectAllSize";
		} else {
			System.out.println("deleteSize 실패");
			model.addAttribute("result", "삭제 실패 : 고객센터에 문의해주세요");
			return "redirect:/size/selectAllSize";
		}
	}
}
