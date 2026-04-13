package com.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.SubmissionEntity;

@Repository
public interface SubmissionRepository extends JpaRepository<SubmissionEntity, Integer> {

    List<SubmissionEntity> findByEventId(Integer eventId);

    List<SubmissionEntity> findByUserId(Integer userId);

    List<SubmissionEntity> findByEventIdAndUserId(Integer eventId, Integer userId);

    List<SubmissionEntity> findByJudgeId(Integer judgeId);

    List<SubmissionEntity> findByStatus(String status);

    List<SubmissionEntity> findByEventIdAndStatus(Integer eventId, String status);

    long countByEventId(Integer eventId);

    long countByStatus(String status);
}
