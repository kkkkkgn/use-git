package com.oauth.authorization.config;

import static org.springframework.security.config.Customizer.withDefaults;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.jwt.JwtDecoders;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	
	@Value("${spring.security.oauth2.resourceserver.jwt.issuer-uri}")
	String issuerUri;
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
		httpSecurity
			.authorizeHttpRequests(authorize -> authorize
					.anyRequest().authenticated())
			.oauth2Login(oauth2Login ->
				oauth2Login.loginPage("/oauth2/authorization/myoauth2"))
			.oauth2Client(withDefaults());
		return httpSecurity.build();
	}


	@Bean
	SecurityFilterChain securityFilterChainResuorce(HttpSecurity httpSecurity) throws Exception {
		return httpSecurity
				.authorizeHttpRequests(auth -> auth
						.anyRequest().authenticated())
				.oauth2ResourceServer(oauth2 -> oauth2
						.jwt(jwt -> jwt.decoder(JwtDecoders.fromIssuerLocation(issuerUri))))
				.build();
	}
	
}
