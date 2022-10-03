package web.shoppingmall.mapper;

import web.shoppingmall.domain.CustomerVO;

public interface CustomerMapper {
	public void customerRegister(CustomerVO customerVO);
	public CustomerVO customerInformation(String customerId);
	public void customerCorrection(CustomerVO customerVO);
}
