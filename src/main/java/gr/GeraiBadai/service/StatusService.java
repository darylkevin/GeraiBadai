package gr.GeraiBadai.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.Status;
import gr.GeraiBadai.repository.StatusRepo;

@Service
public class StatusService {

	@Autowired
	StatusRepo statusRepo;

    public Status getStatusByBool(boolean live) {
        // TODO Auto-generated method stub
        Status status = new Status();
        Optional<Status> statusOptional = statusRepo.findByLive(live);
        if (statusOptional.isEmpty()) {
            status.setLive(live);
            statusRepo.save(status);
            return status;
        } else return statusOptional.get();
    
    	}
	}
		

