package phms.mapper;

import java.util.List;

import phms.dto.SizeDto;

public interface SizeMapper {
	
	public SizeDto selectOneSize(int sNum);
	
	public List<SizeDto> selectAllSize();
	
	public int insertSize(SizeDto size);

	public int updateSize(SizeDto size);

	public int deleteSize(int sNum);

}
