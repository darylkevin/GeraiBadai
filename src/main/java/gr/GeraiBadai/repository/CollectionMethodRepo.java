package gr.GeraiBadai.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.CollectionMethod;
import gr.GeraiBadai.model.Type;

@Repository
public interface CollectionMethodRepo extends JpaRepository<CollectionMethod, Long> {

	Optional<CollectionMethod> findByHow(boolean how);
}
