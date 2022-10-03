package web.shoppingmall.mapper;

import web.shoppingmall.domain.AddressDTO;

public interface AddressMapper {
	public void AddrRegistration(AddressDTO addressDTO);
	public AddressDTO addrInformation(String addrNo);
	public void addrDelete(String addrNo);
}
