package phms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.RoomDto;
import phms.mapper.RoomMapper;

@Service
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper;
	
	public RoomDto selectOneRoom(int rNum) {
		return roomMapper.selectOneRoom(rNum);
	}
	
	public <List>RoomDto selectAllRoom(){
		return roomMapper.selectAllRoom();
	}
	
	public int insertRoom(RoomDto room) {
		return roomMapper.insertRoom(room);
	}

	public int updateRoom(RoomDto room) {
		return roomMapper.updateRoom(room);
	}

	public int deleteRoom(int rNum) {
		return roomMapper.deleteRoom(rNum);
	}

}
