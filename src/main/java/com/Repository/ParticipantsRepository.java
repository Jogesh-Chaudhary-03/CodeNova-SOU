package com.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.ParticipantsEntity;

@Repository
public interface ParticipantsRepository extends JpaRepository<ParticipantsEntity, Integer>{

}
