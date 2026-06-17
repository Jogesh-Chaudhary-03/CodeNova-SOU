package com.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Entity.UserEntity;
import com.Repository.UserRepository;
import com.cloudinary.Cloudinary;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    Cloudinary cloudinary;

    // ── Pages ──────────────────────────────────────────────

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

    // ── Register (with server-side validation) ─────────────

    @PostMapping("/usersignup")
    public String register(
            UserEntity userEntity,
            @RequestParam(value = "picFile", required = false) MultipartFile picFile,
            Model model) {

        // ✅ FIX: Server-side validation — check if email already registered
        if (userEntity.getEmail() == null || userEntity.getEmail().trim().isEmpty()) {
            model.addAttribute("signupError", "Email address is required.");
            return "Signup";
        }

        Optional<UserEntity> existing = userRepository.findByEmail(userEntity.getEmail().trim());
        if (existing.isPresent()) {
            model.addAttribute("signupError",
                "This email is already registered. Please login or use a different email.");
            return "Signup";
        }

        // ✅ FIX: Basic field validation
        if (userEntity.getFirstName() == null || userEntity.getFirstName().trim().isEmpty() ||
            userEntity.getLastName()  == null || userEntity.getLastName().trim().isEmpty()) {
            model.addAttribute("signupError", "First name and last name are required.");
            return "Signup";
        }

        if (userEntity.getPassword() == null || userEntity.getPassword().length() < 8) {
            model.addAttribute("signupError", "Password must be at least 8 characters.");
            return "Signup";
        }

        // Upload profile picture if provided
        if (picFile != null && !picFile.isEmpty()) {
            try {
                Map map = cloudinary.uploader().upload(picFile.getBytes(), null);
                userEntity.setProfilePic(map.get("secure_url").toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        userEntity.setActive(true);
        userEntity.setRole("Participant");
        userEntity.setCreatedAt(LocalDate.now());
        userRepository.save(userEntity);

        // ✅ FIX: Pass success message to Login page
        model.addAttribute("success", "Account created successfully! Please login.");
        return "Login";
    }

    // ── Login (with error message) ─────────────────────────

    @PostMapping("/userlogin")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        // ✅ FIX: Server-side input validation
        if (email == null || email.trim().isEmpty()) {
            model.addAttribute("error", "Please enter your email address.");
            return "Login";
        }
        if (password == null || password.isEmpty()) {
            model.addAttribute("error", "Please enter your password.");
            return "Login";
        }

        Optional<UserEntity> op = userRepository.findByEmail(email.trim());

        if (op.isPresent()) {
            UserEntity dbUser = op.get();

            // Check if account is active
            if (!dbUser.getActive()) {
                model.addAttribute("error", "Your account has been deactivated. Please contact admin.");
                return "Login";
            }

            if (dbUser.getPassword().equals(password)) {
                session.setAttribute("loggedUser", dbUser);

                // Role-based redirect
                if ("Admin".equals(dbUser.getRole())) {
                    return "redirect:/admin-dashboard";
                } else if ("Judge".equals(dbUser.getRole())) {
                    return "redirect:/judge-dashboard";
                } else {
                    return "redirect:/Home";
                }
            }
        }

        // ✅ FIX: Clear error message shown in Login.jsp via model attribute
        model.addAttribute("error", "Invalid email or password. Please try again.");
        return "Login";
    }

    // ── Logout ─────────────────────────────────────────────

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/Home";
    }
}
