package com.travel.ata.controller;

import com.travel.ata.model.User;
import com.travel.ata.repository.UserRepository;
import com.travel.ata.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AuthenticationManager authenticationManager;

	@GetMapping("index")
	public String home(){
		return "login";
	}

	@GetMapping("login")
	String login() {
		return "login";
	}

	@GetMapping(value = "registration")
	public ModelAndView register(@ModelAttribute("user") User user) {
		return new ModelAndView("registration", "user", new User());
	}

	@PostMapping("register")
	public String registerUser(@ModelAttribute("user") User user) {
			userService.saveUser(user);
		return "redirect:/login";
	}

	@GetMapping("forgetPassword")
	public String forgetPassword() {
		return "forgetPassword";
	}

	@PostMapping("forgetPassword/user")
	public ModelAndView getUsername(@ModelAttribute("user") User user) throws Exception {
		return new ModelAndView("changePassword","email",user.getUsername());
	}

	@GetMapping("changePassword/user")
	public ModelAndView changePass() throws Exception {
		return new ModelAndView("changePassword");
	}

	@PostMapping("/changePassword")
	public String changePass(@ModelAttribute("user") User user) throws Exception {
		boolean userExists = userService.isUserExists(user.getUsername());
		if (userExists){
			userService.updateUser(user);
		}
		return "redirect:/login";
	}

	@GetMapping(value = "afterlogout")
	public String logout() {
		return "redirect:/login";
	}

	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";

	}

	@PostMapping("/authenticate")
	public String login(@ModelAttribute("user") User user, Authentication authentication) {
		System.out.println(authentication.getName());
		System.out.println(user.getUsername());
		Optional<? extends GrantedAuthority> optionalGrantedAuthority = authentication.getAuthorities().stream().findFirst();
		if (optionalGrantedAuthority.isPresent()){
			String userId = userRepository.findByUsername(authentication.getName()).getUsername();
			return authentication.getName()+"-"+ optionalGrantedAuthority.get().getAuthority()+"-"+ userId;
		}
		return "wrong credentials";
	}



}