package com.oauth.authorization.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oauth.authorization.entity.Manager;
import com.oauth.authorization.repository.ManagerRepository;

@Service
public class Managerservice {

    @Autowired
    private ManagerRepository managerRepository;
    
	/* DB에 회원을 추가 */
	public void addUser(Manager manager) {
		
		managerRepository.save(manager);
	}
   
	
}
