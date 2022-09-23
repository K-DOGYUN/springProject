package web.shoppingmall.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.service.IncludesService;
import web.shoppingmall.service.ProductService;

@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	@Autowired
	private ProductService service;

	@PostMapping("/register")
	public void productRegister(ProductVO productVO) {
		System.out.println("productregister/controller");
		productVO.setS_num("권도균");
		productVO.setUp_date(LocalDateTime.now());
		productVO.setReg_date(LocalDateTime.now());
		service.pRegister(productVO);
		System.out.println(productVO);
		productVO.getImgList().forEach(i -> System.out.println(i));
	}
}
