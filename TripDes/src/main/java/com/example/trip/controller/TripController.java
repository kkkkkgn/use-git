package com.example.trip.controller;

import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Component
@Controller
public class TripController {

	public TripController() {
		// TODO Auto-generated constructor stub
		System.out.println("TripController() 호출");
	}
	
	@GetMapping("/index.do")
	public ModelAndView index(HttpServletRequest request) {
		System.out.println("index.do 호출 성공");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;	
	}
	
	@GetMapping("/login.do")
	public ModelAndView login(HttpServletRequest request) {
		System.out.println("login.do 호출 성공");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;	
	}
	
	@GetMapping("/course.do")
	public ModelAndView course(HttpServletRequest request) {
		System.out.println("course.do 호출 성공");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("course");
		return modelAndView;	
	}
	
	@GetMapping("/tripplan.do")
	public ModelAndView tripplan(HttpServletRequest request) {
		System.out.println("tripplan.do 호출 성공");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("trip-plan");
		return modelAndView;	
	}
	
    @GetMapping("/calendar.do")
    public ModelAndView showCalendar(HttpServletRequest request) {
    	System.out.println("showCalendar() 호출성공");
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.addObject("selectedDate", new Date());
        modelAndView.setViewName("calendar");
        return modelAndView;
    }
    
    @GetMapping("/calendar02.do")
    public ModelAndView showCalendar02(HttpServletRequest request) {
    	System.out.println("showCalendar02() 호출성공");
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.addObject("selectedDate", new Date());
        modelAndView.setViewName("calendar02");
        return modelAndView;
    }
	
}
