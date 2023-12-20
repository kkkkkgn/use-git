package com.oauth.authorization.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oauth.authorization.entity.User;

import java.util.Optional;



//** USER REPOSITORY : SERVICE에서 사용할 메서드 정의 - 조민희 **//
public interface UserRepository extends JpaRepository<User, Integer> {
	
	/* DB에 회원의 메일과 일치하는 회원 메일이 있는지 확인 / existsBy뒤에는 entity에서 정의한 컬럼명과 같아야 함 (ex.existsByEmail 안됨) */
	//User existsByMail(String mail);
	
	public User findByMail(String mail);
	
	Optional<User> findById(String loginId);

}
