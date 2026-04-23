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

import jakarta.servlet.http.HttpSession;
import com.Entity.UserEntity;

@Controller
public class AddEventController {

    @Autowired AddEventRepository    addEventRepository;
    @Autowired Cloudinary            cloudinary;
    @Autowired EventDetailsRepository eventDetailsRepository;
    @Autowired EventRoundsRepository  eventRoundsRepository;
    @Autowired EventFAQRepository     eventFAQRepository;

    @GetMapping("addEvent")
    public String AddEvent(HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null || !"Admin".equals(user.getRole()))
            return "redirect:/login";
        return "AddEvent";
    }

    @GetMapping("eventDetails")
    public String EventDetails() { return "EventDetails"; }

    // ══════════════════════════════════════════════════════
    //  SAVE EVENT — supports multiple rounds + FAQs
    // ══════════════════════════════════════════════════════
    @PostMapping("/saveEvent")
    public String SaveEvent(
            AddEventEntity addEventEntity,
            @RequestParam("eventFile") MultipartFile eventFile,
            EventDetailsEntity eventDetailsEntity,

            // Multiple rounds
            @RequestParam(value = "roundName",        required = false) List<String> roundNames,
            @RequestParam(value = "roundDescription", required = false) List<String> roundDescriptions,

            // Multiple FAQs
            @RequestParam(value = "question", required = false) List<String> questions,
            @RequestParam(value = "answer",   required = false) List<String> answers) {

        // Upload image
        try {
            Map map = cloudinary.uploader().upload(eventFile.getBytes(), null);
            addEventEntity.setEventImage(map.get("secure_url").toString());
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Save event
        addEventRepository.save(addEventEntity);
        Integer eventId = addEventEntity.getEventId();

        // Save event details
        eventDetailsEntity.setEventId(eventId);
        eventDetailsRepository.save(eventDetailsEntity);

        // Save ALL rounds
        if (roundNames != null) {
            for (int i = 0; i < roundNames.size(); i++) {
                String rName = roundNames.get(i);
                String rDesc = (roundDescriptions != null && i < roundDescriptions.size())
                               ? roundDescriptions.get(i) : "";
                if (rName != null && !rName.trim().isEmpty()) {
                    EventRoundsEntity round = new EventRoundsEntity();
                    round.setEventId(eventId);
                    round.setRoundName(rName.trim());
                    round.setRoundDescription(rDesc.trim());
                    eventRoundsRepository.save(round);
                }
            }
        }

        // Save ALL FAQs
        if (questions != null) {
            for (int i = 0; i < questions.size(); i++) {
                String q = questions.get(i);
                String a = (answers != null && i < answers.size()) ? answers.get(i) : "";
                if (q != null && !q.trim().isEmpty()) {
                    EventFAQEntity faq = new EventFAQEntity();
                    faq.setEventId(eventId);
                    faq.setQuestion(q.trim());
                    faq.setAnswer(a.trim());
                    eventFAQRepository.save(faq);
                }
            }
        }

        return "redirect:/admin-dashboard";
    }

    // ══════════════════════════════════════════════════════
    //  LIST EVENTS
    // ══════════════════════════════════════════════════════
    @GetMapping("listEvent")
    public String ListEvent(Model model) {
        model.addAttribute("eventList", addEventRepository.findAll());
        return "ListEvent";
    }

    // ══════════════════════════════════════════════════════
    //  EVENT DETAILS
    // ══════════════════════════════════════════════════════
    @GetMapping("/listEventDetails/{id}")
    public String listEventDetails(@PathVariable Integer id, Model model) {
        model.addAttribute("event",       addEventRepository.findById(id).orElse(null));
        model.addAttribute("eventDetail", eventDetailsRepository.findByEventId(id));
        model.addAttribute("rounds",      eventRoundsRepository.findByEventId(id));
        model.addAttribute("faqs",        eventFAQRepository.findByEventId(id));
        return "ListEventDetails";
    }

    // ══════════════════════════════════════════════════════
    //  EDIT EVENT PAGE
    // ══════════════════════════════════════════════════════
    @GetMapping("/admin/editEvent/{id}")
    public String editEvent(@PathVariable Integer id,
                            HttpSession session, Model model) {
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole()))
            return "redirect:/login";

        AddEventEntity     event       = addEventRepository.findById(id).orElse(null);
        EventDetailsEntity eventDetail = eventDetailsRepository.findByEventId(id);
        List<EventRoundsEntity> rounds = eventRoundsRepository.findByEventId(id);
        List<EventFAQEntity>    faqs   = eventFAQRepository.findByEventId(id);

        model.addAttribute("event",       event);
        model.addAttribute("eventDetail", eventDetail);
        model.addAttribute("rounds",      rounds);
        model.addAttribute("faqs",        faqs);
        return "EditEvent";
    }

    // ══════════════════════════════════════════════════════
    //  UPDATE EVENT
    // ══════════════════════════════════════════════════════
    @PostMapping("/admin/updateEvent")
    public String updateEvent(
            @RequestParam Integer eventId,
            @RequestParam String eventTitle,
            @RequestParam String organizationName,
            @RequestParam String participationType,
            @RequestParam String location,
            @RequestParam(required = false) String skillTags,
            @RequestParam String postedDate,
            @RequestParam String lastDate,
            @RequestParam(value = "eventFile", required = false) MultipartFile eventFile,

            // Details
            @RequestParam(required = false) String aboutEvent,
            @RequestParam(required = false) String eligibility,
            @RequestParam(required = false) String rules,
            @RequestParam(required = false) String eventFormat,
            @RequestParam(required = false) String eventPerks,
            @RequestParam(required = false) String prizePool,
            @RequestParam(required = false) String contactEmail,
            @RequestParam(required = false) String contactPhone,

            HttpSession session) {

        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole()))
            return "redirect:/login";

        AddEventEntity event = addEventRepository.findById(eventId).orElse(null);
        if (event == null) return "redirect:/admin-dashboard";

        event.setEventTitle(eventTitle);
        event.setOrganizationName(organizationName);
        event.setParticipationType(participationType);
        event.setLocation(location);
        event.setSkillTags(skillTags);
        event.setPostedDate(java.time.LocalDate.parse(postedDate));
        event.setLastDate(java.time.LocalDate.parse(lastDate));

        if (eventFile != null && !eventFile.isEmpty()) {
            try {
                Map map = cloudinary.uploader().upload(eventFile.getBytes(), null);
                event.setEventImage(map.get("secure_url").toString());
            } catch (IOException e) { e.printStackTrace(); }
        }
        addEventRepository.save(event);

        EventDetailsEntity detail = eventDetailsRepository.findByEventId(eventId);
        if (detail == null) detail = new EventDetailsEntity();
        detail.setEventId(eventId);
        detail.setAboutEvent(aboutEvent);
        detail.setEligibility(eligibility);
        detail.setRules(rules);
        detail.setEventFormat(eventFormat);
        detail.setEventPerks(eventPerks);
        detail.setPrizePool(prizePool);
        detail.setContactEmail(contactEmail);
        detail.setContactPhone(contactPhone);
        eventDetailsRepository.save(detail);

        return "redirect:/listEventDetails/" + eventId;
    }
}
