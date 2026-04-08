package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.Entity.AddEventEntity;
import com.Entity.UserEntity;
import com.Repository.AddEventRepository;
import com.Repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    AddEventRepository addEventRepository;

    @Autowired
    UserRepository userRepository;

    // ── Admin Dashboard ──
    @GetMapping("/admin-dashboard")
    public String AdminDashboard(HttpSession session, Model model) {
        // Session check
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole())) {
            return "redirect:/login";
        }

        List<AddEventEntity> eventList = addEventRepository.findAll();
        List<UserEntity>     userList  = userRepository.findAll();

        // Stats
        long totalEvents = eventList.size();
        long totalUsers  = userList.size();
        long activeUsers = userList.stream()
                            .filter(u -> Boolean.TRUE.equals(u.getActive()))
                            .count();
        long blockedUsers = totalUsers - activeUsers;

        model.addAttribute("eventList",    eventList);
        model.addAttribute("userList",     userList);
        model.addAttribute("totalEvents",  totalEvents);
        model.addAttribute("totalUsers",   totalUsers);
        model.addAttribute("activeUsers",  activeUsers);
        model.addAttribute("blockedUsers", blockedUsers);
        model.addAttribute("admin",        admin);

        return "AdminDashboard";
    }

    // ── Delete Event ──
    @GetMapping("/admin/deleteEvent/{id}")
    public String deleteEvent(@PathVariable Integer id, HttpSession session) {
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole())) return "redirect:/login";
        addEventRepository.deleteById(id);
        return "redirect:/admin-dashboard";
    }

    // ── Block User ──
    @GetMapping("/admin/blockUser/{id}")
    public String blockUser(@PathVariable Integer id, HttpSession session) {
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole())) return "redirect:/login";
        UserEntity user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setActive(false);
            userRepository.save(user);
        }
        return "redirect:/admin-dashboard";
    }

    // ── Unblock User ──
    @GetMapping("/admin/unblockUser/{id}")
    public String unblockUser(@PathVariable Integer id, HttpSession session) {
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole())) return "redirect:/login";
        UserEntity user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setActive(true);
            userRepository.save(user);
        }
        return "redirect:/admin-dashboard";
    }
}

