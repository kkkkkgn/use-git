//package com.oauth.authorization.auth;
//
//import java.security.Principal;
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Map;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//
//import com.example.triptable.entity.Manager;
//import com.example.triptable.entity.User;
//
//import lombok.Data;
//
//@Data
//public class PrincipalUserDetails implements OAuth2User {
//
//	private User user;
//	
//	private Map<String, Object> attributes;
//	
//	// 회원 소셜 로그인 관련 생성자
//	public PrincipalUserDetails(User user, Map<String, Object> attributes) {
//		this.user = user;
//		this.attributes = attributes;
//	}
//	
//	// 회원 소셜 로그인 관련 메소드
//	@Override
//	public Map<String, Object> getAttributes() {
//		
//		return attributes;
//	}
//
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
//		collect.add(new GrantedAuthority() {
//			
//			@Override
//			public String getAuthority() {
//				// TODO Auto-generated method stub
//				return user.getRole();
//			}
//		});
//		return collect;
//	}
//
//	@Override
//	public String getName() {
//		// TODO Auto-generated method stub
//		return user.getName();
//	}
//	
//	public User getUser() {
//		return user;
//	}	
//
//}
