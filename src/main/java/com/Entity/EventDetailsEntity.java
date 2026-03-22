package com.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="eventDetails")
public class EventDetailsEntity {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventDetailId;
    private Integer eventId;
    @Column(columnDefinition = "TEXT")
    private String aboutEvent;
    @Column(columnDefinition = "TEXT")
    private String eligibility;
    @Column(columnDefinition = "TEXT")
    private String rules;
    @Column(columnDefinition = "TEXT")
    private String eventFormat;
    @Column(columnDefinition = "TEXT")
    private String eventPerks;
    private String prizePool;
    private String contactEmail;
    private String contactPhone;
	public Integer getEventDetailId() {
		return eventDetailId;
	}
	public void setEventDetailId(Integer eventDetailId) {
		this.eventDetailId = eventDetailId;
	}
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public String getAboutEvent() {
		return aboutEvent;
	}
	public void setAboutEvent(String aboutEvent) {
		this.aboutEvent = aboutEvent;
	}
	public String getEligibility() {
		return eligibility;
	}
	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	public String getEventFormat() {
		return eventFormat;
	}
	public void setEventFormat(String eventFormat) {
		this.eventFormat = eventFormat;
	}
	public String getEventPerks() {
		return eventPerks;
	}
	public void setEventPerks(String eventPerks) {
		this.eventPerks = eventPerks;
	}
	public String getPrizePool() {
		return prizePool;
	}
	public void setPrizePool(String prizePool) {
		this.prizePool = prizePool;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	
        
    
}
