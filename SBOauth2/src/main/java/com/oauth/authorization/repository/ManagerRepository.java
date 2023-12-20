package com.oauth.authorization.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oauth.authorization.entity.Manager;


public interface ManagerRepository extends JpaRepository<Manager, Integer>{

	public Manager findByMail(String mail);
}
