package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.PositionDto;
import phms.mapper.PositionMapper;
@Service
public class PositionService {
	@Autowired
	PositionMapper positionMapper;
	
	public PositionDto selectOnePosition(int poNum) {
		return positionMapper.selectOnePosition(poNum);
	}
	public List<PositionDto> selectAllPosition() {
		return positionMapper.selectAllPosition();
	}

	public int insertPosition(PositionDto position) {
		return positionMapper.insertPosition(position);
	}

	public int updatePosition(PositionDto position) {
		return positionMapper.updatePosition(position);
	}

	public int deletePosition(int poNum) {
		return positionMapper.deletePosition(poNum);
	}
}
