package web.shoppingmall.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUser implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberPw;
	private String auth;
	private String memberName;
	private boolean memberState;
	
	public CustomUser(MemberVO vo) {
		this.memberId = vo.getMemberId();
		System.out.println(memberId);
		this.memberPw = vo.getMemberPw();
		System.out.println(memberPw);
		this.auth = vo.getAuth();
		System.out.println(auth);
		this.memberName = vo.getMemberName();
		System.out.println(memberName);
		this.memberState = (vo.getMemberState() != 0);
		System.out.println(memberState);
		System.out.println(vo.getMemberState());
	}
	
	public String getCustomerName() {
		return memberName;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(auth));
		return authority;
	}

	@Override
	public String getPassword() {
		return memberPw;
	}

	@Override
	public String getUsername() {
		return memberId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return memberState;
	}

}
