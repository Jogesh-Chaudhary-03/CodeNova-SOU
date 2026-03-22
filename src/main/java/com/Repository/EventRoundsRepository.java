package com.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.EventRoundsEntity;

@Repository
public interface EventRoundsRepository extends JpaRepository<EventRoundsEntity, Integer>{
	List<EventRoundsEntity> findByEventId(Integer eventId);
}
