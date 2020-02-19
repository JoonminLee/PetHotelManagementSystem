package phms.mapper;

import java.util.List;

import phms.dto.ReservationDto;

public interface ReservationMapper {
	
	public ReservationDto selectOneReservation(String reId);
	
	public List<ReservationDto> selectAllReservation();
	
	public int insertReservation(ReservationDto reservation);

	public int updateReservation(ReservationDto reservation);

	public int deleteReservation(String reId);

}
