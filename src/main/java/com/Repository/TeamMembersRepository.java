package com.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.TeamMembersEntity;

@Repository
public interface TeamMembersRepository extends JpaRepository<TeamMembersEntity, Integer>{

}
