package phms.mapper;

import java.util.List;

import phms.dto.PositionDto;

public interface PositionMapper {
public PositionDto selectOnePosition(String poName);
	
	public List<PositionDto> selectAllPosition();
	
	public int insertPosition(PositionDto position);
	
	public int updatePosition(PositionDto position);
	
	public int deletePosition(String poName);
}
