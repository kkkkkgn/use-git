package com.exam.text.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

	public SecurityConfig() {
		// TODO Auto-generated constructor stub
		System.out.println("SecurityConfig() 호출 성공");
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
	 * 작성자 : 구동현 
	 * 기술 : Spring Security 를 사용한 user, admin 구분.
	 * 최초 작성일 : 23.12.20 
	 * 변경일 : 
	 * 
	 * authorizeHttpRequests = HttpSecurity 를 통해 http 요청에 대한 보안 구성 정의 
	 * requestMatchers = 특정 패턴의 요청에 대한 권한 설정 
	 * 	-> "/css/**", "/favicon.ico", "/", "/index" 경로는 모든 사용자에게 허용
	 *  -> "/user" 경로는 "USER" 역할을 가진 사용자만 
	 *  -> "/admin" 경로는 "ADMIN" 역할을 가진 사용자만
	 * permitAll() = 요청에 대한 모든 사용자에 대한 접근 권한 부여 
	 * formLogin = 폼 기반 로그인 설정 
	 * defaultSuccessUrl("/") = 로그인 성공시 이동할 페이지 설정
	 * logout = 로그아웃 설정 
	 * logoutSuccessUrl("/") = 로그아웃 성공시 이동할 페이지 설정
	 * httpSecurity.build() = 통해 위에서 정의한 보안 구성을 적용 하여 "SecurityFilterChain" 를 반환하기
	 * 
	 * PasswordEncoder = 암호를 안전하게 저장하고 인증에 사용하기 위해 
	 * createDelegatingPasswordEncoder() = 비밀번호를 암호화하고 인증
	 * 
	 * UserDetailsManager = 데이터베이스에 저장된 사용자 정보를 활용 하기 위해
	 * 
	 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity
		.authorizeHttpRequests((authorize) -> authorize 
				.requestMatchers("/css/**", "/favicon.ico", "/", "/index").permitAll()
				.requestMatchers("/user").hasAnyRole("USER")
				.requestMatchers("/admin").hasAnyRole("ADMIN")
				.anyRequest().authenticated()
				)
				.formLogin(login -> login
						.defaultSuccessUrl("/")
						.permitAll()
						)
				.logout(logout -> logout
						.logoutSuccessUrl("/")
						);
		return httpSecurity.build();
	}
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
	@Bean
	UserDetailsManager jdbcUserDetailsManager(DataSource dataSource) {
		return new JdbcUserDetailsManager(dataSource);
	}
	
	
}






