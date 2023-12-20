package com.exam.text.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.exam.text.model.User;

@Repository
public class UserExtractor implements ResultSetExtractor<List<User>> {

	
	@Override
	public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException {
		// TODO Auto-generated method stub
		Map<String, User> users = new LinkedHashMap<>();
		while (rs.next()) {
			String username = rs.getString("username");
			User user = users.get(username);
			// 사용자가 맵에 없으면 새로운 User 객체를 생성하고 맵에 추가
			if (user == null) {
				user = new User(username,
						rs.getString("password"),
						rs.getBoolean("enabled"),
						new ArrayList<>());
				users.put(username, user);
			}
			// 사용자의 권한(authority)을 추가
			user.authority().add(rs.getString("authority"));
		}	
		return new ArrayList<>(users.values());
	}
}
