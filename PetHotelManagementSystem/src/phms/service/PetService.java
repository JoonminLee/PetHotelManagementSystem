package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.PetDto;
import phms.mapper.PetMapper;

@Service
public class PetService {
	
	@Autowired
	PetMapper petMapper;
	
	public PetDto selectOnePet(int pNum) {
		return petMapper.selectOnePet(pNum);
	}
	
	public List<PetDto> selectAllPet(){
		return petMapper.selectAllPet();
	}
	
	public int insertPet(PetDto pet) {
		return petMapper.insertPet(pet);
	}

	public int updatePet(PetDto pet) {
		return petMapper.updatePet(pet);
	}

	public int deletePet(int pNum) {
		return petMapper.deletePet(pNum);
	}
	
	public List<PetDto> selectAllUserPet(int pUNum){
		return petMapper.selectAllUserPet(pUNum);
	};
	
	public List<PetDto> selectAllVisitorPet(int pVNum){
		return petMapper.selectAllVisitorPet(pVNum);
	};

}
