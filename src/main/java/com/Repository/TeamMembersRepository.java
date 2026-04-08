package com.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.TeamMembersEntity;

@Repository
public interface TeamMembersRepository extends JpaRepository<TeamMembersEntity, Integer>{
	List<TeamMembersEntity> findByParticipantId(Integer participantId);
}
