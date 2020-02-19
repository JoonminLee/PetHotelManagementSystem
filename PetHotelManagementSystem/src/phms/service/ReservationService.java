package phms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.ReservationDto;
import phms.mapper.ReservationMapper;

@Service
public class ReservationService {

	@Autowired
	ReservationMapper reservationMapper;

	public ReservationDto selectOneReservation(String reId) {
		return reservationMapper.selectOneReservation(reId);
	}

	public <List> ReservationDto selectAllReservation() {
		return reservationMapper.selectAllReservation();
	}

	public int insertReservation(ReservationDto reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	public int updateReservation(ReservationDto reservation) {
		return reservationMapper.updateReservation(reservation);
	}

	public int deleteReservation(String reId) {
		return reservationMapper.deleteReservation(reId);
	}

}
