package gr.GeraiBadai.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.OrderBasket;
import gr.GeraiBadai.model.OrderBasketItem;
import gr.GeraiBadai.repository.OrderBasketItemRepo;
import gr.GeraiBadai.repository.OrderBasketRepo;
import gr.GeraiBadai.repository.ProductRepo;

@Service
public class OrderBasketItemService {

	@Autowired
	ProductRepo productRepo;
	
	@Autowired
	OrderBasketItemRepo orderBasketItemRepo;
	
	@Autowired
	OrderBasketService orderBasketService;

	public void addOrderBasketItem(OrderBasketItem orderBasketItem) {
		// TODO Auto-generated method stub
		orderBasketItemRepo.save(orderBasketItem);
	}

	public void deleteOrderBasketItem(OrderBasketItem obi, long orderBasketId) {
		// TODO Auto-generated method stub
		OrderBasket orderBasket = orderBasketService.getOrderBasketById(orderBasketId);
		
		orderBasket.getOrderBasketItems().remove(obi);
		obi.getOrderBaskets().remove(orderBasket);
		orderBasketItemRepo.delete(obi);
	}



	
}
