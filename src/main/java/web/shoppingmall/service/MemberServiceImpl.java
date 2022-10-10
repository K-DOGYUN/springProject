package web.shoppingmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import web.shoppingmall.domain.MemberVO;
import web.shoppingmall.mapper.AddressMapper;
import web.shoppingmall.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mMapper;
	@Autowired
	private AddressMapper aMapper;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	@Override
	public void memberReg(MemberVO memberVO) {
		memberVO.setMemberPw(pwEncoder.encode(memberVO.getMemberPw()));
		System.out.println("memberReg : " + memberVO);
		mMapper.memberReg(memberVO);

		if (memberVO.getAddrList() != null) {
			memberVO.getAddrList().forEach(addr -> {
				if(addr.getMainAddr() != null) {					
					addr.setMemberId(memberVO.getMemberId());
					aMapper.AddrRegistration(addr);
				}
			});
		}
	}

	@Override
	public MemberVO memberInform(String memberId) {
		System.out.println("memberInform : " + memberId);
		
		MemberVO vo = mMapper.memberInform(memberId);
		vo.setAuth(vo.getAuth().replace("ROLE_", ""));
		return vo;
	}

	@Override
	public void memberModify(MemberVO memberVO) {
		memberVO.setMemberPw(pwEncoder.encode(memberVO.getMemberPw()));
		System.out.println("memberModify" + memberVO);
		mMapper.memberModify(memberVO);
	}

	@Override
	public void memberDelete(String memberId) {
		mMapper.memberInform(memberId).getAddrList().forEach(addr -> {
			System.out.println("delete addr : " + addr.getAddrNo());
			if(addr.getAddrNo() != null)
				aMapper.addrDelete(addr.getAddrNo());
		});
		System.out.println("delete member : " + memberId);
		mMapper.memberDelete(memberId);
		SecurityContextHolder.clearContext();
	}

	@Override
	public String pwConfirm(MemberVO memberVO) {
		System.out.println("pwConfirm : " + memberVO);
		boolean ans = pwEncoder.matches(memberVO.getMemberPw(), mMapper.memberInform(memberVO.getMemberId()).getMemberPw());
		System.out.println(ans);
		if(ans) {
			return "same";
		} else {
			return "different";
		}
	}

}
