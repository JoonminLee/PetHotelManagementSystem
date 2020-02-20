package phms.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.mapper.ReservationMapper;
import phms.mapper.RoomMapper;

@Service
public class RoomService {
	
	@Autowired
	RoomMapper roomMapper;
	
	@Autowired
	ReservationMapper reservationMapper;
	
	public RoomDto selectOneRoom(int rNum) {
		return roomMapper.selectOneRoom(rNum);
	}
	
	//아직미완성..
	public List<RoomDto> selectAllRoom(){
		
		SimpleDateFormat format1 = new SimpleDateFormat("HH");
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");

		Date now = new Date();

		// 시간
		String time = format1.format(now);
		int timeH = Integer.parseInt(time);

		// 날짜
		String ToDay = format.format(now);
		LocalDate reDate = LocalDate.parse(ToDay);

		System.out.println("Today: " + reDate);

		// 전체방리스트
		List<RoomDto> roomList = roomMapper.selectAllRoom();

		// 예약전체사이즈
		int reAllSize = reservationMapper.selectAllReservation().size();

		// 오늘 체크인 예약리스트
		List<ReservationDto> TodayCheckInList = reservationMapper.selectCheckInReservation(reDate);
		for (int i =0; i<TodayCheckInList.size(); i++) {
			//오늘예약한방 번호추출
			int ReRNum = TodayCheckInList.get(i).getReRNum();
			System.out.println(i+"번째  ReRNum : "+ReRNum);
			//ReRNum이 동일한 room을 select한뒤 상태변경
			RoomDto ReRNumRoom = roomMapper.selectOneRoom(ReRNum);
			ReRNumRoom.setrStatus(1);
			System.out.println(i+"번째  "+ReRNumRoom.toString());
		
		// 오늘 체크아웃 예약리스트...
			
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
