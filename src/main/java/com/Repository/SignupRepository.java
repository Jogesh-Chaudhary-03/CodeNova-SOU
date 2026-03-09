package com.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.SignupEntity;

@Repository
public interface SignupRepository extends JpaRepository<SignupEntity, Integer>{
	
}
