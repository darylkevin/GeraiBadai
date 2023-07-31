package gr.GeraiBadai.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.Type;

@Repository
public interface TypeRepo extends JpaRepository<Type, Long> {

	Optional<Type> findByOnDemand(boolean onDemand);
}
