package web.shoppingmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import web.shoppingmall.domain.MemberVO;
import web.shoppingmall.mapper.MemberMapper;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void customerRegister(MemberVO customerVO) {
		mapper.memberReg(customerVO);
	}

	@Override
	public MemberVO customerInformation(String customerId) {
		return mapper.customerInformation(customerId);
	}

	@Override
	public void customerCorrection(MemberVO customerVO) {
		mapper.customerCorrection(customerVO);
	}

	@Override
	public void customerDelete(String customerId) {
		mapper.customerDelete(customerId);		
	}

}
