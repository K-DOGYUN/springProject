package web.shoppingmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.shoppingmall.domain.AddressDTO;
import web.shoppingmall.service.AddressService;

@Controller
@RequestMapping("/address/*")
public class AddressController {
	@Autowired
	AddressService addrService;
	
	@GetMapping({"/registration", "/delete"})
	public void blackGetMap(AddressDTO addressDTO) {
	}
	
	@PostMapping({"/registration"})
	@ResponseBody
	public AddressDTO AddrRegistration(AddressDTO addressDTO) {
		System.out.println("AddrRegistration : " + addressDTO);
		addrService.AddrRegistration(addressDTO);
		System.out.println(addressDTO);		
		return addressDTO;
	}

	@PostMapping({"/delete"})
	@ResponseBody
	public String addrDelete(String addrNo) {
		System.out.println("addrDelete : " + addrNo);
		addrService.addrDelete(addrNo);
		return "success";
	}
}
