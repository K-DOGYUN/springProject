package web.shoppingmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.shoppingmall.domain.AddressDTO;
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
	private AddressMapper addrMapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	public void test() {
		CustomerVO customerVO = new CustomerVO();
		AddressDTO addressDTO1 = new AddressDTO();
		AddressDTO addressDTO2 = new AddressDTO();
		List<AddressDTO> addrList = new ArrayList<AddressDTO>();
		
		customerVO.setCustomerId("aefdaf002@naver.com");
		customerVO.setCustomerPw(encoder.encode("1234"));
		customerVO.setCustomerName("customerName");
		customerVO.setCustomerPhone("111-1111-1111");
		
		addressDTO1.setMainAddr("Main Address");
		addressDTO1.setDetailAddr("Detail Address");
		addressDTO1.setZipNo(12345);
		addressDTO1.setCustomerId(customerVO.getCustomerId());
		
		addressDTO2.setMainAddr("Main Address2");
		addressDTO2.setDetailAddr("Detail Address2");
		addressDTO2.setZipNo(56789);
		addressDTO2.setCustomerId(customerVO.getCustomerId());
		
		addrList.add(addressDTO1);
		addrList.add(addressDTO2);
		
		System.out.println(addrList);
		
		System.out.println(customerVO.getCustomerId());
		customerVO.setAddrList(addrList);
		
//		mapper.customerRegister(customerVO);
//		customerVO.getAddrList().forEach(addr -> System.out.println(addr));
//		customerVO.getAddrList().forEach(addr -> addrMapper.AddrRegistration(addr));
//		System.out.println(mapper.customerInformation("aefdaf002@naver.com"));
//		mapper.customerCorrection(customerVO);
		mapper.customerDelete("20221003002@naver.com");
	}
}
