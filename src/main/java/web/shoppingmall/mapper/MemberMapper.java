package web.shoppingmall.mapper;

import web.shoppingmall.domain.MemberVO;

public interface MemberMapper {
	public void memberReg(MemberVO memberVO);
	public MemberVO memberInform(String memberId);
	public void memberModify(MemberVO customerVO);
	public void memberDelete(String customerId);
}
