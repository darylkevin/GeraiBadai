package gr.GeraiBadai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.OrderBasket;

@Repository
public interface OrderBasketRepo extends JpaRepository<OrderBasket, Long> {

	OrderBasket findByBasketName(String basketName);
}
