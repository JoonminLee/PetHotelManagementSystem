package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.VisitorDto;
import phms.mapper.VisitorMapper;

@Service
public class VisitorService {
	
	@Autowired
	VisitorMapper visitorMapper;
	
	public VisitorDto selectOneVisitor(String vId) {
		return visitorMapper.selectOneVisitor(vId);
	}

	public List<VisitorDto> selectAllVisitor(){
		return visitorMapper.selectAllVisitor();
	}

	public int insertVisitor(VisitorDto visitor) {
		return visitorMapper.insertVisitor(visitor);
	}

	public int updateVisitor(VisitorDto visitor) {
		return visitorMapper.updateVisitor(visitor);
	}

	public int deleteVisitor(String vId) {
		return visitorMapper.deleteVisitor(vId);
	}
}
