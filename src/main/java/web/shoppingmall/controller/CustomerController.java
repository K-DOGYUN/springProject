package web.shoppingmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.shoppingmall.domain.CustomerVO;
import web.shoppingmall.service.AddressService;
import web.shoppingmall.service.CustomerService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	@Autowired
	private CustomerService cService;
	@Autowired
	private AddressService addrService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@GetMapping({ "/register", "/delete", "/confirm" })
	public void voidGetMap() {
	}

	@PostMapping({ "/register" })
	public String customerRegister(CustomerVO customerVO, RedirectAttributes rttr) {
		String encodedPw = pwEncoder.encode(customerVO.getCustomerPw());
		customerVO.setCustomerPw(encodedPw);
		if (customerVO.getBusinessNo() > 999999999) {
			customerVO.setAuth("ROLE_SELLER");			
		}
		System.out.println("Customer registration(customerVO) : " + customerVO);
		cService.customerRegister(customerVO);
		
		if(customerVO.getAddrList() != null) {			
			customerVO.getAddrList().forEach(addr -> {
				System.out.println("Addr Registration : " + addr);
				if(addr.getMainAddr() != null) {
					addr.setCustomerId(customerVO.getCustomerId());
					addrService.AddrRegistration(addr);
				}
			});
		}
		
		rttr.addAttribute("customerId",customerVO.getCustomerId());
		return "redirect:/customer/information";
	}
	
	@PostMapping({ "/correction" })
	public String customerCorrection(CustomerVO customerVO, RedirectAttributes rttr) {
		String encodedPw = pwEncoder.encode(customerVO.getCustomerPw());
		customerVO.setCustomerPw(encodedPw);
		if (customerVO.getBusinessNo() > 999999999) {
			customerVO.setAuth("ROLE_SELLER");			
		} else {
			customerVO.setAuth("ROLE_CUSTOMER");						
		}
		System.out.println("Customer Correction(customerVO) : " + customerVO);
		
		cService.customerCorrection(customerVO);
		
		rttr.addAttribute("customerId",customerVO.getCustomerId());
		return "redirect:/customer/information";
	}
	
	@GetMapping({"/information", "/correction"})
	public void customerInformation(String customerId, Model model) {
		System.out.println("information : "+customerId);
		model.addAttribute("customerId", customerId);
		model.addAttribute("information",cService.customerInformation(customerId));
	}
	
	@PostMapping({"/delete"})
	@ResponseBody
	public String customerDelete(String customerId) {
		System.out.println("customerDelete : " + customerId);
		cService.customerDelete(customerId);
		return "deleted";
	}
	
	@PostMapping({"/confirm"})
	@ResponseBody
	public String customerConfirm(CustomerVO customerVO) {
		System.out.println("confirm : " + customerVO);
		CustomerVO originCustomer = cService.customerInformation(customerVO.getCustomerId());
		System.out.println("confirm : " + originCustomer);
		
		if(pwEncoder.matches(customerVO.getCustomerPw(), originCustomer.getCustomerPw()))
			return "correct";
		else
			return "different";
	}
}
