package phms.mapper;

import java.util.List;

import phms.dto.VisitorDto;
import phms.dto.VisitorRoomSizeDto;

public interface VisitorMapper {
	public VisitorDto selectOneVisitor(String vId);

	public List<VisitorDto> selectAllVisitor();
	
	public int insertVisitor(VisitorDto visitor);

	public int updateVisitor(VisitorDto visitor);

	public int deleteVisitor(String vId);
	
	public VisitorRoomSizeDto selectVisitorRoom(String vId);
	
	public List<VisitorRoomSizeDto> selectVisitorRoomAll();
	
	public int deleteVisitorRoom(String vId);
}
