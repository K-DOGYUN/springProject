package web.shoppingmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.shoppingmall.domain.CustomerVO;
import web.shoppingmall.mapper.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerMapper mapper;
	
	@Override
	public void customerRegister(CustomerVO customerVO) {
		mapper.customerRegister(customerVO);
	}

}
