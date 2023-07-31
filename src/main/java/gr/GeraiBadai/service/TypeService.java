package gr.GeraiBadai.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.Type;
import gr.GeraiBadai.repository.TypeRepo;

@Service
public class TypeService {

	@Autowired
	TypeRepo typeRepo;

    public Type getTypeByBool(boolean onDemand) {
        // TODO Auto-generated method stub
        Type type = new Type();
        Optional<Type> typeOptional = typeRepo.findByOnDemand(onDemand);
        if (typeOptional.isEmpty()) {
            type.setOnDemand(onDemand);
            typeRepo.save(type);
            return type;
        } else return typeOptional.get();
    
    }
    
	}
		