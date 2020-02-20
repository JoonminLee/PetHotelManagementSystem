package phms.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
	
	public List<RoomDto> selectAllRoom(){
		
		SimpleDateFormat format1 = new SimpleDateFormat("HH");
		Date now = new Date();
		String time = format1.format(now);
		int timeH = Integer.parseInt(time);
		System.out.println(timeH);

		List<RoomDto> list = roomMapper.selectAllRoom();
		
		//12시~15시는 청소시간이면 status = 2(청소시간) 
		for (int i = 0; i < list.size(); i++) {
			RoomDto room = list.get(i);
			if (timeH > 11 && timeH < 14) {
				room.setrStatus(2);
				roomMapper.updateRoom(room);
				System.out.println("청소시간입니다."); // 2
				}else {
					//나머지시간은 status = 0 (빈방)
					room.setrStatus(0);
					roomMapper.updateRoom(room);
					System.out.println("빈방입니다.");
					//사용중일 경우 status = 1 (예약이 안되어있으면 0)
			}

		}
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
