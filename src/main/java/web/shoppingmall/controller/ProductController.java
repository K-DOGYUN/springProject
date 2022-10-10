package web.shoppingmall.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import web.shoppingmall.domain.ImageDTO;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.service.ImageService;
import web.shoppingmall.service.IncludesService;
import web.shoppingmall.service.MemberService;
import web.shoppingmall.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	private IncludesService iService;
	@Autowired
	private ProductService pService;
	@Autowired
	private MemberService mService;
	
	@PreAuthorize("hasAnyRole('ROLE_SELLER')")
	@GetMapping("/register")
	public void productReg(Model model) {
		model.addAttribute("category", iService.getCategory());
	}
	
	@PostMapping("/register")
	public void productRegister(ProductVO productVO) {
		pService.productReg(productVO);
	}

	@GetMapping("/information")
	public void productDisplay(String productNo, Model model) {
		ProductVO productVO = pService.productInform(productNo);
		model.addAttribute("product", productVO);
		model.addAttribute("seller", mService.memberInform(productVO.getSellerNo()));
	}
}
