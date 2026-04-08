package com.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.ParticipantsEntity;

@Repository
public interface ParticipantsRepository extends JpaRepository<ParticipantsEntity, Integer>{
	List<ParticipantsEntity> findByEventId(Integer eventId);
    List<ParticipantsEntity> findByuserId(Integer userId); // userId se dhundho
    ParticipantsEntity findByEventIdAndUserId(Integer eventId, Integer userId); // already registered check
}
