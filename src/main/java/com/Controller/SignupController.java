package com.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.Entity.SignupEntity;
import com.Repository.SignupRepository;

@Controller
public class SignupController {
	
	@Autowired
	SignupRepository signupRepository;
	
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
	public String register(SignupEntity signupEntity) {
		System.out.println(signupEntity.getFirstName());
		System.out.println(signupEntity.getEmail());
		
		signupRepository.save(signupEntity);
		return "Login";
	}
	
	@PostMapping("/userlogin")
	public String RedirectHome() {
		return "Home";
	}
}

