package gr.GeraiBadai.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.CollectionMethod;
import gr.GeraiBadai.model.Type;
import gr.GeraiBadai.repository.CollectionMethodRepo;

@Service
public class CollectionMethodService {

	@Autowired
	CollectionMethodRepo collectionMethodRepo;

	public CollectionMethod getCollectionMethodByBool(boolean how) {
		// TODO Auto-generated method stub
		CollectionMethod collectionMethod = new CollectionMethod();
        Optional<CollectionMethod> CMOptional = collectionMethodRepo.findByHow(how);
        if (CMOptional.isEmpty()) {
            collectionMethod.setHow(how);
            collectionMethodRepo.save(collectionMethod);
            return collectionMethod;
        } else return CMOptional.get();
		
	}
	
}
