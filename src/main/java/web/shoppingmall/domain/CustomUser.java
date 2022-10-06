package web.shoppingmall.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUser implements UserDetails{
	
	private static final long serialVersionUID = 1L;
	private String customerId;
	private String customerPw;
	private String auth;
	private String customerName;
	private boolean customerState;
	
	public CustomUser(CustomerVO vo) {
		this.customerId = vo.getCustomerId();
		System.out.println(customerId);
		this.customerPw = vo.getCustomerPw();
		System.out.println(customerPw);
		this.auth = vo.getAuth();
		System.out.println(auth);
		this.customerName = vo.getCustomerName();
		System.out.println(customerName);
		this.customerState = (vo.getCustomerState() != 0);
		System.out.println(customerState);
		System.out.println(vo.getCustomerState());
	}
	
	public String getCustomerName() {
		return customerName;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(auth));
		return authority;
	}

	@Override
	public String getPassword() {
		return customerPw;
	}

	@Override
	public String getUsername() {
		return customerId;
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
		return customerState;
	}

}
