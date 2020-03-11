package phms.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.dto.RoomSizeDto;
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
	
	public int selectOneRoomBySize(int rSNum) {
		return roomMapper.selectOneRoomBySize(rSNum);
	}

	public List<RoomDto> selectAllRoom() {

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

		RoomDto ReRNumRoom = new RoomDto();

		// 전체예약리스트
		List<ReservationDto> reserveAllList = reservationMapper.selectAllReservation();
		int ReRNum;

		for (int i = 0; i < reserveAllList.size(); i++) {

			LocalDate CheckIn = reserveAllList.get(i).getReCheckIn();
			LocalDate CheckOut = reserveAllList.get(i).getReCheckOut();

			System.out.println("방상태확인");
			// 오늘 체크인일 경우.
			if (CheckIn.isEqual(reDate)) {
				System.out.println("----------------CheckIn-----------------------------------------------");
				System.out.println(i + "번째 : " + reserveAllList.get(i).toString());
				ReRNum = reserveAllList.get(i).getReRNum();
				System.out.println(i + "번째  ReRNum : " + ReRNum);
				ReRNumRoom = roomMapper.selectOneRoom(ReRNum);
				System.out.println(i + "번째 변경전 : " + ReRNumRoom.toString());
				ReRNumRoom.setrStatus(1);
				roomMapper.updateRoom(ReRNumRoom);
				System.out.println(i + "번째 변경후 : " + ReRNumRoom.toString());
				System.out.println(timeH);

				// 3시 이전이면 상태를 0으로처리.
				if (timeH < 15) {
					ReRNumRoom.setrStatus(0);
					roomMapper.updateRoom(ReRNumRoom);
					System.out.println(i + "번째 변경후 : " + ReRNumRoom.toString());
				}

				// 오늘 체크아웃인 경우.
			} else if (CheckOut.isEqual(reDate)) {
				System.out.println("----------------CheckOut----------------------------------------------");
				System.out.println(i + "번째 : " + reserveAllList.get(i).toString());
				ReRNum = reserveAllList.get(i).getReRNum();
				System.out.println(i + "번째  ReRNum : " + ReRNum);
				ReRNumRoom = roomMapper.selectOneRoom(ReRNum);
				System.out.println(i + "번째 변경전 : " + ReRNumRoom.toString());
				ReRNumRoom.setrStatus(2);
				roomMapper.updateRoom(ReRNumRoom);
				System.out.println(i + "번째 변경후 : " + ReRNumRoom.toString());

				// 11시부터 2시까지 청소시간이 끝나면 0으로 상태변경
				if (!(timeH > 10 && timeH < 15)) {
					ReRNumRoom.setrStatus(0);
					roomMapper.updateRoom(ReRNumRoom);
					System.out.println("청소시간이 끝났습니다."); // 0
					System.out.println(i + "번째 변경후 : " + ReRNumRoom.toString());

				}
			} else {
				System.out.println("----------------나머지---------------------------------------------------");
				System.out.println(i + "번째 : " + reserveAllList.get(i).toString());
			}
		}

		return roomMapper.selectAllRoom();
	}

	public List<RoomSizeDto> selectAllAvailable() {
		return roomMapper.selectAllAvailable();
	}

	public List<RoomSizeDto> selectPersonOnlyRoom() {
		return roomMapper.selectPersonOnlyRoom();
	}

	public List<RoomSizeDto> selectBothOkRoom() {
		return roomMapper.selectBothOkRoom();
	}

	public List<RoomSizeDto> selectPetOnlyRoom() {
		return roomMapper.selectPetOnlyRoom();
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
