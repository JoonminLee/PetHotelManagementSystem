package phms.mapper;


import java.util.List;

import phms.dto.RoomDto;
import phms.dto.RoomSizeDto;

public interface RoomMapper {

	public RoomDto selectOneRoom(int rNum);
	
	public List<RoomDto> selectAllRoom();
	
	public List<RoomSizeDto> selectAllAvailable();
	
	public List<RoomSizeDto> selectPersonOnlyRoom();
	
	public List<RoomSizeDto> selectBothOkRoom();
	
	public List<RoomSizeDto> selectPetOnlyRoom();
	
	public int insertRoom(RoomDto room);

	public int updateRoom(RoomDto room);

	public int deleteRoom(int rNum);

}
