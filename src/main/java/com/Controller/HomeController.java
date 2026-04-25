package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import jakarta.servlet.http.HttpSession;
import com.Entity.AddEventEntity;
import com.Entity.ParticipantsEntity;
import com.Entity.TeamMembersEntity;
import com.Entity.SubmissionEntity;
import com.Entity.UserEntity;
import com.Repository.AddEventRepository;
import com.Repository.ParticipantsRepository;
import com.Repository.TeamMembersRepository;
import com.Repository.SubmissionRepository;
import com.Repository.UserRepository;



@Controller
public class HomeController {
	
	@Autowired
	ParticipantsRepository participantsRepository;

	@Autowired
	TeamMembersRepository teamMembersRepository;
	
	@Autowired
	SubmissionRepository submissionRepository;
	
	@Autowired
	AddEventRepository addEventRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping(value = {"home","Home","/"})
	public String HomePage(Model model) {
	    List<AddEventEntity> eventList = addEventRepository.findAll();
	    model.addAttribute("eventList", eventList);
		return "Home";
	}
	
	@GetMapping("about")
	public String AboutPage() {
		return "About";
	}
	
	@GetMapping("/leaderboard")
	public String Leaderboard(@RequestParam(value = "eventId", required = false) Integer eventId, Model model) {
	    List<AddEventEntity> eventList = addEventRepository.findAll();
	    model.addAttribute("eventList", eventList);

	    // Build leaderboard from reviewed submissions
	    List<SubmissionEntity> submissions;
	    if (eventId != null) {
	        submissions = submissionRepository.findByEventId(eventId);
	    } else {
	        submissions = submissionRepository.findAll();
	    }

	    // Filter only REVIEWED/APPROVED with score
	    List<Map<String, Object>> leaderboard = new ArrayList<>();
	    for (SubmissionEntity sub : submissions) {
	        if (sub.getScore() != null) {
	            Map<String, Object> entry = new HashMap<>();
	            entry.put("userId",     sub.getUserId());
	            entry.put("userName",   sub.getSubmittedBy() != null ? sub.getSubmittedBy() : "Unknown");
	            entry.put("teamName",   sub.getTeamName() != null ? sub.getTeamName() : "Individual");
	            entry.put("totalScore", sub.getScore());
	            entry.put("profilePic", "");

	            // Fetch profile pic from UserEntity
	            Optional<UserEntity> uOpt = userRepository.findById(sub.getUserId());
	            if (uOpt.isPresent() && uOpt.get().getProfilePic() != null) {
	                entry.put("profilePic", uOpt.get().getProfilePic());
	            }

	            // Fetch event title
	            Optional<AddEventEntity> evOpt = addEventRepository.findById(sub.getEventId());
	            entry.put("eventTitle", evOpt.isPresent() ? evOpt.get().getEventTitle() : "");

	            leaderboard.add(entry);
	        }
	    }

	    // Sort descending by score
	    leaderboard.sort((a, b) -> Integer.compare((Integer) b.get("totalScore"), (Integer) a.get("totalScore")));

	    model.addAttribute("leaderboard", leaderboard);
	    return "Leaderboard";
	}


	// ══════════════════════════════════════
	// 2. CHALLENGES (all events as challenges)
	// ══════════════════════════════════════
	@GetMapping("/challenges")
	public String Challenges(Model model) {
	    List<AddEventEntity> eventList = addEventRepository.findAll();
	    model.addAttribute("eventList", eventList);
	    return "Challenges";
	}


	// ══════════════════════════════════════
	// 3. TEAM FORMATION
	// ══════════════════════════════════════
	@GetMapping("/teams")
	public String TeamFormation(HttpSession session, Model model) {

	    // Team events only
	    List<AddEventEntity> allEvents = addEventRepository.findAll();
	    List<AddEventEntity> teamEvents = new ArrayList<>();
	    for (AddEventEntity ev : allEvents) {
	        if ("Team".equalsIgnoreCase(ev.getParticipationType())) {
	            teamEvents.add(ev);
	        }
	    }
	    model.addAttribute("teamEvents", teamEvents);

	    // My teams (if logged in)
	    UserEntity loggedUser = (UserEntity) session.getAttribute("loggedUser");
	    if (loggedUser != null) {
	        List<ParticipantsEntity> myTeams = participantsRepository.findByuserId(loggedUser.getId());
	        model.addAttribute("myTeams", myTeams);

	        // Build teamMembersMap: participantId → List<TeamMembersEntity>
	        Map<Integer, List<TeamMembersEntity>> teamMembersMap = new HashMap<>();
	        for (ParticipantsEntity p : myTeams) {
	            List<TeamMembersEntity> members = teamMembersRepository.findByParticipantId(p.getParticipantId());
	            teamMembersMap.put(p.getParticipantId(), members);
	        }
	        model.addAttribute("teamMembersMap", teamMembersMap);
	    }

	    return "TeamFormation";
	}

	
}
