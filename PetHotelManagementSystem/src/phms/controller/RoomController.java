package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.RoomDto;
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
	public String selectAllRoom(Model model) {
		System.out.println(":::selectAllRoom");
		List<RoomDto> listRoom = roomService.selectAllRoom();
		System.out.println(listRoom.toString());
		model.addAttribute("listRoom", listRoom);
		return "selectAllRoom";
	}
	
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
	@GetMapping("/updateRoom")
	public String updateRoom(Model model, @RequestParam("rNum") int rNum) {
		System.out.println(":::updateRoom");
		RoomDto room = roomService.selectOneRoom(rNum);
		System.out.println(room.toString());
		model.addAttribute("room", room);
		return "updateRoom";
	}
	
	@PostMapping("/updateRoom")
	public String updateRoom(RoomDto room) {
		System.out.println(":::updateRoom");
		System.out.println(room.toString());
		int result = roomService.updateRoom(room);
		if (result == 1) {
			System.out.println("updateRoom 성공");
			return "redirect:/room/selectAllRoom";
		} else {
			System.out.println("updateRoom 실패");
			return "redirect:/room/updateRoom";
		}
	}
	
	@RequestMapping("/deleteRoom")
	public String deleteUser(Model model, @RequestParam("rNum") int rNum) {
		System.out.println(":::deleteRoom");
		int result = roomService.deleteRoom(rNum);
		if (result == 1) {
			System.out.println("deleteRoom 성공");
			model.addAttribute("result", "삭제 성공");
			return "redirect:/room/selectAllRoom";
		} else {
			System.out.println("deleteRoom 실패");
			model.addAttribute("result", "삭제 실패 : 고객센터에 문의해주세요");
			return "redirect:/room/selectAllRoom";
		}
	}
}
