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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public @ResponseBody List<PetDto> selectAllPet() {
		System.out.println(":::selectAllPet");
		List<PetDto> listPet = petService.selectAllPet();
		System.out.println(listPet.toString());
		return listPet;
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
		System.out.println();
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
	public @ResponseBody PetDto updatePet(@RequestParam("pNum") int pNum) {
		System.out.println(":::updatePet");
		PetDto pet = petService.selectOnePet(pNum);
		System.out.println(pet.toString());
		return pet;
	}

	@PostMapping("/updatePet")
	public @ResponseBody List<PetDto> updatePet(PetDto pet) {
		System.out.println(":::updatePet");
		System.out.println(pet.toString());
		petService.updatePet(pet);
		List<PetDto> listPet = petService.selectAllPet();
		return listPet;
	}
	
	//deletePet
	@RequestMapping("/deletePet")
	public @ResponseBody List<PetDto> deletePet(@RequestParam("pNum") int pNum) {
		System.out.println(":::deletePet");
		petService.deletePet(pNum);
		List<PetDto> listPet = petService.selectAllPet();
		return listPet;
	}
}
