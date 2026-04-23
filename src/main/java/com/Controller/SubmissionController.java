package com.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
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
import com.Entity.ParticipantsEntity;
import com.Entity.SubmissionEntity;
import com.Entity.UserEntity;
import com.Repository.AddEventRepository;
import com.Repository.ParticipantsRepository;
import com.Repository.SubmissionRepository;
import com.cloudinary.Cloudinary;

import jakarta.servlet.http.HttpSession;

@Controller
public class SubmissionController {

    @Autowired AddEventRepository    addEventRepository;
    @Autowired ParticipantsRepository participantsRepository;
    @Autowired SubmissionRepository  submissionRepository;
    @Autowired Cloudinary            cloudinary;

    // ══════════════════════════════════════════════
    //  SHOW SUBMISSION FORM (User)
    // ══════════════════════════════════════════════
    @GetMapping("/submitWork/{eventId}")
    public String showSubmitPage(@PathVariable Integer eventId,
                                 HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        AddEventEntity event = addEventRepository.findById(eventId).orElse(null);
        if (event == null) return "redirect:/listEvent";

        // Must be registered
        ParticipantsEntity participant =
            participantsRepository.findByEventIdAndUserId(eventId, user.getId());
        if (participant == null) {
            model.addAttribute("error", "You must register for this event before submitting.");
            model.addAttribute("event", event);
            return "EventSubmit";
        }

        // Already submitted?
        List<SubmissionEntity> existing =
            submissionRepository.findByEventIdAndUserId(eventId, user.getId());

        model.addAttribute("event",       event);
        model.addAttribute("user",        user);
        model.addAttribute("participant", participant);
        model.addAttribute("existing",    existing.isEmpty() ? null : existing.get(0));
        return "EventSubmit";
    }

    // ══════════════════════════════════════════════
    //  SUBMIT WORK (User POST)
    // ══════════════════════════════════════════════
    @PostMapping("/submitWork")
    public String submitWork(
            HttpSession session,
            @RequestParam Integer eventId,
            @RequestParam("submissionFile") MultipartFile submissionFile,
            @RequestParam(required = false) String description) {

        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        ParticipantsEntity participant =
            participantsRepository.findByEventIdAndUserId(eventId, user.getId());
        if (participant == null) return "redirect:/listEventDetails/" + eventId;

        if (submissionFile == null || submissionFile.isEmpty())
            return "redirect:/submitWork/" + eventId;

        try {
            // Upload to Cloudinary — raw resource type for non-image files
            Map uploadOptions = com.cloudinary.utils.ObjectUtils.asMap(
                "resource_type", "raw",
                "public_id", "submissions/" + eventId + "_" + user.getId() + "_" + System.currentTimeMillis()
            );
            Map result = cloudinary.uploader().upload(submissionFile.getBytes(), uploadOptions);

            String fileUrl  = result.get("secure_url").toString();
            String origName = submissionFile.getOriginalFilename();
            String fileType = origName != null && origName.contains(".")
                              ? origName.substring(origName.lastIndexOf('.') + 1).toLowerCase()
                              : "file";

            SubmissionEntity sub = new SubmissionEntity();
            sub.setEventId(eventId);
            sub.setUserId(user.getId());
            sub.setParticipantId(participant.getParticipantId());
            sub.setTeamName(participant.getTeamName());
            sub.setSubmittedBy(user.getFirstName() + " " + user.getLastName());
            sub.setFileUrl(fileUrl);
            sub.setFileName(origName);
            sub.setFileType(fileType);
            sub.setDescription(description);
            sub.setSubmittedAt(LocalDate.now());
            sub.setStatus("PENDING");

            submissionRepository.save(sub);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/submissionSuccess/" + eventId;
    }

    // ══════════════════════════════════════════════
    //  SUBMISSION SUCCESS PAGE
    // ══════════════════════════════════════════════
    @GetMapping("/submissionSuccess/{eventId}")
    public String submissionSuccess(@PathVariable Integer eventId,
                                    HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("loggedUser");
        if (user == null) return "redirect:/login";

        AddEventEntity event = addEventRepository.findById(eventId).orElse(null);
        List<SubmissionEntity> subs =
            submissionRepository.findByEventIdAndUserId(eventId, user.getId());

        model.addAttribute("event", event);
        model.addAttribute("submission", subs.isEmpty() ? null : subs.get(0));
        model.addAttribute("user", user);
        return "SubmissionSuccess";
    }

    // ══════════════════════════════════════════════
    //  JUDGE DASHBOARD
    // ══════════════════════════════════════════════
    @GetMapping("/judge-dashboard")
    public String judgeDashboard(HttpSession session, Model model) {
        UserEntity judge = (UserEntity) session.getAttribute("loggedUser");
        if (judge == null || !"Judge".equals(judge.getRole()))
            return "redirect:/login";

        // All events
        List<AddEventEntity> allEvents = addEventRepository.findAll();

        // All submissions
        List<SubmissionEntity> allSubmissions = submissionRepository.findAll();

        // Stats
        long totalSubs    = allSubmissions.size();
        long pending      = submissionRepository.countByStatus("PENDING");
        long reviewed     = totalSubs - pending;
        long approved     = submissionRepository.countByStatus("APPROVED");
        long rejected     = submissionRepository.countByStatus("REJECTED");

        // Build event + submission data
        List<JudgeEventData> eventData = new ArrayList<>();
        for (AddEventEntity ev : allEvents) {
            List<SubmissionEntity> subs = submissionRepository.findByEventId(ev.getEventId());
            if (!subs.isEmpty()) {
                eventData.add(new JudgeEventData(ev, subs));
            }
        }

        model.addAttribute("judge",       judge);
        model.addAttribute("eventData",   eventData);
        model.addAttribute("allSubs",     allSubmissions);
        model.addAttribute("totalSubs",   totalSubs);
        model.addAttribute("pending",     pending);
        model.addAttribute("reviewed",    reviewed);
        model.addAttribute("approved",    approved);
        model.addAttribute("rejected",    rejected);
        model.addAttribute("allEvents",   allEvents);
        return "JudgeDashboard";
    }

    // ══════════════════════════════════════════════
    //  JUDGE REVIEW — save score + feedback
    // ══════════════════════════════════════════════
    @PostMapping("/judge/review")
    public String reviewSubmission(
            HttpSession session,
            @RequestParam Integer submissionId,
            @RequestParam Integer score,
            @RequestParam String status,
            @RequestParam(required = false) String feedback) {

        UserEntity judge = (UserEntity) session.getAttribute("loggedUser");
        if (judge == null || !"Judge".equals(judge.getRole()))
            return "redirect:/login";

        SubmissionEntity sub = submissionRepository.findById(submissionId).orElse(null);
        if (sub != null) {
            sub.setScore(score);
            sub.setStatus(status);
            sub.setFeedback(feedback);
            sub.setJudgeId(judge.getId());
            submissionRepository.save(sub);
        }

        return "redirect:/judge-dashboard";
    }

    // ══════════════════════════════════════════════
    //  JUDGE VIEW SINGLE SUBMISSION
    // ══════════════════════════════════════════════
    @GetMapping("/judge/viewSubmission/{id}")
    public String viewSubmission(@PathVariable Integer id,
                                 HttpSession session, Model model) {
        UserEntity judge = (UserEntity) session.getAttribute("loggedUser");
        if (judge == null || !"Judge".equals(judge.getRole()))
            return "redirect:/login";

        SubmissionEntity sub = submissionRepository.findById(id).orElse(null);
        AddEventEntity event = sub != null
            ? addEventRepository.findById(sub.getEventId()).orElse(null) : null;

        model.addAttribute("sub",   sub);
        model.addAttribute("event", event);
        model.addAttribute("judge", judge);
        return "JudgeReview";
    }

    // ══════════════════════════════════════════════
    //  INNER CLASS
    // ══════════════════════════════════════════════
    public static class JudgeEventData {
        private final AddEventEntity         event;
        private final List<SubmissionEntity> submissions;

        public JudgeEventData(AddEventEntity event, List<SubmissionEntity> submissions) {
            this.event       = event;
            this.submissions = submissions;
        }
        public AddEventEntity         getEvent()       { return event; }
        public List<SubmissionEntity> getSubmissions() { return submissions; }
        public int                    getCount()       { return submissions.size(); }
        public long getPendingCount() {
            return submissions.stream().filter(s -> "PENDING".equals(s.getStatus())).count();
        }
    }
}
