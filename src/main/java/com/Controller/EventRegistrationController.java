package com.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Entity.AddEventEntity;
import com.Entity.ParticipantsEntity;
import com.Entity.TeamMembersEntity;
import com.Entity.UserEntity;
import com.Repository.AddEventRepository;
import com.Repository.ParticipantsRepository;
import com.Repository.TeamMembersRepository;
import com.Repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class EventRegistrationController {

    @Autowired AddEventRepository    addEventRepository;
    @Autowired ParticipantsRepository participantsRepository;
    @Autowired TeamMembersRepository  teamMembersRepository;
    @Autowired UserRepository         userRepository;

    // ════════════════════════════════════════════════
    //  REGISTRATION PAGES
    // ════════════════════════════════════════════════

    @GetMapping("/registerEvent/{eventId}")
    public String showRegisterPage(@PathVariable Integer eventId,
                                   HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        AddEventEntity event = addEventRepository.findById(eventId).orElse(null);
        if (event == null) return "redirect:/listEvent";

        ParticipantsEntity existing =
            participantsRepository.findByEventIdAndUserId(eventId, user.getId());

        model.addAttribute("event",             event);
        model.addAttribute("user",              user);
        model.addAttribute("alreadyRegistered", existing != null);
        return "EventRegister";
    }

    @PostMapping("/submitRegistration")
    public String submitRegistration(
            HttpSession session,
            @RequestParam Integer eventId,
            @RequestParam String participationType,
            @RequestParam(required = false) String teamName,
            @RequestParam(required = false) String teamLeader,
            @RequestParam(required = false) List<String> teamMemberNames,
            @RequestParam(required = false) List<String> teamMemberEmails) {

        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        // Already registered check
        ParticipantsEntity existing =
            participantsRepository.findByEventIdAndUserId(eventId, user.getId());
        if (existing != null) return "redirect:/listEventDetails/" + eventId;

        // Build + save participant
        ParticipantsEntity participant = new ParticipantsEntity();
        participant.setEventId(eventId);
        participant.setUserId(user.getId());
        participant.setParticipationType(participationType);

        if ("Team".equals(participationType)) {
            participant.setTeamName(teamName);
            participant.setTeamLeader(
                (teamLeader != null && !teamLeader.trim().isEmpty())
                ? teamLeader
                : user.getFirstName() + " " + user.getLastName());
        } else {
            participant.setTeamName(user.getFirstName() + " " + user.getLastName());
            participant.setTeamLeader(user.getFirstName() + " " + user.getLastName());
        }

        // ★ FIX: use saved object — auto-generated ID milta hai
        ParticipantsEntity saved = participantsRepository.save(participant);

        // Save team members using saved.getParticipantId()
        if ("Team".equals(participationType) && teamMemberNames != null) {
            for (int i = 0; i < teamMemberNames.size(); i++) {
                String name  = teamMemberNames.get(i);
                String email = (teamMemberEmails != null && i < teamMemberEmails.size())
                               ? teamMemberEmails.get(i) : "";
                if (name != null && !name.trim().isEmpty()) {
                    TeamMembersEntity member = new TeamMembersEntity();
                    member.setParticipantId(saved.getParticipantId()); // ★ saved ID
                    member.setMemberName(name.trim());
                    member.setMemberEmail(email.trim());
                    teamMembersRepository.save(member);
                }
            }
        }

        return "redirect:/registrationSuccess/" + eventId;
    }

    @GetMapping("/registrationSuccess/{eventId}")
    public String registrationSuccess(@PathVariable Integer eventId,
                                      HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        AddEventEntity     event       = addEventRepository.findById(eventId).orElse(null);
        ParticipantsEntity participant =
            participantsRepository.findByEventIdAndUserId(eventId, user.getId());

        List<TeamMembersEntity> members = null;
        if (participant != null && "Team".equals(participant.getParticipationType())) {
            members = teamMembersRepository.findByParticipantId(participant.getParticipantId());
        }

        model.addAttribute("event",       event);
        model.addAttribute("participant", participant);
        model.addAttribute("members",     members);
        model.addAttribute("user",        user);
        return "RegistrationSuccess";
    }

    // ════════════════════════════════════════════════
    //  USER PROFILE — user apne hackathons dekhe
    // ════════════════════════════════════════════════

    @GetMapping("/userProfile")
    public String userProfile(HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        // User ke saare registrations
        List<ParticipantsEntity> myRegistrations =
            participantsRepository.findByuserId(user.getId());

        // Har registration ke liye event + team members fetch karo
        List<UserEventData> myEvents = new ArrayList<>();
        for (ParticipantsEntity p : myRegistrations) {
            AddEventEntity event =
                addEventRepository.findById(p.getEventId()).orElse(null);
            List<TeamMembersEntity> members =
                "Team".equals(p.getParticipationType())
                ? teamMembersRepository.findByParticipantId(p.getParticipantId())
                : new ArrayList<>();
            myEvents.add(new UserEventData(event, p, members));
        }

        model.addAttribute("user",     user);
        model.addAttribute("myEvents", myEvents);
        return "UserProfile";
    }

    // ════════════════════════════════════════════════
    //  ADMIN — view specific user detail
    // ════════════════════════════════════════════════

    @GetMapping("/admin/viewUser/{userId}")
    public String adminViewUser(@PathVariable Integer userId,
                                HttpSession session, Model model) {
        UserEntity admin = (UserEntity) session.getAttribute("loggedUser");
        if (admin == null || !"Admin".equals(admin.getRole()))
            return "redirect:/login";

        UserEntity targetUser = userRepository.findById(userId).orElse(null);
        if (targetUser == null) return "redirect:/admin-dashboard";

        // User ke registrations
        List<ParticipantsEntity> registrations =
            participantsRepository.findByuserId(userId);

        List<UserEventData> userEvents = new ArrayList<>();
        for (ParticipantsEntity p : registrations) {
            AddEventEntity event =
                addEventRepository.findById(p.getEventId()).orElse(null);
            List<TeamMembersEntity> members =
                "Team".equals(p.getParticipationType())
                ? teamMembersRepository.findByParticipantId(p.getParticipantId())
                : new ArrayList<>();
            userEvents.add(new UserEventData(event, p, members));
        }

        model.addAttribute("targetUser",  targetUser);
        model.addAttribute("userEvents",  userEvents);
        return "AdminUserView";
       
    }

    // ════════════════════════════════════════════════
    //  INNER CLASS — event + participation + members
    // ════════════════════════════════════════════════

    public static class UserEventData {
        private AddEventEntity        event;
        private ParticipantsEntity    participant;
        private List<TeamMembersEntity> members;

        public UserEventData(AddEventEntity event,
                             ParticipantsEntity participant,
                             List<TeamMembersEntity> members) {
            this.event       = event;
            this.participant = participant;
            this.members     = members;
        }
        public AddEventEntity          getEvent()       { return event; }
        public ParticipantsEntity      getParticipant() { return participant; }
        public List<TeamMembersEntity> getMembers()     { return members; }
     
    }
}