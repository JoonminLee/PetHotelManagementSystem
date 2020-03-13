package phms.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.ReRoomSizeDto;
import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.mapper.ReservationMapper;
import phms.mapper.RoomMapper;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper reservationMapper;

	@Autowired
	RoomMapper roomMapper;

	public ReservationDto selectOneReservation(String reId) {
		return reservationMapper.selectOneReservation(reId);
	}

	public ReservationDto selectByReRNum(int reRNum) {
		return reservationMapper.selectByReRNum(reRNum);
	}
	
	public List<ReservationDto> selectReservationByRoomSize(int reSNum){
		return reservationMapper.selectReservationByRoomSize(reSNum);
	}
	
	//오늘날짜 카운
	public int todayReserveCnt(LocalDate today) {
		return reservationMapper.todayReserveCnt(today);
	}

	public List<ReservationDto> selectAllReservation() {
		return reservationMapper.selectAllReservation();
	}

	public int insertReservation(ReservationDto reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	// 방을 변경 시, 방사이즈도 설정된 방사이즈에 맞게 자동으로 변경되게 하는 메소드.
	public int updateReservation(ReservationDto reservation) {

		List<RoomDto> roomList = roomMapper.selectAllRoom();

		// 예약리스트의 방번호 추출.
		int reRNum = reservation.getReRNum(); // 7

		for (int j = 0; j < roomList.size(); j++) { // 7
			// 룸리스트의 방번호 추출.
			int rNum = roomList.get(j).getrNum(); // 1...7
			// 룸리스트의 방번호와 예약리스트의 방번호가 같을때
			if (rNum == reRNum) {
				// 룸리스트의 방번호 사이즈 추출.
				int sNum = roomList.get(j).getrSNum();

				reservation.setReSNum(sNum);
				reservationMapper.updateReservation(reservation);
			}

		}
		return reservationMapper.updateReservation(reservation);
	}

	public int deleteReservation(int reNum) {
		return reservationMapper.deleteReservation(reNum);
	}

	public List<ReRoomSizeDto> selectAllReRoomSizeDto(String id) {
		return reservationMapper.selectAllReRoomSizeDto(id);
	}

}
