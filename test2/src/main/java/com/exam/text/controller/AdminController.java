package com.exam.text.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.exam.text.model.User;
import com.exam.text.service.AdminService;
import com.exam.text.service.UserService;


@Controller
public class AdminController {

	@Autowired
	private final UserService userService;
	
	@Autowired
	private final AdminService adminService;
	
	public AdminController(UserService userService, AdminService adminService) {
		// TODO Auto-generated constructor stub
		this.userService = userService;
		this.adminService = adminService;
	}
	
	@GetMapping("/admin")
	public ModelAndView getAllUsers() {
		ModelAndView modelAndView = new ModelAndView();
		List<User> users = userService.getAllUser();
		modelAndView.addObject("text", adminService.getText());
		modelAndView.addObject("users", users);
		modelAndView.setViewName("admin");
		return modelAndView;
	}
	
}
