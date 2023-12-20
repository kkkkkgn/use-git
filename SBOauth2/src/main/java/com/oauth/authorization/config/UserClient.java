package com.oauth.authorization.config;

import org.springframework.web.service.annotation.GetExchange;
import org.springframework.web.service.annotation.HttpExchange;


@HttpExchange("http://localhost:8090")
public interface UserClient {

	@GetExchange("/")
	String getWelcome();

}