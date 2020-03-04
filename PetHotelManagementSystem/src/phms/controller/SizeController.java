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
	public @ResponseBody List<SizeDto> selectAllSize() {
		System.out.println(":::selectAllSize");

		List<SizeDto> listSize = sizeService.selectAllSize();
		System.out.println(listSize.toString());
		return listSize;
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
	// 관리자페이지
	@GetMapping("/updateSize")
	public @ResponseBody SizeDto updateSize(@RequestParam("sNum") int sNum) {
		System.out.println(":::updateSize");
		SizeDto size = sizeService.selectOneSize(sNum);
		System.out.println(size.toString());
		return size;
	}
	
	//관리자페이지
	@PostMapping("/updateSize")
	public @ResponseBody List<SizeDto> updateSize(SizeDto size) {
		System.out.println(":::updateSize");
		System.out.println(size.toString());
		sizeService.updateSize(size);
		List<SizeDto> listSize = sizeService.selectAllSize();
		return listSize;
	}
	
	//관리자페이지
	@RequestMapping("/deleteSize")
	public @ResponseBody List<SizeDto> deleteSize(@RequestParam("sNum") int sNum) {
		System.out.println(":::deleteSize");
		sizeService.deleteSize(sNum);
		List<SizeDto> listSize = sizeService.selectAllSize();
		return listSize;
	}
}
