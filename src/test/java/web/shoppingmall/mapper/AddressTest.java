package web.shoppingmall.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.shoppingmall.domain.AddressDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class AddressTest {
	@Autowired
	private AddressMapper mapper;
	
	@Test
	public void addrRegistration() {
		AddressDTO dto = new AddressDTO();
		dto.setMainAddr("Main Address");
		dto.setDetailAddr("Detail Address");
		dto.setZipNo(12345);
		dto.setMemberId("aefdaf002@naver.com");
		
//		System.out.println(dto);
//		
		mapper.AddrRegistration(dto);
//		System.out.println(mapper.addrInformation(dto.getAddrNo()));
//		mapper.addrDelete("a202210030036");
	}
}
