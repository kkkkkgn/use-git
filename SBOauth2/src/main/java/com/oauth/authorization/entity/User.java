package com.oauth.authorization.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//** USER 테이블 ENTITY - 조민희 **//

@Entity
@Data
@NoArgsConstructor
public class User {
	
	/* PK */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int id;
	
	@Column(name = "user_name")
	private String name;
	
	@Column(name = "user_mail")
	private String mail;
	
	@Column(name = "user_password")
	private String password;
	
	@Column(name = "user_nick")
	private String nickname;
	
	@Column(name = "user_tel")
	private String tel;
	
	@Column(name = "user_provide")
	private String provider;
	
	@Column(name = "user_role")
	private String role;
	
	@Column(columnDefinition = "JSON")
	private String groupdata;
	
	@CreationTimestamp
	@Column(name = "join_date")
	private Timestamp date;
	
	@Column(columnDefinition = "VARCHAR(255) DEFAULT 'icon01'", name = "user_icon")
	private String icon;
	
	@Builder
	public User(int id, String name, String mail, String password, String nickname, String provider, String role, Timestamp date) {
		this.id = id;
		this.name = name;
		this.mail = mail;
		this.password = password;
		this.nickname = nickname;
		this.provider = provider;
		this.role = role;
		this.date = date;
		
	}

	
}
