package web.shoppingmall.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.shoppingmall.domain.MemberVO;
import web.shoppingmall.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService mService;

	@GetMapping({"/register"})
	public void voidGetMap() {
	}
	
	@PostMapping("/register")
	public String memberReg(MemberVO vo, RedirectAttributes rttr) {
		System.out.println("memberReg");
		mService.memberReg(vo);
		
		rttr.addFlashAttribute("Message", "Register Success");
		return "redirect:/memberLogin";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_CUSTOMER', 'ROLE_SELLER', 'ROLE_ADMIN')")
	@GetMapping({"/information", "/modify"})
	public void memberInformation(String memberId, Model model) {
		System.out.println("information : "+memberId);
		model.addAttribute("information",mService.memberInform(memberId));
	}
	
	@PreAuthorize("hasAnyRole('ROLE_CUSTOMER', 'ROLE_SELLER', 'ROLE_ADMIN')")
	@PostMapping({ "/modify" })
	public String memberCorrection(MemberVO memberVO, RedirectAttributes rttr) {
		mService.memberModify(memberVO);
		
		rttr.addAttribute("memberId",memberVO.getMemberId());
		return "redirect:/member/information";
	}
	
	@PostMapping({"/delete"})
	@ResponseBody
	public String memberDelete(String memberId, HttpServletRequest request, HttpServletResponse response) {
		mService.memberDelete(memberId);
		Cookie[] cookies = request.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
		if(cookies != null){ // 쿠키가 한개라도 있으면 실행
			for(int i=0; i< cookies.length; i++){
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
				response.addCookie(cookies[i]); // 응답 헤더에 추가
			}
		}
		return "deleted";
	}
	
	@PostMapping({"/confirm"})
	@ResponseBody
	public String pwConfirm(MemberVO memberVO) {
		return mService.pwConfirm(memberVO);
	}
}
