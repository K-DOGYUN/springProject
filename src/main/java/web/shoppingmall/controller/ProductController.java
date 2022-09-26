package web.shoppingmall.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import web.shoppingmall.domain.ImageDTO;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.service.ImageService;
import web.shoppingmall.service.IncludesService;
import web.shoppingmall.service.ProductService;

@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	@Autowired
	private IncludesService service;
	private ProductService pService;
	private ImageService iService;

	@PostMapping("/register")
	public void productRegister(ProductVO productVO) {
		System.out.println("productregister/controller");
		productVO.setS_num("권도균");
		productVO.setUp_date(LocalDateTime.now());
		productVO.setReg_date(LocalDateTime.now());
		pService.pRegister(productVO);
		System.out.println(productVO);
		productVO.getImgList().forEach(i -> i.setParent_type("p"));
		productVO.getImgList().forEach(i -> i.setParent_num(productVO.getP_num()));
		productVO.getImgList().forEach(i -> System.out.println(i));
		productVO.getImgList().forEach(i -> iService.imageRegister(i));
	}

	@GetMapping("/display")
	public void productDisplay(@RequestParam("p_num") String p_num, Model model) {
		System.out.println("Display product number : " + p_num);
		model.addAttribute("category", service.getCategory());
		model.addAttribute(pService.pDisplay(p_num));
		List<ImageDTO> imgList = iService.imageDisplay(p_num);
		for(ImageDTO i : imgList) {
			String newPath = i.getImg_path().replace("\\", "/");
			i.setImg_path(newPath);
		}
		model.addAttribute("imgList", imgList);
	}
}
