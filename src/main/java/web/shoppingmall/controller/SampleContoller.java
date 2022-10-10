package web.shoppingmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sample/*")
public class SampleContoller {
	@GetMapping({"/all", "/customer", "/seller", "/admin", "/post"})
	public void voidGetMap() {
		
	}
}
