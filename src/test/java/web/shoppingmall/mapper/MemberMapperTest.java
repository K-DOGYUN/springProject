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
import web.shoppingmall.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class MemberMapperTest {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private AddressMapper addrMapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	public void test() {
		MemberVO memberVO = new MemberVO();
		AddressDTO addressDTO1 = new AddressDTO();
		AddressDTO addressDTO2 = new AddressDTO();
		List<AddressDTO> addrList = new ArrayList<AddressDTO>();
		
		memberVO.setMemberId("aefdaf002@naver.com");
		memberVO.setMemberPw(encoder.encode("1234"));
		memberVO.setMemberName("memberName");
		memberVO.setMemberPhone("111-1111-1111");
		memberVO.setAuth("customer");
		
//		addressDTO1.setMainAddr("Main Address");
//		addressDTO1.setDetailAddr("Detail Address");
//		addressDTO1.setZipNo(12345);
//		addressDTO1.setMemberId(memberVO.getMemberId());
//		
//		addressDTO2.setMainAddr("Main Address2");
//		addressDTO2.setDetailAddr("Detail Address2");
//		addressDTO2.setZipNo(56789);
//		addressDTO2.setMemberId(memberVO.getMemberId());
//		
//		addrList.add(addressDTO1);
//		addrList.add(addressDTO2);
//		
//		System.out.println(addrList);
//		
//		System.out.println(memberVO.getMemberId());
//		memberVO.setAddrList(addrList);
		
		mapper.memberReg(memberVO);
//		memberVO.getAddrList().forEach(addr -> System.out.println(addr));
//		memberVO.getAddrList().forEach(addr -> addrMapper.AddrRegistration(addr));
//		System.out.println(mapper.customerInformation("customer002@naver.com"));
//		mapper.customerCorrection(memberVO);
//		mapper.customerDelete("20221003002@naver.com");
	}
}
