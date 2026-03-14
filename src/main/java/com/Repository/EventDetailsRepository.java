package com.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.EventDetailsEntity;

@Repository
public interface EventDetailsRepository extends JpaRepository<EventDetailsEntity, Integer>{
	EventDetailsEntity findByEventId(Integer eventId);
}
