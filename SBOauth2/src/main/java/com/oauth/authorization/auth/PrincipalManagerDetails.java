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
//import com.example.triptable.entity.ManagerRole;
//import com.example.triptable.entity.User;
//
//import lombok.Data;
//
//@Data
//public class PrincipalManagerDetails implements UserDetails {
//
//	
//	private Manager manager;
//	
//	//  관리자 일반 로그인 관련 생성자
//	public PrincipalManagerDetails(Manager manager) {
//		this.manager = manager;
//	}
//	
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
//		collect.add(new GrantedAuthority() {
//			
//			@Override
//			public String getAuthority() {
//				System.out.println(manager.getManagerRole());
//				ManagerRole managerRole = new ManagerRole();
//				managerRole = manager.getManagerRole();
//				
//				return managerRole.getRole_name();
//			}
//		});
//		return collect;
//	}
//		
//	// 관리자 일반 로그인 관련 메소드	
//	@Override
//	public String getPassword() {
//		return manager.getPassword();
//	}
//
//	@Override
//	public String getUsername() {
//		// TODO Auto-generated method stub
//		return manager.getMail();
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	
//
//}
