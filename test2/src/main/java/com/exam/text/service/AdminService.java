package com.exam.text.service;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
@Service
public class AdminService {
	
	/* *
	 * PreAuthorize = Spring Security에서 제공해주는 어노테이션 , 
	 * 메소드 호출 전 미리 권한을 확인하고자 할 때 사용
	 * */
	
	@PreAuthorize("hasRole('ADMIN')")
	public String getText() {
		// 이 메소드는 "ADMIN" 역할을 가진 사용자에게만 허용됩니다.
	    // 다른 사용자는 여기에 접근할 수 없습니다.
		return "Users list : ";
	}
}