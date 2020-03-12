package phms.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.GuestDto;
import phms.dto.PetDto;
import phms.mapper.GuestMapper;
import phms.mapper.PetMapper;

@Service
public class GuestService {
	
	@Autowired
	GuestMapper guestMapper;
	
	public int todayGuestCnt(LocalDate today) {
		return guestMapper.todayGuestCnt(today);
	}
	
	public List<GuestDto> selectAllGuest(){
		return guestMapper.selectAllGuest();
	}
	
	public int insertGuest(GuestDto guest) {
		
		//오늘날짜, 방문자 아이디.
		String gId = guest.getgId();
		LocalDate today = LocalDate.now();
		
		System.out.println("ListId:::"+gId);
		List<GuestDto> guestTodayList = guestMapper.selectTodayGuest(today);
		System.out.println("guestTodayList:::"+guestTodayList);
		System.out.println("size:::"+guestTodayList.size());
		int result =0;
		 
		for(int i=0; i<guestTodayList.size(); i++) {
			
			System.out.println(i+":::ListId:::"+guestTodayList.get(i).getgId());
			System.out.println(i+":::같니??:::"+gId.equals(guestTodayList.get(i).getgId()));
			
			//아이디가 다를 경우 result값에 1씩 증가
			if(gId.equals(guestTodayList.get(i).getgId())==false){
				result += 1;
				System.out.println("result:::"+result);
			}
			
		}
		
		//result값이 todayList 값과 일치하면 
		//리스트에 일치하는 값이 없으므로 insert
		if(result==guestTodayList.size()) {
			System.out.println("guest추가");
			return guestMapper.insertGuest(guest);
		}
		
		return 0;
	}

}
