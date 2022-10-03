package web.shoppingmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import web.shoppingmall.service.IncludesService;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class IncludesController {
	private IncludesService service;

	@GetMapping(value = {"includes/menu", "product/register"})
	public void getCategory(Model model) {
		System.out.println("getCategory/controller");
//		model.addAttribute("category", service.getCategory());
	}
	
	@GetMapping({"/includes/Sample","/includes/jusoPopup"})
	public void addressTest() {
		
	}
	
	@PostMapping({"/includes/jusoPopup"})
	public void addressTestPost() {
		
	}
}
