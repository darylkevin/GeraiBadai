package gr.GeraiBadai.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import gr.GeraiBadai.model.OrderBasketItem;

@Repository
public interface OrderBasketItemRepo extends JpaRepository<OrderBasketItem, Long> {

}
