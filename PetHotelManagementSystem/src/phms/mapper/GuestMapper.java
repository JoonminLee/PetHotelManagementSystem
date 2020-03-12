package phms.mapper;

import java.time.LocalDate;
import java.util.List;

import phms.dto.GuestDto;
import phms.dto.PetDto;

public interface GuestMapper { 
	
	public List<GuestDto> selectTodayGuest(LocalDate today);
	
	public int todayGuestCnt(LocalDate today);
	
	public List<GuestDto> selectAllGuest();
	
	public int insertGuest(GuestDto guest);

}
