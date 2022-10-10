package web.shoppingmall.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("Login Success");
		List<String> role = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(a -> role.add(a.toString()));
		
		
		if(role.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		if(role.contains("ROLE_SELLER")) {
			response.sendRedirect("/sample/seller");
			return;
		}
		if(role.contains("ROLE_CUSTOMER")) {
			response.sendRedirect("/main");
			return;
		}
		response.sendRedirect("/");
	}

}
