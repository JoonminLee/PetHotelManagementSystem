package phms.mapper;

import java.time.LocalDate;
import java.util.List;

import phms.dto.ReservationDto;

public interface ReservationMapper {
	
	//날짜로 조회하기.
	public List<ReservationDto> selectCheckInReservation(LocalDate reDate);
	
	public List<ReservationDto> selectCheckOutReservation(LocalDate reDate);
	
	public ReservationDto selectOneReservation(String reId);
	
	public ReservationDto selectByReRNum(int reRNum);
	
	public List<ReservationDto> selectAllReservation();
	
	public int insertReservation(ReservationDto reservation);

	public int updateReservation(ReservationDto reservation);

	public int deleteReservation(String reId);

}
