package com.exam.text.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.exam.text.mapper.UserByUsernameExtractor;
import com.exam.text.mapper.UserExtractor;
import com.exam.text.model.User;



@Repository
@Service
public class UserService {

	private static final String SQL_FIND_ALL_USERS = """
			SELECT users.username, users.password, users.enabled, authorities.authority
			FROM users
			LEFT JOIN authorities ON users.username = authorities.username ;
			""";
	
	private static final String SQL_FIND_USER_BY_USERNAME = """
			SELECT users.username, users.password, users.enabled, authorities.authority
			FROM users
			LEFT JOIN authorities ON users.username = authorities.username
			WHERE users.username = ?;
			""";
	
	@Autowired
	private final JdbcClient jdbcClient;
	
	public UserService(JdbcClient jdbcClient) {
		this.jdbcClient = jdbcClient;
	}
	
	@PreAuthorize("hasRole('USER')")
	public String getText() {
		return "User : ";
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	public List<User> getAllUser() {
		return jdbcClient.sql(SQL_FIND_ALL_USERS)
				.query(new UserExtractor());
	}
	
	/* *
	 * SecurityContextHolder = 현재 실행중인 스레드의 보안 컨텍스트를 제공 
	 * getAuthentication() = 현재 사용자의 인증 객체를 가져온다 
	 * Authentication = 인터페이스를 구현한 클래스의 인스턴스 
	 * getName() = 현재 사용자의 이름 가져오기 보통 사죵자의 식별자 또는 아이디 
	 * */
	
	
	@PreAuthorize("hasRole('USER')")
	public User findByUsername() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		return jdbcClient.sql(SQL_FIND_USER_BY_USERNAME)
				.param(username)
				.query(new UserByUsernameExtractor());
	}
	
}







