package phms.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.PetDto;
import phms.dto.UserDto;
import phms.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	PetService petService;
	
	//selectOnePet
	@RequestMapping("/selectOnePet")
	public String selectOnePet(Model model, @RequestParam("pNum") int pNum) {
		System.out.println(":::selectOnePet");
		PetDto pet = petService.selectOnePet(pNum);
		System.out.println(pet.toString());
		model.addAttribute("pet", pet);
		return "selectOnePet";
	}

	// selectAllpet
	@RequestMapping("/selectAllPet")
	public String selectAllPet(Model model) {
		System.out.println(":::selectAllPet");
		List<PetDto> listPet = petService.selectAllPet();
		System.out.println(listPet.toString());
		model.addAttribute("listPet", listPet);
		return "selectAllPet";
	}
	
	// insertPet
	// 펫추가?? 어디서함(마이페이지?회원가입?)
	@GetMapping("/insertPet")
	public String insertPet() {
		System.out.println(":::insertPet");
		return "insertPet";
	}

	// insertPet
	@PostMapping("/insertPet")
	public String insertPet(PetDto pet) {
		System.out.println(":::insertPet");
		int result = petService.insertPet(pet);
		if (result == 1) {
			System.out.println("insertPet 성공");
			return "redirect:/pet/selectAllPet";
		} else {
			System.out.println("insertPet 실패");
			return "redirect:/pet/insertPet";
		}
	}
	
	// updatePet
	@GetMapping("/updatePet")
	public String updatePet(Model model, @RequestParam("pNum") int pNum) {
		System.out.println(":::updatePet");
		PetDto pet = petService.selectOnePet(pNum);
		System.out.println(pet.toString());
		model.addAttribute("pet", pet);
		return "updatePet";
	}

	@PostMapping("/updatePet")
	public String updatePet(PetDto pet) {
		System.out.println(":::updatePet");
		System.out.println(pet.toString());
		int result = petService.updatePet(pet);
		if (result == 1) {
			System.out.println("updatePet 성공");
			return "redirect:/pet/selectAllPet";
		} else {
			System.out.println("updatePet 실패");
			return "redirect:/pet/updatePet";
		}
	}
	
	//deleteUser
	@RequestMapping("/deletePet")
	public String deletePet(Model model, @RequestParam("pNum") int pNum) {
		System.out.println(":::deletePet");
		int result = petService.deletePet(pNum);
		if (result == 1) {
			System.out.println("deletePet 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/pet/selectAllPet";
		} else {
			System.out.println("deletePet 실패");
			model.addAttribute("result", "삭제 실패 : 고객센터에 문의해주세요");
			return "redirect:/pet/selectAllPet";
		}
	}
}
