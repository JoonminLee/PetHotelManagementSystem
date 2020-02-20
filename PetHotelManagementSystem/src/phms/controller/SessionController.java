package phms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sess")
public class SessionController {

	@RequestMapping("/sessionLogout")
	public String sessionLogout() {
		System.out.println(":::sessionLogout");
		return "sessionLogout";
	}

}
