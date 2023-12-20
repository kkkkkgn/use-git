package com.oauth.authorization.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@NoArgsConstructor
public class Manager {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mgr_id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "role_code")
	private ManagerRole managerRole;
	
	@Column(name = "mgr_mail")
	private String mail;
	
	@Column(name = "mgr_password")
	private String password;
	
	@Column(name = "mgr_tel")
	private String tel;
	
	@Column(name = "mgr_last_login")
	private String last_login;
	
	@CreationTimestamp
	@Column(name = "mgr_join_date")
	private Timestamp join_date;

}
