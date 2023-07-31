package gr.GeraiBadai.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.Status;

@Repository
public interface StatusRepo extends JpaRepository<Status, Long> {

	Optional<Status> findByLive(boolean live);

}
