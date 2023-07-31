package gr.GeraiBadai.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.Category;
import gr.GeraiBadai.model.OrderBasket;
import gr.GeraiBadai.model.OrderBasketItem;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.model.SalesOrder;
import gr.GeraiBadai.repository.OrderBasketItemRepo;
import gr.GeraiBadai.repository.OrderBasketRepo;
import gr.GeraiBadai.repository.ProductRepo;
import gr.GeraiBadai.repository.SalesOrderRepo;

@Service
public class OrderBasketService {

	@Autowired
	ProductRepo productRepo;
	
	@Autowired
	OrderBasketRepo orderBasketRepo;
	
	@Autowired
	OrderBasketItemRepo orderBasketItemRepo;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	SalesOrderService salesOrderService;
	
	public OrderBasket getOrderBasketByName(String basketName) {
		// TODO Auto-generated method stub
		return orderBasketRepo.findByBasketName(basketName);		
	}

	public List<OrderBasket> getAllBaskets() {
		// TODO Auto-generated method stub
		return orderBasketRepo.findAll();
	}

	public void addOrderBasketItems(OrderBasket orderBasket, HashSet<OrderBasketItem> tempBasket) {
		// TODO Auto-generated method stub
		// Prevents transient object exception
		orderBasketRepo.save(orderBasket);
		
		for (OrderBasketItem obi : tempBasket) {
			OrderBasketItem newObi = new OrderBasketItem();
			newObi.setProduct(obi.getProduct());
			newObi.setQuantity(obi.getQuantity());
			
			orderBasketItemRepo.save(newObi);
			orderBasket.getOrderBasketItems().add(newObi);
			newObi.getOrderBaskets().add(orderBasket);
		}
		
		orderBasketRepo.save(orderBasket);
	}

	public OrderBasket getOrderBasketById(long orderBasketId) {
		// TODO Auto-generated method stub
		return orderBasketRepo.findById(orderBasketId).get();
	}

	public void deleteOrderBasket(OrderBasket orderBasket) {
	    Set<OrderBasketItem> orderBasketItemsCopy = new HashSet<>(orderBasket.getOrderBasketItems());
	    for (OrderBasketItem obi : orderBasketItemsCopy) {
	        obi.getOrderBaskets().remove(orderBasket);
	        orderBasket.getOrderBasketItems().remove(obi);
	        orderBasketItemRepo.delete(obi);
	    }
	    orderBasketRepo.delete(orderBasket);
	}
	
	public List<String> getTotalPricesOfEachBasket() {
		// TODO Auto-generated method stub
		List<String> totalPricesOfEachBasket = new ArrayList<> ();
		
		for (OrderBasket ob : this.getAllBaskets()) {
			Double totalPrices = 0.0;
			
			for (OrderBasketItem obi : ob.getOrderBasketItems()) {
				totalPrices = totalPrices + obi.getProduct().getPrice() * obi.getQuantity();
			}
			
			String formattedPrice = String.format("%,.2f", totalPrices);
			
			totalPricesOfEachBasket.add(formattedPrice);
		}
		return totalPricesOfEachBasket;
	}

	public void editOrderBasketItems(OrderBasket orderBasket, Set<OrderBasketItem> tempBasket) {
		// TODO Auto-generated method stub
		// Create a copy to prevent concurrent modification
		List<OrderBasketItem> orderBasketItemsCopy = new ArrayList<>(orderBasket.getOrderBasketItems());
		for (OrderBasketItem obi : orderBasketItemsCopy) {
		    obi.getOrderBaskets().remove(orderBasket);
		    orderBasket.getOrderBasketItems().remove(obi);
		    orderBasketItemRepo.delete(obi);
		}

		orderBasketRepo.save(orderBasket);
		
		for (OrderBasketItem obi : tempBasket) {
			OrderBasketItem newObi = new OrderBasketItem();
			newObi.setProduct(obi.getProduct());
			newObi.setQuantity(obi.getQuantity());
			
		    orderBasketItemRepo.save(newObi);
		    orderBasket.getOrderBasketItems().add(newObi);
		    newObi.getOrderBaskets().add(orderBasket);
		}

		orderBasketRepo.save(orderBasket);
	}

	// Product Request Update - Edit OB
	public void EDIT_OB_updateProductRequests(OrderBasket orderBasketNew, OrderBasket orderBasketOld) {
		// TODO Auto-generated method stub
		int countOfSOWithThisOB = salesOrderService.getCountOfSalesOrdersWithGivenOrderBasket(orderBasketNew);
		
		for (OrderBasketItem obi : orderBasketOld.getOrderBasketItems()) {
			Product productToDeduct = obi.getProduct();
			productToDeduct.setRequests(productToDeduct.getRequests() - (obi.getQuantity() * countOfSOWithThisOB));
			productRepo.save(productToDeduct);
		}
		
		for (OrderBasketItem obi : orderBasketNew.getOrderBasketItems()) {
			Product productToAdd = productService.getProductByName(obi.getProduct().getName());
			productToAdd.setRequests(productToAdd.getRequests() + (obi.getQuantity() * countOfSOWithThisOB));
			productRepo.save(productToAdd);
		}
	}

	// Product Request Update - Delete OB
	public void DELETE_OB_updateProductRequests(OrderBasket orderBasket) {
		// TODO Auto-generated method stub
		int countOfSOWithThisOB = salesOrderService.getCountOfSalesOrdersWithGivenOrderBasket(orderBasket);
		
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product productToDeduct = obi.getProduct();
			productToDeduct.setRequests(productToDeduct.getRequests() - (obi.getQuantity() * countOfSOWithThisOB));
			productRepo.save(productToDeduct);
		}
	}

	public List<OrderBasket> getOrderBasketsFromProduct(Product product) {
		// TODO Auto-generated method stub
		List<OrderBasket> orderBasketsFromProduct = new ArrayList<> ();
		
		for (OrderBasket ob : this.getAllBaskets()) {
			for (OrderBasketItem obi : ob.getOrderBasketItems()) {
				if (obi.getProduct().equals(product)) orderBasketsFromProduct.add(ob);
			}
		}
		return orderBasketsFromProduct;
	}

	public void cascadeDeleteForOBWithProduct(List<OrderBasket> orderBasketsFromProduct, Product product) {
		// TODO Auto-generated method stub
		for (OrderBasket ob : orderBasketsFromProduct) {
			List<OrderBasketItem> OBIs = new ArrayList<> (ob.getOrderBasketItems());
			
			for (OrderBasketItem obi : OBIs) {
				if (obi.getProduct().equals(product)) {
					obi.getOrderBaskets().remove(ob);
					ob.getOrderBasketItems().remove(obi);
					orderBasketRepo.save(ob);
					orderBasketItemRepo.delete(obi);
				}
			} 
			
			if (ob.getOrderBasketItems().size() == 0) orderBasketRepo.delete(ob);
			else orderBasketRepo.save(ob);
		}
	}

	public void deleteOBByProduct(Category delCat) {
		// TODO Auto-generated method stub
		for (Product product : productService.getAllProducts()) {
			if (product.getCategory().equals(delCat)) {
				List<OrderBasket> orderBasketsFromProduct = this.getOrderBasketsFromProduct(product);
				if (orderBasketsFromProduct.size() > 0) {
					// Cascading Delete - DELETE PRODUCT
					this.cascadeDeleteForOBWithProduct(orderBasketsFromProduct, product);
				}
				
				productRepo.delete(product);
			}
		}
	}


}
