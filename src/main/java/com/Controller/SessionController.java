package com.Controller;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Entity.UserEntity;
import com.Repository.UserRepository;

@Controller
public class SessionController {
	@Autowired
	UserRepository userRepository;
	
	@GetMapping("signup")
	public String SignupPage() {
		return "Signup";
	}
	
	@GetMapping("/login")
	public String LoginPage() {
		return "Login";
	}
	
	@GetMapping("/forgetpassword")
	public String ForgetPassword() {
		return "ForgetPassword";
	}
	
	@PostMapping("/usersignup")
	public String register(UserEntity userEntity) {
		System.out.println(userEntity.getFirstName());
		System.out.println(userEntity.getEmail());
		
		userEntity.setActive(true);
		userEntity.setRole("Participant");
		userEntity.setCreatedAt(LocalDate.now());
		userRepository.save(userEntity);
		return "Login";
	}
	
	@PostMapping("authenticate")
	public String Authenticate(String email,String password) {
		Optional<UserEntity> op= userRepository.findByEmail(email);
		if(op.isPresent()) {
			UserEntity dbUser = op.get();
			if(dbUser.getPassword().equals(password)) {
				if(dbUser.getRole().equals("Admin")) {
					return "redirect:/admin-dashboard";
				}else if(dbUser.getRole().equals("Participant")) {
					return "redirect:/home";
				}else if(dbUser.getRole().equals("Judge")) {
					return "redirect:/judge-dashboard";
				}
				
			}
		}
		return "home";
	}
	@PostMapping("/userlogin")
	public String RedirectHome() {
		return "Home";
	}

}
