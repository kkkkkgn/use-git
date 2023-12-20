package com.oauth.authorization.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oauth.authorization.config.UserClient;
import com.oauth.authorization.repository.ManagerRepository;
import com.oauth.authorization.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@Controller
public class IndexController {

	@Autowired
	BCryptPasswordEncoder bcripBCryptPasswordEncoder;

	@SuppressWarnings("unused")
	@Autowired
	private UserRepository userRepository;
	
	@SuppressWarnings("unused")
	@Autowired
	private ManagerRepository managerRepository;

	private UserClient userClient;
	
	@GetMapping("/")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		String welcome = userClient.getWelcome();	
		
		modelAndView.setViewName("user/main");
		return modelAndView;
	}
	
//	@GetMapping("/index.do")
//	public ModelAndView index(HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//
//		Authentication authentication = principalOauth2UserService.getCurrentUserInfo();
//		if (authentication == null || authentication.getPrincipal().equals("anonymousUser")) {
//			modelAndView.setViewName("index");
//		} else {
//
//			PrincipalUserDetails principalDetails = (PrincipalUserDetails) authentication.getPrincipal();
//			User user = principalDetails.getUser();
//			session.setAttribute("user", principalDetails.getUser());
//
//			if (user.getPassword().equals("기본비밀번호")) {
//				modelAndView.setViewName("user/agree");
//			} else {
//				modelAndView.setViewName("user/main");
//			}
//
//		}
//
//		return modelAndView;
//	}

	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	@GetMapping("/loginForm2.do")
	public String loginForm2() {
		return "loginForm2";
	}

	@GetMapping("/joinForm.do")
	public String joinForm() {
		return "user/joinForm";
	}

//	@PostMapping("/join.do")
//	public String join(HttpServletRequest request, HttpSession session) {
//		User user = (User) session.getAttribute("user");
//
//		String rawPassword = request.getParameter("password");
//		String encPassword = bcripBCryptPasswordEncoder.encode(rawPassword);
//
//		user.setPassword(encPassword);
//
//		userRepository.save(user);
//
//		session.setAttribute("user", user);
//
//		return "redirect:/index.do";
//	}

	// 추가 //
	@GetMapping("/mjoinForm.do")
	public String mjoinForm() {

		return "mjoinForm";
	}
	
//	@PostMapping("/mjoin.do")
//	public String mjoin(HttpServletRequest request) {
//		
//		String mgr_mail = request.getParameter("adminUsermail");
//		String mgr_rawPassword = request.getParameter("adminPassword");
//		String mgr_encPassword = bcripBCryptPasswordEncoder.encode(mgr_rawPassword);
//		String mgr_tel = request.getParameter("adminUsertel");
//		
//		Manager manager = new Manager();
//		manager.setMail(mgr_mail);
//		manager.setPassword(mgr_encPassword);
//		manager.setTel(mgr_tel);
//		
//		managerRepository.save(manager);
//		
//		return "redirect:/index.do";
//	}

}
