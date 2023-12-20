package com.exam.text.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.exam.text.service.HomeService;



@Controller
public class HomeController {

	@Autowired
	private final HomeService homeService;
	
	public HomeController(HomeService homeService) {
		// TODO Auto-generated constructor stub
		this.homeService = homeService;
	}
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("text", homeService.getText());
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/");
		return modelAndView;
	}
	
}
