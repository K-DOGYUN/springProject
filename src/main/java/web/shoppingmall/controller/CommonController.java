package web.shoppingmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	@GetMapping("/memberLogin")
	public void login(String error, String logout, Model model) {
		System.out.println("error : " + error);
		System.out.println("logout : " + logout);
		if(error != null) {
			model.addAttribute("error", "Login Error occured");
		}
		if(logout != null) {
			model.addAttribute("logout", "LogOut!!");
		}
	}
	
	@GetMapping("/memberLogout")
	public void voidGetMap() {
		System.out.println("logOut");
	}
}
