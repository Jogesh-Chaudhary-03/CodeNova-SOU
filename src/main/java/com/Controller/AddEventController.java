package com.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Entity.AddEventEntity;
import com.Entity.EventDetailsEntity;
import com.Entity.EventFAQEntity;
import com.Entity.EventRoundsEntity;
import com.Repository.AddEventRepository;
import com.Repository.EventDetailsRepository;
import com.Repository.EventFAQRepository;
import com.Repository.EventRoundsRepository;
import com.cloudinary.Cloudinary;

@Controller
public class AddEventController {
	
	
	@Autowired
	AddEventRepository addEventRepository;
	
	@Autowired
	Cloudinary cloudinary;
	
	@Autowired
	EventDetailsRepository eventDetailsRepository;
	
	@Autowired
	EventRoundsRepository eventRoundsRepository;
	
	@Autowired
	EventFAQRepository eventFAQRepository;
	
	@GetMapping("addEvent")
	public String AddEvent(){
		return "AddEvent";
	}
	
	@GetMapping("eventDetails")
	public String EventDetails() {
		return "EventDetails";
	}
	
	@PostMapping("/saveEvent")
	public String SaveEvent(AddEventEntity addEventEntity,
	                        @RequestParam("eventFile") MultipartFile eventFile,EventDetailsEntity eventDetailsEntity,EventRoundsEntity eventRoundsEntity,EventFAQEntity eventFAQEntity) {

	    try {

	        Map map = cloudinary.uploader().upload(eventFile.getBytes(), null);

	        String eventImage = map.get("secure_url").toString();

	        addEventEntity.setEventImage(eventImage);

	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    addEventRepository.save(addEventEntity);
	    
	    eventDetailsEntity.setEventId(addEventEntity.getEventId());
		eventDetailsRepository.save(eventDetailsEntity);
		eventRoundsEntity.setEventId(addEventEntity.getEventId());
		eventRoundsRepository.save(eventRoundsEntity);
		eventFAQEntity.setEventId(addEventEntity.getEventId());
		eventFAQRepository.save(eventFAQEntity);

	    return "Home";
	}
	
	
	@GetMapping("listEvent")
	public String ListEvent(Model model) {
		List<AddEventEntity> eventList= addEventRepository.findAll();
		model.addAttribute("eventList", eventList);
		
		return "ListEvent";
	}
	
//	@GetMapping("/listEventDetails")
	//public String listEventDetails(Model model) {

	    // Fetch complete EventDetails entities (with text fields)
	    //List<EventDetailsEntity> event = eventDetailsRepository.findAll();

	    //model.addAttribute("event", event); // List of entities
	  //  return "ListEventDetails"; // JSP name
	//}
	
	@GetMapping("/listEventDetails/{id}")
	public String listEventDetails(@PathVariable Integer id, Model model) {
	    model.addAttribute("event", addEventRepository.findById(id).orElse(null));
	    model.addAttribute("eventDetail", eventDetailsRepository.findByEventId(id));
	    model.addAttribute("rounds", eventRoundsRepository.findByEventId(id));
	    model.addAttribute("faqs", eventFAQRepository.findByEventId(id));
	    return "ListEventDetails";
	}
	
}
