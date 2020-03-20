package phms.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.NoDupliFileName;
import phms.dto.EmployeeDto;
import phms.dto.PetDto;
import phms.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {

	@Autowired
	PetService petService;

	@Autowired
	NoDupliFileName npfn;

	// selectOnePet
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

	@GetMapping("/petPhoto")
	public String petPhoto(Model model, @RequestParam("pNum") int pNum) {
		System.out.println(":::petPhoto");
		model.addAttribute("pNum", pNum);
		return "petPhoto";
	}

	@PostMapping("/petPhoto")
	public @ResponseBody String petPhoto(MultipartFile[] filezData, @RequestParam("pNum") int pNum) {
		System.out.println(":::petPhoto");
		String filezUploadFolder = "pet";
		List<String> filePathName = new ArrayList<String>();
		String filename;
		System.out.println(pNum);

		for (MultipartFile mf : filezData) {
			filename = npfn.noDupliFileName(mf);
			filePathName.add(filezUploadFolder + "/" + filename);

			File file = new File(filezUploadFolder);

			if (!file.exists()) {
				file.mkdirs();
				file = new File(filezUploadFolder, filename);
			} else {
				file = new File(filezUploadFolder, filename);
			}

			try {
				mf.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}

			PetDto pet = petService.selectOnePet(pNum);
			if (pet.getpPhoto() != null) {

				String[] petPhotoPath = pet.getpPhoto().split("/");

				File fdfd = new File(
						"C:/Users/jay/git/PetHotelManagementSystem/PetHotelManagementSystem/WebContent/WEB-INF/images/"
								+ petPhotoPath[2] + "/" + petPhotoPath[3]);

				if (fdfd.exists()) {
					System.out.println(petPhotoPath[3] + "삭제합니다");
					if (fdfd.delete()) {
						System.out.println(":::펫 사진 삭제 성공");
					} else {
						System.out.println(":::펫 사진 삭제 실패");
					}
				} else {
					System.out.println(":::펫 사진이 존재하지 않습니다");
				}
			}

			pet.setpPhoto("/image/" + filePathName.get(0));

			petService.updatePet(pet);

		}
		return "success";

	}

	// deletePet
	@RequestMapping("/deletePet")
	public @ResponseBody List<PetDto> deletePet(@RequestParam("pNum") int pNum) {
		System.out.println(":::deletePet");
		petService.deletePet(pNum);
		List<PetDto> listPet = petService.selectAllPet();
		return listPet;
	}
}
