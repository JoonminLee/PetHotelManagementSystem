package phms.mapper;


import java.util.List;

import phms.dto.RoomDto;

public interface RoomMapper {

	public RoomDto selectOneRoom(int rNum);
	
	public List<RoomDto> selectAllRoom();
	
	public int insertRoom(RoomDto room);

	public int updateRoom(RoomDto room);

	public int deleteRoom(int rNum);
}
