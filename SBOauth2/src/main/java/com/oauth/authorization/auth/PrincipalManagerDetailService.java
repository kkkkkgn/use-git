//package com.oauth.authorization.auth;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.example.triptable.entity.Manager;
//import com.example.triptable.repository.ManagerRepository;
//
//public class PrincipalManagerDetailService implements UserDetailsService{
//
//	@Autowired
//	private ManagerRepository managerRepository;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		Manager managerEntity = managerRepository.findByMail(username); 
//		if(managerEntity != null) {
//			System.out.println("여긴 실행됨");
//			return new PrincipalManagerDetails(managerEntity);
//		}
//		return null;
//	}
//
//}
