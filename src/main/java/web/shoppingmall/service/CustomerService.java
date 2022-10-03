package web.shoppingmall.service;

import web.shoppingmall.domain.CustomerVO;

public interface CustomerService {
	public void customerRegister(CustomerVO customerVO);
	public CustomerVO customerInformation(String customerId);
	public void customerCorrection(CustomerVO customerVO);
}
