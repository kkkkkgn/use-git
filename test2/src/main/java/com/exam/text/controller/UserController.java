package com.exam.text.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.exam.text.model.User;
import com.exam.text.service.UserService;



@Controller
public class UserController {

	@Autowired
	private final UserService userService;
	
	public UserController(UserService userService) {
		// TODO Auto-generated constructor stub
		this.userService = userService;
	}
	
	@GetMapping("/user")
	public ModelAndView findByUserName() {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findByUsername();
		modelAndView.addObject("text", userService.getText());
		modelAndView.addObject("user", user);
		modelAndView.setViewName("user");
		return modelAndView;
	}
	
}
