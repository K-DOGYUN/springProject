package web.shoppingmall.service;

import web.shoppingmall.domain.AddressDTO;

public interface AddressService {
	public void AddrRegistration(AddressDTO addressDTO);
	public AddressDTO addrInfromation(String addrNo);
	public void addrDelete(String addrNo);
}
