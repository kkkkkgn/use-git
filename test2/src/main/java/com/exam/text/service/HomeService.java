package com.exam.text.service;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
@Service
public class HomeService {

	public String getText() {
		return "Home";
	}
}
