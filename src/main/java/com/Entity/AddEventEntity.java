package com.Entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="addEvents")
public class AddEventEntity {
	
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	 	private Integer eventId;
	    private String eventTitle;
	    private String organizationName;
	    private String participationType;   // Individual / Team
	    private String location;            // Online / Ahmedabad / Delhi
	    private String skillTags;           // UI Design, Frontend etc
	    private LocalDate postedDate;
	    private LocalDate lastDate;         // registration last date
	    private String eventImage;
	    private Integer minTeamSize;
	    private Integer maxTeamSize;
		public Integer getEventId() {
			return eventId;
		}
		public void setEventId(Integer eventId) {
			this.eventId = eventId;
		}
		public String getEventTitle() {
			return eventTitle;
		}
		public void setEventTitle(String eventTitle) {
			this.eventTitle = eventTitle;
		}
		public String getOrganizationName() {
			return organizationName;
		}
		public void setOrganizationName(String organizationName) {
			this.organizationName = organizationName;
		}
		public String getParticipationType() {
			return participationType;
		}
		public void setParticipationType(String participationType) {
			this.participationType = participationType;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getSkillTags() {
			return skillTags;
		}
		public void setSkillTags(String skillTags) {
			this.skillTags = skillTags;
		}
		public LocalDate getPostedDate() {
			return postedDate;
		}
		public void setPostedDate(LocalDate postedDate) {
			this.postedDate = postedDate;
		}
		public LocalDate getLastDate() {
			return lastDate;
		}
		public void setLastDate(LocalDate lastDate) {
			this.lastDate = lastDate;
		}
		public String getEventImage() {
			return eventImage;
		}
		public void setEventImage(String eventImage) {
			this.eventImage = eventImage;
		}
		public Integer getMinTeamSize() {
			return minTeamSize;
		}
		public void setMinTeamSize(Integer minTeamSize) {
			this.minTeamSize = minTeamSize;
		}
		public Integer getMaxTeamSize() {
			return maxTeamSize;
		}
		public void setMaxTeamSize(Integer maxTeamSize) {
			this.maxTeamSize = maxTeamSize;
		}
		
	    
}
