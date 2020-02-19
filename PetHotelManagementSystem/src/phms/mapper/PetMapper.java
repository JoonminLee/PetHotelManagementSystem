package phms.mapper;

import java.util.List;

import phms.dto.PetDto;

public interface PetMapper {
	
	public PetDto selectOnePet(int pNum);
	
	public List<PetDto> selectAllPet();
	
	public int insertPet(PetDto pet);

	public int updatePet(PetDto pet);

	public int deletePet(int pNum);

}
