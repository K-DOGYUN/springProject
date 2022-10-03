package web.shoppingmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.shoppingmall.domain.AddressDTO;
import web.shoppingmall.mapper.AddressMapper;

@Service
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressMapper mapper;

	@Override
	public void AddrRegistration(AddressDTO addressDTO) {
		mapper.AddrRegistration(addressDTO);
	}

	@Override
	public AddressDTO addrInfromation(String addrNo) {
		return mapper.addrInformation(addrNo);
	}

	@Override
	public void addrDelete(String addrNo) {
		mapper.addrDelete(addrNo);		
	}
}
