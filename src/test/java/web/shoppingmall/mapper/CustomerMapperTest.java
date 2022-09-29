package web.shoppingmall.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.shoppingmall.domain.CustomerVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class CustomerMapperTest {
	@Autowired
	private CustomerMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	public void test() {
		CustomerVO customerVO = new CustomerVO();
		
		customerVO.setCustomerId("customer@naver.com");
		customerVO.setCustomerPw(encoder.encode("1234"));
		customerVO.setCustomerName("customerName");
		customerVO.setCustomerPhone("111-1111-1111");
		
		mapper.customerRegister(customerVO);
	}
}
