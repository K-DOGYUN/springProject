package web.shoppingmall.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import web.shoppingmall.domain.CustomUser;
import web.shoppingmall.mapper.MemberMapper;

public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername : " + username);
		CustomUser user = new CustomUser(mapper.customerInformation(username));
		System.out.println(user);
		return user;
	}

}
