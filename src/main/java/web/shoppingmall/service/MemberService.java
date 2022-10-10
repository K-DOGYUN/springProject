package web.shoppingmall.service;

import web.shoppingmall.domain.MemberVO;

public interface MemberService {
	public void memberReg(MemberVO memberVO);
	public MemberVO memberInform(String memberId);
	public void memberModify(MemberVO memberVO);
	public void memberDelete(String memberId);
	public String pwConfirm(MemberVO memberVO);
}
