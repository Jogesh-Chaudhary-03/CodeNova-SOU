package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Entity.AddEventEntity;
import com.Repository.AddEventRepository;

@Controller
public class HomeController {
	
	@Autowired
	AddEventRepository addEventRepository;
	@GetMapping(value = {"home","/"})
	public String HomePage(Model model) {
	    List<AddEventEntity> eventList = addEventRepository.findAll();
	    model.addAttribute("eventList", eventList);
		return "Home";
	}
	
	@GetMapping("about")
	public String AboutPage() {
		return "About";
	}
	
	
}
