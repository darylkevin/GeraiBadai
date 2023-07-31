package gr.GeraiBadai.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.Product;

@Repository
public interface ProductRepo extends JpaRepository<Product, Long> {

	Optional<Product> findByName(String name);
	
	@Query(
		    value = "SELECT COALESCE(SUM(live), 0) FROM product p INNER JOIN status s ON p.fk_status_id = s.status_id",
		    nativeQuery = true)
		int findCountOfLiveProducts();
	
	@Query(
		    value = "SELECT COALESCE((SELECT COUNT(product_id) FROM product), 0) - COALESCE(SUM(live), 0) FROM product p INNER JOIN status s ON p.fk_status_id = s.status_id",
		    nativeQuery = true)    
		int findCountOfPrivateProducts();
	
	@Query(
		    value = "SELECT COALESCE(SUM(requests), 0) FROM product",
		    nativeQuery = true)
		int findTotalRequests();
}
