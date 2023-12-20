package com.oauth.authorization.controller;

import java.time.LocalDateTime;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
	
	@GetMapping("/")
	public String home(Authentication authentication) {
		LocalDateTime time = LocalDateTime.now();
		return "Welcome Home! - " + time + " : " + authentication;
		
	}

}
