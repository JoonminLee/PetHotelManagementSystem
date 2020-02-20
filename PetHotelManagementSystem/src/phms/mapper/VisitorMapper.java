package phms.mapper;

import java.util.List;

import phms.dto.VisitorDto;

public interface VisitorMapper {
	public VisitorDto selectOneVisitor(String vId);

	public List<VisitorDto> selectAllVisitor();
	
	public int insertVisitor(VisitorDto visitor);

	public int updateVisitor(VisitorDto visitor);

	public int deleteVisitor(String vId);
}
