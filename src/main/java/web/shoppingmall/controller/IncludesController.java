package web.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping({"/includes/Sample"})
	public void addressTest() {
		
	}
	@GetMapping("/includes/jusoPopup")
	public void getJuso() {
	}
	@PostMapping({"/includes/jusoPopup"})
	public void addressTestPost() {
		System.out.println("post juso");
	}
	
	@GetMapping("/accessDenied")
	public void accessDenied(Authentication auth) {
		System.out.println("access denied : " + auth);
	}
}
