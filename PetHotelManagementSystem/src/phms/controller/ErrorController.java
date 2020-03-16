package phms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {

	@RequestMapping("/errorPage")
	public String errorPage() {
		System.out.println(":::errorPage");
		return "errorPage";
	}
}
