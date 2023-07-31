package gr.GeraiBadai.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.CollectionMethod;
import gr.GeraiBadai.model.OrderBasket;
import gr.GeraiBadai.model.OrderBasketItem;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.model.SalesOrder;
import gr.GeraiBadai.repository.OrderBasketItemRepo;
import gr.GeraiBadai.repository.OrderBasketRepo;
import gr.GeraiBadai.repository.ProductRepo;
import gr.GeraiBadai.repository.SalesOrderRepo;

@Service
public class SalesOrderService {

	@Autowired
	ProductRepo productRepo;

	@Autowired
	SalesOrderRepo salesOrderRepo;
	
	@Autowired
	OrderBasketRepo orderBasketRepo;
	
	@Autowired
	OrderBasketItemRepo orderBasketItemRepo;

	public List<SalesOrder> getAllOrders() {
		// TODO Auto-generated method stub
		return salesOrderRepo.findAll();
	}

	public List<SalesOrder> getOrdersByState(int orderState) {
		// TODO Auto-generated method stub
		if (orderState == -1)
			return salesOrderRepo.findAll();

		List<SalesOrder> ordersWithGivenOrderState = new ArrayList<>();

		for (SalesOrder so : salesOrderRepo.findAll()) {
			if (so.getOrderState() == orderState)
				ordersWithGivenOrderState.add(so);
		}

		return ordersWithGivenOrderState;
	}

	public void addNewOrder(SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		salesOrderRepo.save(salesOrder);
	}

	// Product Request Update - Add SO
	public void ADD_SO_updateProductRequests(OrderBasket orderBasket) {
		// TODO Auto-generated method stub
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product productToAdd = obi.getProduct();
			productToAdd.setRequests(productToAdd.getRequests() + obi.getQuantity());
			productRepo.save(productToAdd);
		}

	}

	public List<SalesOrder> getSalesOrdersWithGivenOrderBasket(OrderBasket orderBasket) {
		// TODO Auto-generated method stub
		List<SalesOrder> salesOrdersWithGivenOrderBasket = new ArrayList<>();

		for (SalesOrder so : salesOrderRepo.findAll()) {
			if (so.getOrderBasket().equals(orderBasket))
				salesOrdersWithGivenOrderBasket.add(so);
		}

		return salesOrdersWithGivenOrderBasket;
	}

	
	  public void DELETE_OB_deleteRelatedSO(List<SalesOrder> salesOrdersWithGivenOrderBasket) { 
		  // TODO Auto-generated method stub
		  for (SalesOrder so : salesOrdersWithGivenOrderBasket) {
			  salesOrderRepo.delete(so); 
		  } 
	  }
	 

	public SalesOrder getSalesOrderById(long orderId) {
		// TODO Auto-generated method stub
		return salesOrderRepo.findById(orderId).get();
	}

	// This function only counts the sales orders that are pending (i.e. not fulfilled or cancelled)
	public int getCountOfSalesOrdersWithGivenOrderBasket(OrderBasket orderBasket) {
		int countOfPendingSOWithGivenOB = 0;
		
		for (SalesOrder so : this.getSalesOrdersWithGivenOrderBasket(orderBasket)) {
			if (so.getOrderState() == 0) countOfPendingSOWithGivenOB ++;
		}
		
		return countOfPendingSOWithGivenOB;
		
	}

	// Product Request Update - FULFIL SO CHECK
	public long fulfilOrderCheck(OrderBasket orderBasket) {
		// TODO Auto-generated method stub
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product product = obi.getProduct();

			if (product.getType().isOnDemand() == true)
				continue;
			else {
				if (Integer.parseInt(product.getStock()) >= obi.getQuantity())
					continue;
				else
					return product.getProductId();
			}
		}

		return -1;
	}

	// Product Request Update - FULFIL SO
	public void fulfilOrder(OrderBasket orderBasket, SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product product = obi.getProduct();

			if (product.getType().isOnDemand() == true)
				product.setRequests(product.getRequests() - obi.getQuantity());
			else {
				Integer currentStock = Integer.parseInt(product.getStock());
				product.setStock(Integer.toString(currentStock - obi.getQuantity()));
				product.setRequests(product.getRequests() - obi.getQuantity());
			}

			productRepo.save(product);
		}

		salesOrder.setOrderState(1);
		salesOrderRepo.save(salesOrder);
	}
	
	// Product Request Update - CANCEL SO
	public void cancelOrder(OrderBasket orderBasket, SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product product = obi.getProduct();
			
			product.setRequests(product.getRequests() - obi.getQuantity());
			productRepo.save(product);
		}
		
		salesOrder.setOrderState(2);
		salesOrderRepo.save(salesOrder);
	}
	
	// Product Request Update - DELETE SO
	public void deleteOrder(OrderBasket orderBasket, SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
			Product product = obi.getProduct();
			
			product.setRequests(product.getRequests() - obi.getQuantity());
			productRepo.save(product);
		}
		
		salesOrderRepo.delete(salesOrder);
	}
	
	// Product Request Update - UNDO SO
	public void undoOrder(OrderBasket orderBasket, SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		if (salesOrder.getOrderState() == 1) {
			for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
				Product product = obi.getProduct();

				if (product.getType().isOnDemand() == true)
					product.setRequests(product.getRequests() + obi.getQuantity());
				else {
					Integer currentStock = Integer.parseInt(product.getStock());
					product.setStock(Integer.toString(currentStock + obi.getQuantity()));
					product.setRequests(product.getRequests() + obi.getQuantity());
				}

				productRepo.save(product);
			}

			salesOrder.setOrderState(0);
			salesOrderRepo.save(salesOrder);
		}
		
		else {
			for (OrderBasketItem obi : orderBasket.getOrderBasketItems()) {
				Product product = obi.getProduct();
				
				product.setRequests(product.getRequests() + obi.getQuantity());
				productRepo.save(product);
			}
			
			salesOrder.setOrderState(0);
			salesOrderRepo.save(salesOrder);
		}
	}
	
	// Product Request Update - EDIT SO
	public void editOrder(SalesOrder salesOrder, String customerName, String phoneNumber, String shippingAddress, OrderBasket oldOrderBasket, OrderBasket newOrderBasket,
			String specialRequests, CollectionMethod collectionMethod, LocalDateTime collectionDate, Double amountPaid) {
		// TODO Auto-generated method stub
		salesOrder.setCustomerName(customerName);
		salesOrder.setPhoneNumber(phoneNumber);
		salesOrder.setShippingAddress(shippingAddress);
		salesOrder.setSpecialRequests(specialRequests);
		salesOrder.setCollectionMethod(collectionMethod);
		salesOrder.setCollectionPeriod(collectionDate);
		salesOrder.setAmountPaid(amountPaid);
		
		if (!oldOrderBasket.equals(newOrderBasket)) {
			for (OrderBasketItem obi : oldOrderBasket.getOrderBasketItems()) {
				Product productToDeduct = obi.getProduct();
				productToDeduct.setRequests(productToDeduct.getRequests() - obi.getQuantity());
				productRepo.save(productToDeduct);
			}
			
			for (OrderBasketItem obi : newOrderBasket.getOrderBasketItems()) {
				Product productToAdd = obi.getProduct();
				productToAdd.setRequests(productToAdd.getRequests() + obi.getQuantity());
				productRepo.save(productToAdd);
			}
			
			salesOrder.setOrderBasket(newOrderBasket);
		}
		salesOrderRepo.save(salesOrder);
	}
	
	public List<SalesOrder> getSalesOrdersFromProduct(Product product) {
		// TODO Auto-generated method stub
		List<SalesOrder> salesOrdersFromProduct = new ArrayList<> ();
		
		for (SalesOrder so : this.getAllOrders()) {
			for (OrderBasketItem obi : so.getOrderBasket().getOrderBasketItems()) {
				if (obi.getProduct().equals(product)) salesOrdersFromProduct.add(so);
			}
		}
		
		return salesOrdersFromProduct;
	}
	
	public void cascadeDeleteForSOWithProduct(List<SalesOrder> salesOrdersFromProduct, Product product) {
		// TODO Auto-generated method stub
		List<OrderBasket> OBsToDelete = new ArrayList<> ();
		
		for (SalesOrder so : salesOrdersFromProduct) {
			OrderBasket ob = so.getOrderBasket();
			List<OrderBasketItem> OBIs = new ArrayList<> (ob.getOrderBasketItems());
			
			for (OrderBasketItem obi : OBIs) {
				if (obi.getProduct().equals(product)) {
					obi.getOrderBaskets().remove(ob);
					ob.getOrderBasketItems().remove(obi);
					orderBasketRepo.save(ob);
					orderBasketItemRepo.delete(obi);
				}
			} 
			
			if (ob.getOrderBasketItems().size() == 0) {
				salesOrderRepo.delete(so);
				OBsToDelete.add(ob);
			}
			
			else orderBasketRepo.save(ob);
		}
		
		for (OrderBasket ob : OBsToDelete) orderBasketRepo.delete(ob);
	}

	public int getPendingCount() {
		// TODO Auto-generated method stub
		return salesOrderRepo.findCountOfPendingOrders();
	}

	public int getFulfilledCount() {
		// TODO Auto-generated method stub
		return salesOrderRepo.findCountOfFulfilledOrders();
	}

	public int getCancelledCount() {
		// TODO Auto-generated method stub
		return salesOrderRepo.findCountOfCancelledOrders();
	}












}
