package com.Entity;

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
	    private String title;
	    private String shortDescription;
	    private String bannerImage;
	    private String logoImage;
	    private Double prizeAmount;
	    private String currency;
	    private Integer participantsCount = 0;
	    private Integer likesCount = 0;
	    private String status;  // UPCOMING / ACTIVE / COMPLETED
	    private LocalDateTime createdAt;
	        
	    
		public Integer getEventId() {
			return eventId;
		}
		public void setEventId(Integer eventId) {
			this.eventId = eventId;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getShortDescription() {
			return shortDescription;
		}
		public void setShortDescription(String shortDescription) {
			this.shortDescription = shortDescription;
		}
		public String getBannerImage() {
			return bannerImage;
		}
		public void setBannerImage(String bannerImage) {
			this.bannerImage = bannerImage;
		}
		public String getLogoImage() {
			return logoImage;
		}
		public void setLogoImage(String logoImage) {
			this.logoImage = logoImage;
		}
		public Double getPrizeAmount() {
			return prizeAmount;
		}
		public void setPrizeAmount(Double prizeAmount) {
			this.prizeAmount = prizeAmount;
		}
		public String getCurrency() {
			return currency;
		}
		public void setCurrency(String currency) {
			this.currency = currency;
		}
		public Integer getParticipantsCount() {
			return participantsCount;
		}
		public void setParticipantsCount(Integer participantsCount) {
			this.participantsCount = participantsCount;
		}
		public Integer getLikesCount() {
			return likesCount;
		}
		public void setLikesCount(Integer likesCount) {
			this.likesCount = likesCount;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public LocalDateTime getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(LocalDateTime createdAt) {
			this.createdAt = createdAt;
		}
}
