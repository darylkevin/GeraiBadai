package gr.GeraiBadai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.SalesOrder;

@Repository
public interface SalesOrderRepo extends JpaRepository<SalesOrder, Long> {

	@Query(
		    value = "SELECT COALESCE(COUNT(order_state), 0) FROM sales_order WHERE order_state = 0",
		    nativeQuery = true)
		int findCountOfPendingOrders();
	
	@Query(
		    value = "SELECT COALESCE(COUNT(order_state), 0) FROM sales_order WHERE order_state = 1",
		    nativeQuery = true)    
		int findCountOfFulfilledOrders();
	
	@Query(
		    value = "SELECT COALESCE(COUNT(order_state), 0) FROM sales_order WHERE order_state = 2",
		    nativeQuery = true)
		int findCountOfCancelledOrders();
}
