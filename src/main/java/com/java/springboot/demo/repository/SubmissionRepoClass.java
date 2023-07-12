package com.java.springboot.demo.repository;

import com.java.springboot.demo.entity.SubmissionDTO;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class SubmissionRepoClass implements SubmissionRepository{
    private Map<String, SubmissionDTO> submissions = new HashMap<>();

    @Override
    public SubmissionDTO getSubmission(String id) {

        return submissions.get(id);
    }

    @Override
    public List<SubmissionDTO> getAll() {
        return new ArrayList<>(submissions.values());
    }

    @Override
    public SubmissionDTO addSubmission(SubmissionDTO submission) {
        String id = UUID.randomUUID().toString();
        submission.setId(id);

        submissions.put(id, submission);
        return submission;
    }

    @Override
    public SubmissionDTO updateSubmission(SubmissionDTO submission) {
        SubmissionDTO sdto = new SubmissionDTO();
        sdto.setId(submission.getId());
        sdto.setSubmissionDate(submission.getSubmissionDate());
        sdto.setRate(submission.getRate());
        sdto.setTechnology(submission.getTechnology());
        sdto.setVendorName(submission.getVendorName());
        sdto.setConsultantName(submission.getConsultantName());
        return sdto;
    }

    @Override
    public boolean deleteSubmission(String id) {
        submissions.entrySet().stream().filter(es ->{
            if (es.getValue().getConsultantName().equals(id)){
                return true;
            }
            return false;
        }).map(k -> k.getValue()).toList().forEach(submissions::remove);
        return true;
    }

}
