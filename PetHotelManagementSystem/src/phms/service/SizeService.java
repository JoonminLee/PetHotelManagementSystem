package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.SizeDto;
import phms.mapper.SizeMapper;

@Service
public class SizeService {
	
	@Autowired
	SizeMapper sizeMapper;
	
	public SizeDto selectOneSize(int sNum) {
		return sizeMapper.selectOneSize(sNum);
	}
	
	public List<SizeDto> selectAllSize(){
		return sizeMapper.selectAllSize();
	}
	
	public int insertSize(SizeDto size) {
		return sizeMapper.insertSize(size);
	}

	public int updateSize(SizeDto size) {
		return sizeMapper.updateSize(size);
	}

	public int deleteSize(int sNum) {
		return sizeMapper.deleteSize(sNum);
	}

}
