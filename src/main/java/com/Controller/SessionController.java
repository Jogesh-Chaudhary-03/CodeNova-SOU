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

    // ── Register ───────────────────────────────────────────

    @PostMapping("/usersignup")
    public String register(
            UserEntity userEntity,
            @RequestParam(value = "picFile", required = false)
            MultipartFile picFile) {

        if (picFile != null && !picFile.isEmpty()) {
            try {
                Map map = cloudinary.uploader()
                            .upload(picFile.getBytes(), null);
                userEntity.setProfilePic(
                    map.get("secure_url").toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        userEntity.setActive(true);
        userEntity.setRole("Participant");
        userEntity.setCreatedAt(LocalDate.now());
        userRepository.save(userEntity);

        return "Login";
    }

    // ── Login ──────────────────────────────────────────────

    @PostMapping("/userlogin")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<UserEntity> op = userRepository.findByEmail(email);

        if (op.isPresent()) {
            UserEntity dbUser = op.get();

            if (dbUser.getPassword().equals(password)) {
                // Save user in session
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

        // Wrong credentials
        model.addAttribute("error", "Invalid email or password. Please try again.");
        return "Login";
    }

    // ── Logout ─────────────────────────────────────────────

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/Home";
    }

    // ── Authenticate (purana — rakh sakte ho ya hata sakte ho) ──

    @PostMapping("authenticate")
    public String Authenticate(String email, String password, HttpSession session) {
        Optional<UserEntity> op = userRepository.findByEmail(email);
        if (op.isPresent()) {
            UserEntity dbUser = op.get();
            if (dbUser.getPassword().equals(password)) {
                session.setAttribute("loggedUser", dbUser);
                if ("Admin".equals(dbUser.getRole()))       return "redirect:/admin-dashboard";
                else if ("Participant".equals(dbUser.getRole())) return "redirect:Home";
                else if ("Judge".equals(dbUser.getRole()))  return "redirect:/judge-dashboard";
            }
        }
        return "Login";
    }
}