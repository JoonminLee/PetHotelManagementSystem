package phms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import phms.dto.VisitorDto;
import phms.service.VisitorService;

@Controller
@RequestMapping("/visitor")
public class VisitorController {

	@Autowired
	VisitorService visitorService;

	@RequestMapping("/selectOneVisitor")
	public String selectOneVisitor(Model model, @RequestParam("vId") String vId) {
		System.out.println(":::selectOneVisitor");
		VisitorDto visitor = visitorService.selectOneVisitor(vId);
		model.addAttribute("visitor", visitor);
		return "selectOneVisitor";
	}

	@RequestMapping("/selectAllVisitor")
	public String selectAllVisitor(Model model) {
		System.out.println(":::selectAllVisitor");
		List<VisitorDto> listVisitor = visitorService.selectAllVisitor();
		model.addAttribute("listVisitor", listVisitor);
		return "selectAllVisitor";
	}

	@RequestMapping("/insertVisitor")
	public String insertVisitor(@RequestParam("vId") String vId, @RequestParam("vName") String vName,
			@RequestParam("vEmail") String vEmail) {
		System.out.println(":::insertVisitor");
		if (visitorService.selectOneVisitor(vId) != null) {
			return "redirect:/visitor/selectAllVisitor";
		} else {
			VisitorDto visitor = new VisitorDto();
			visitor.setvId(vId);
			visitor.setvName(vName);
			visitor.setvEmail(vEmail);
			visitorService.insertVisitor(visitor);
		}
		return "redirect:/visitor/selectAllVisitor";
	}
}
