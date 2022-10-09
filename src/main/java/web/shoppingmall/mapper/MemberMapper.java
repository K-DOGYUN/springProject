package web.shoppingmall.mapper;

import web.shoppingmall.domain.MemberVO;

public interface MemberMapper {
	public void memberReg(MemberVO memberVO);
	public MemberVO customerInformation(String customerId);
	public void customerCorrection(MemberVO customerVO);
	public void customerDelete(String customerId);
}
