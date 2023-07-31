package gr.GeraiBadai.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.Category;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Long> {

	Optional<Category> findByName(String name);

}
