package phms.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.priceCalculator;
import phms.dto.ReservationDto;
import phms.dto.RoomDto;
import phms.dto.SizeDto;
import phms.service.ReservationService;
import phms.service.RoomService;
import phms.service.SizeService;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	RoomService roomService;

	@Autowired
	SizeService sizeService;

	@Autowired
	ReservationService reservationService;

	@Autowired
	priceCalculator checkIO;

	// selectOneRoom
	@RequestMapping("/selectOneRoom")
	public String selectOneRoom(Model model) {
		System.out.println(":::selectOneRoom");
		RoomDto room = roomService.selectOneRoom(1);
		System.out.println(room.toString());
		model.addAttribute("room", room);
		return "selectOneRoom";
	}

	// selectAllRoom
	@RequestMapping("/selectAllRoom")
	public @ResponseBody List<RoomDto> selectAllRoom() {
		System.out.println(":::selectAllRoom");
		List<RoomDto> listRoom = roomService.selectAllRoom();
		System.out.println(listRoom.toString());
		return listRoom;
	}

	// selectAllAvailable
	@RequestMapping("/selectAvailableRoom")
	public String selectAvailableRoom(Model model) {
		System.out.println(":::selectAvailableRoom");
		List<SizeDto> listSize = sizeService.selectAllSize();
		model.addAttribute("listSize", listSize);
		return "selectAvailableRoom";
	}

	// roomTogether
	@GetMapping("/roomTogether")
	public String roomTogether(@RequestParam("reSNum") int rSNum, Model model) {
		System.out.println(":::roomTogether");
		SizeDto size = sizeService.selectOneSize(rSNum);
		model.addAttribute("size", size);
		return "roomTogether";
	}

	// roomTogether
	@PostMapping("/roomTogether")
	public @ResponseBody ArrayList<String> roomTogether(HttpSession session, int reSNum) {
		// session에서 checkIO값과 size값을 가져온다.
		System.out.println(":::roomTogether");

		// size(아담)기준으로 예약리스트를 불러온다.
		List<ReservationDto> reSNumList = reservationService.selectReservationByRoomSize(reSNum);

		// 아담방 체크인-체크아웃 날짜를 담았던 리스트를 담는 전체리스트를 만듬.
		ArrayList<String> allDate = new ArrayList<String>();

		// reSNumList 사이즈만큼 반복한다.
		for (int i = 0; i < reSNumList.size(); i++) {

			// 예약리스트의 체크인날짜와 체크아웃 날짜를 가져온다.
			String reCheckIn = reSNumList.get(i).getReCheckIn().toString();
			String reCheckOut = reSNumList.get(i).getReCheckOut().toString();

			// 아담방으로 예약한 예약리스트에서 체크인-체크아웃 사이 날짜를 불러와 arraylist에 담음.
			ArrayList<String> reCheckIODate = checkIO.checkIOBetweenSelectDate(reCheckIn, reCheckOut);

			System.out.println("reCheckIODate:::" + reCheckIODate);

			// 체크인-쳌아웃으로 불러온리스트를 전체리스트에 담음.
			allDate.addAll(reCheckIODate);
		}
		

		// 중복값 제거한 후 리스트에 담기
		List allDateSet = new ArrayList(new HashSet(allDate));

		// 중복이 3번된 값을 찾아서 list 담기
		ArrayList<String> resultList = new ArrayList<String>();
		// 중복값을 제거하지 않은 리스트와 비교
		for (int i = 0; i < allDateSet.size(); i++) {
			int result = 0;

			for (int j = 0; j < allDate.size(); j++) {

				// 만약 중복을 제거한 후 list의 값과 제거하지 않은 인덱스 값이 같을 경우
				if (allDateSet.get(i).equals(allDate.get(j))) {
					result += 1;
				}

			}
			// 중복이 3번 되었을 경우 list에 담기
			if (result == 3) {
				resultList.add((String) allDateSet.get(i));
			}

		}
		System.out.println("중복된 날짜:::" + resultList);

		return resultList;
	}

	// insertRoom
	@GetMapping("/insertRoom")
	public String insertRoom() {
		System.out.println(":::insertRoom");
		return "insertRoom";
	}

	@PostMapping("/insertRoom")
	public String insertRoom(RoomDto room) {
		System.out.println(":::insertRoom");
		int result = roomService.insertRoom(room);
		if (result == 1) {
			System.out.println("insertRoom 성공");
			return "redirect:/room/selectAllRoom";
		} else {
			System.out.println("insertRoom 실패");
			return "redirect:/room/insertRoom";
		}
	}

	// updateRoom
	// 관리자페이지
	@GetMapping("/updateRoom")
	public @ResponseBody RoomDto updateRoom(@RequestParam("rNum") int rNum) {
		System.out.println(":::updateRoom");
		RoomDto room = roomService.selectOneRoom(rNum);
		System.out.println(room.toString());
		return room;
	}

	// 관리자페이지
	@PostMapping("/updateRoom")
	public @ResponseBody List<RoomDto> updateRoom(RoomDto room) {
		System.out.println(":::updateRoom");
		System.out.println(room.toString());
		roomService.updateRoom(room);
		List<RoomDto> listRoom = roomService.selectAllRoom();
		return listRoom;
	}

	@RequestMapping("/deleteRoom")
	public @ResponseBody List<RoomDto> deleteUser(@RequestParam("rNum") int rNum) {
		System.out.println(":::deleteRoom");
		roomService.deleteRoom(rNum);
		List<RoomDto> listRoom = roomService.selectAllRoom();
		return listRoom;
	}
}
