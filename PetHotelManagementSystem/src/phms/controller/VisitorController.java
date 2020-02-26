package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import phms.dto.VisitorDto;
import phms.service.VisitorService;

@Controller
@RequestMapping("/visitor")
public class VisitorController {

	@Autowired
	VisitorService visitorService;

	@RequestMapping("/loginNaverCallback")
	public String loginNaverCallback() {
		System.out.println(":::loginNaverCallback");
		return "loginNaverCallback";
	}
	
	@RequestMapping("/selectOneVisitor")
	public String selectOneVisitor(Model model, @RequestParam("vId") String vId) {
		System.out.println(":::selectOneVisitor");
		VisitorDto visitor = visitorService.selectOneVisitor(vId);
		model.addAttribute("visitor", visitor);
		return "selectOneVisitor";
	}

	@RequestMapping("/selectAllVisitor")
	public @ResponseBody List<VisitorDto> selectAllVisitor() {
		System.out.println(":::selectAllVisitor");
		List<VisitorDto> listVisitor = visitorService.selectAllVisitor();
		return listVisitor;
	}

	@RequestMapping("/insertVisitor")
	public String insertVisitor(Model model, @RequestParam("vId") String vId, @RequestParam("vName") String vName,
			@RequestParam("vEmail") String vEmail, @RequestParam("vFrom") String vFrom) {
		System.out.println(":::insertVisitor");
		if (visitorService.selectOneVisitor(vId) != null) {
			System.out.println("로그인을 환영합니다");
			model.addAttribute("id", vId);
			model.addAttribute("from", vFrom);
			return "sessionLogin";
		} else {
			VisitorDto visitor = new VisitorDto();
			visitor.setvId(vId);
			visitor.setvName(vName);
			visitor.setvEmail(vEmail);
			visitor.setvFrom(vFrom);
			visitorService.insertVisitor(visitor);
			model.addAttribute("id", vId);
			model.addAttribute("from", vFrom);
			System.out.println("회원가입을 환영합니다");
		}
		return "sessionLogin";
	}
}
