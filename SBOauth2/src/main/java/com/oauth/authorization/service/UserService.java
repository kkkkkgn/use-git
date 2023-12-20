package com.oauth.authorization.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.oauth.authorization.entity.User;
import com.oauth.authorization.repository.UserRepository;


//** USER SERVICE 클래스 (DAO의 역할) - 조민희 **
@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	/* DB에 회원을 추가 */
	public void addUser(User user) {
		
		userRepository.save(user);
		
	}
	
}
