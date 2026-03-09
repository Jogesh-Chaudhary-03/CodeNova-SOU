package com.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Entity.AddEventEntity;
import com.Repository.AddEventRepository;
import com.cloudinary.Cloudinary;

@Controller
public class AddEventController {
	
	
	@Autowired
	AddEventRepository addEventRepository;
	
	@Autowired
	Cloudinary cloudinary;
	
	@GetMapping("addEvent")
	public String AddEvent(){
		return "AddEvent";
	}
	
	@PostMapping("saveEvent")
	public String SaveEvent(AddEventEntity addEventEntity,MultipartFile bannerFile) {

	    try {
	        Map map = cloudinary.uploader().upload(bannerFile.getBytes(), null);
	        String bannerImage = map.get("secure_url").toString();
	        addEventEntity.setBannerImage(bannerImage);
	        System.out.println(map);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    addEventRepository.save(addEventEntity);
	    return "Home";
	}
	
	@GetMapping("listEvent")
	public String ListEvent(Model model) {
		List<AddEventEntity> eventList= addEventRepository.findAll();
		model.addAttribute("eventList", eventList);
		
		return "ListEvent";
	}
}
