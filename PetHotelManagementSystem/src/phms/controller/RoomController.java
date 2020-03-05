package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.RoomDto;
import phms.dto.RoomSizeDto;
import phms.service.RoomService;
 
@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	RoomService roomService;
	
	//selectOneRoom
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
		List<RoomSizeDto> listBothOkRoom = roomService.selectBothOkRoom();
		List<RoomSizeDto> listPersonOnlyRoom = roomService.selectPersonOnlyRoom();
		List<RoomSizeDto> listPetOnlyRoom = roomService.selectPetOnlyRoom();
		model.addAttribute("listBothOkRoom", listBothOkRoom);
		model.addAttribute("listPersonOnlyRoom", listPersonOnlyRoom);
		model.addAttribute("listPetOnlyRoom", listPetOnlyRoom);
		return "selectAvailableRoom";
	}
	
	//roomTogether
	@RequestMapping("/roomTogether01")
	public String roomTogether01(Model model) {
		System.out.println(":::roomTogether01");
		return "roomTogether01";
	}
	
	//roomWithoutPet
	//roomPetOnly
	
	//insertRoom
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
	
	//updateRoom
	//관리자페이지
	@GetMapping("/updateRoom")
	public @ResponseBody RoomDto updateRoom(@RequestParam("rNum") int rNum) {
		System.out.println(":::updateRoom");
		RoomDto room = roomService.selectOneRoom(rNum);
		System.out.println(room.toString());
		return room;
	}
	
	//관리자페이지
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
