package com.oauth.authorization.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import jakarta.persistence.Column;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class ManagerRole {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int role_code;
	
	@Column
	private String role_name;
}
