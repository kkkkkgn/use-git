package com.exam.text.model;

import java.util.List;

public record User (
		String username,
		String password,
		Boolean enabeled,
		List<String> authority
		) {
	
}
