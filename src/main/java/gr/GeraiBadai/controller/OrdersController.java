package gr.GeraiBadai.controller;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.GeraiBadai.model.Category;
import gr.GeraiBadai.model.CollectionMethod;
import gr.GeraiBadai.model.OrderBasket;
import gr.GeraiBadai.model.OrderBasketItem;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.model.SalesOrder;
import gr.GeraiBadai.model.Status;
import gr.GeraiBadai.model.Type;
import gr.GeraiBadai.service.CategoryService;
import gr.GeraiBadai.service.CollectionMethodService;
import gr.GeraiBadai.service.OrderBasketItemService;
import gr.GeraiBadai.service.OrderBasketService;
import gr.GeraiBadai.service.ProductService;
import gr.GeraiBadai.service.SalesOrderService;
import gr.GeraiBadai.service.StatusService;
import gr.GeraiBadai.service.TypeService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/io")
public class OrdersController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private StatusService statusService;
	
	@Autowired
	private OrderBasketItemService orderBasketItemService;
	
	@Autowired 
	private SalesOrderService salesOrderService;
	
	@Autowired
	private OrderBasketService orderBasketService;
	
	@Autowired
	private CollectionMethodService collectionMethodService;
	

	@GetMapping("/view_orders")
	public String ioViewOrders(Model model) {
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
		model.addAttribute("orders", salesOrderService.getAllOrders());
		return "io/view-orders";
	}
	
	@PostMapping(path = "/view_orders", params = "select")
	public String ioAddOrders_SelectOrder(
			@RequestParam int orderState,
			Model model) {
		List<SalesOrder> orders = salesOrderService.getOrdersByState(orderState);
		
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
				
		if (orders.size() == 0) {
			model.addAttribute("orders", salesOrderService.getAllOrders());
			if (orderState == 0) model.addAttribute("noPendingOrders", "You have no pending orders.");
			else if (orderState == 1) model.addAttribute("noFulfilledOrders", "You have not fulfilled any orders yet.");
			else model.addAttribute("noCancelledOrders", "You have not cancelled any orders yet.");
			return "io/view-orders";
		}
		
		model.addAttribute("orderState", orderState);
		model.addAttribute("orders", salesOrderService.getOrdersByState(orderState));
		return "io/view-orders";
	}
	
	@PostMapping(path = "/view_orders/fulfil/{orderId}", params = "fulfil")
	public String ioAddOrders_FulfilOrder(
			@PathVariable ("orderId") long orderId, 
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		OrderBasket orderBasket = salesOrder.getOrderBasket();
		
		// Product Request Update - FULFIL SO CHECK
		long canBeFulfilled = salesOrderService.fulfilOrderCheck(orderBasket);
		
		if (canBeFulfilled == -1) {
			// Product Request Update - FULFIL SO
			salesOrderService.fulfilOrder(orderBasket, salesOrder);
			model.addAttribute("fulfilAcknowledgement","Successfully fulfilled order ID: " + orderId + " for " + salesOrder.getCustomerName() + ".");
			model.addAttribute("pendingCount", salesOrderService.getPendingCount());
			model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
			model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
			model.addAttribute("orders", salesOrderService.getAllOrders());
			
			return "io/view-orders";
		} else {
			model.addAttribute("notEnoughStockAcknowledgement", "Failed to fulfil order ID: " + orderId + ". You do not have enough stock for the product '" + productService.getProductById(canBeFulfilled).getName() + "'. Please add more stocks by editing it.");
			model.addAttribute("pendingCount", salesOrderService.getPendingCount());
			model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
			model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
			model.addAttribute("orders", salesOrderService.getAllOrders());
			
			return "io/view-orders";
		}
	}
	
	@PostMapping(path = "/view_orders/cancel/{orderId}", params = "cancel")
	public String ioAddOrders_CancelOrder(
			@PathVariable ("orderId") long orderId,
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		OrderBasket orderBasket = salesOrder.getOrderBasket();
		
		// Product Request Update - CANCEL SO
		salesOrderService.cancelOrder(orderBasket, salesOrder);
		
		model.addAttribute("cancelAcknowledgement", "Order ID: " + orderId + " has successfully been cancelled.");
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
		model.addAttribute("orders", salesOrderService.getAllOrders());
		
		return "io/view-orders";
	}
	
	@PostMapping(path = "/view_orders/delete/{orderId}", params = "delete")
	public String ioAddOrders_DeleteOrder(
			@PathVariable ("orderId") long orderId,
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		OrderBasket orderBasket = salesOrder.getOrderBasket();
		
		// Product Request Update - DELETE SO
		salesOrderService.deleteOrder(orderBasket, salesOrder);
		
		model.addAttribute("deleteAcknowledgement", "Deleted Order ID: " + orderId + ".");
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
		model.addAttribute("orders", salesOrderService.getAllOrders());
		
		return "io/view-orders";
	}
	
	@PostMapping(path = "/view_orders/edit/{orderId}", params = "edit")
	public String ioAddOrders_EditOrder(
			@PathVariable ("orderId") long orderId,
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		model.addAttribute("order", salesOrder);
		return "io/edit-order";
	}
	
	@PostMapping(path = "/view_orders/edit/{orderId}", params = "save_edit")
	public String ioAddOrders_SaveEditedOrder(
			@PathVariable ("orderId") long orderId,
			@RequestParam String customerName,
			@RequestParam String phoneNumber,
			@RequestParam String shippingAddress,
			@RequestParam String orderBasketName,
			@RequestParam String specialRequests,
			@RequestParam boolean cmBool,
			@RequestParam LocalDateTime collectionDate,
			@RequestParam Double amountPaid,
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		CollectionMethod collectionMethod = collectionMethodService.getCollectionMethodByBool(cmBool);
		
		// Retrieve order basket here instead from the service class to prevent the dependencies of some of the beans in the application context that form a cycle
		OrderBasket oldOrderBasket = salesOrder.getOrderBasket();
		OrderBasket newOrderBasket = orderBasketService.getOrderBasketByName(orderBasketName);
		
		// Product Request Update - EDIT SO
		if (shippingAddress.equals("")) shippingAddress="<PICK-UP IN STORE>";
		salesOrderService.editOrder(salesOrder, customerName, phoneNumber, shippingAddress, oldOrderBasket, newOrderBasket, specialRequests, collectionMethod, collectionDate, amountPaid);
		
		model.addAttribute("editAcknowledgement", "Successfully edited order ID: " + orderId + " for " + customerName + ".");
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
		model.addAttribute("orders", salesOrderService.getAllOrders());
		
		return "io/view-orders";
	}
	
	
	@PostMapping(path = "/view_orders/undo/{orderId}", params = "undo")
	public String ioAddOrders_UndoOrder(
			@PathVariable ("orderId") long orderId,
			Model model) {
		SalesOrder salesOrder = salesOrderService.getSalesOrderById(orderId);
		OrderBasket orderBasket = salesOrder.getOrderBasket();
		
		// Product Request Update - UNDO SO
		salesOrderService.undoOrder(orderBasket, salesOrder);
		
		model.addAttribute("pendingCount", salesOrderService.getPendingCount());
		model.addAttribute("fulfilledCount", salesOrderService.getFulfilledCount());
		model.addAttribute("cancelledCount", salesOrderService.getCancelledCount());
		model.addAttribute("orders", salesOrderService.getAllOrders());
		
		return "io/view-orders";
	}
	
	/**
	 * IO_NewOrders
	 * @return
	 */
	@GetMapping("/add_orders")
	public String ioAddOrders(Model model) {
		model.addAttribute("order", new SalesOrder());
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		return "io/add-orders";
	}
	
	@PostMapping("/add_orders")
	public String ioAddOrders_PushOrder(
			@RequestParam String orderBasketName,
			@RequestParam String shippingAddress,
			@RequestParam boolean cmBool,
			Model model,
			SalesOrder salesOrder) {
		
		OrderBasket orderBasket = orderBasketService.getOrderBasketByName(orderBasketName);
		CollectionMethod collectionMethod = collectionMethodService.getCollectionMethodByBool(cmBool);
		
		salesOrder.setOrderBasket(orderBasket);
		
		if (shippingAddress.equals("")) salesOrder.setShippingAddress("<PICK-UP IN STORE>");
		else salesOrder.setShippingAddress(shippingAddress); 

		salesOrder.setCollectionMethod(collectionMethod);
		
		salesOrderService.addNewOrder(salesOrder);
		
		// Product Request Update - ADD SO
		salesOrderService.ADD_SO_updateProductRequests(orderBasket);
		
		model.addAttribute("successMessage", "Order confirmed and added for " + salesOrder.getCustomerName() + " (ID: " + salesOrder.getOrderId() +  ").");
		model.addAttribute("order", new SalesOrder());
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		
		return "io/add-orders";
								
	}
	
	
	/**
	 * IO_OrderBaskets
	 * @return
	 */
	@GetMapping("/order_baskets")
	public String ioOrderBaskets(Model model) {
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		model.addAttribute("orderBasketsPrices", orderBasketService.getTotalPricesOfEachBasket());
		return "io/order-baskets";
	}
	
	@PostMapping(path = "/order_baskets/{orderBasketId}", params = "delete")
	public String ioOrderBaskets(
			@PathVariable("orderBasketId") long orderBasketId,
			Model model) {
		
		OrderBasket orderBasket = orderBasketService.getOrderBasketById(orderBasketId);
		
		// Product Request Update - Delete OB
		orderBasketService.DELETE_OB_updateProductRequests(orderBasket);
		salesOrderService.DELETE_OB_deleteRelatedSO(salesOrderService.getSalesOrdersWithGivenOrderBasket(orderBasket));
		orderBasketService.deleteOrderBasket(orderBasket);
		
		model.addAttribute("deleteMessage", "Successfully deleted " + orderBasket.getBasketName() + ".");
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		model.addAttribute("orderBasketsPrices", orderBasketService.getTotalPricesOfEachBasket());
		return "io/order-baskets";
	}
	
	@PostMapping("/order_baskets/edit/{orderBasketId}")
	public String ioEditBasket(
			@PathVariable("orderBasketId") long orderBasketId,
			HttpSession session,
			Model model) {
		
		OrderBasket orderBasket = orderBasketService.getOrderBasketById(orderBasketId);
		Set<OrderBasketItem> tempBasket = orderBasket.getOrderBasketItems();
		
		session.setAttribute("basketItems", tempBasket);
		
		model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("orderBasketName", orderBasket.getBasketName());
		model.addAttribute("orderBasketId", orderBasketId);
		model.addAttribute("basketItem", new OrderBasketItem());
		model.addAttribute("basketItems", tempBasket);
		
		return "io/edit-basket";
	}
	
	@PostMapping(path = "/order_baskets/edit/{orderBasketId}", params = "add_to_basket")
	public String ioEditBasket_AddToBasket(
			@PathVariable("orderBasketId") long orderBasketId,
			@RequestParam String productName,
			OrderBasketItem orderBasketItem,
			HttpSession session,
			Model model) {
		OrderBasket orderBasket = orderBasketService.getOrderBasketById(orderBasketId);
		orderBasketItem.setProduct(productService.getProductByName(productName));
		
		model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("basketItem", new OrderBasketItem());
		
		@SuppressWarnings("unchecked")
		Set<OrderBasketItem> tempBasket = (Set<OrderBasketItem>) session.getAttribute("basketItems");
		
		if (tempBasket == null) tempBasket = new HashSet<> ();
		
		for (OrderBasketItem obi : tempBasket) {
			if (obi.getProduct().getName().equals(orderBasketItem.getProduct().getName())) {
				model.addAttribute("duplicateError", orderBasketItem.getProduct().getName() + " has already existed in the basket.");
				model.addAttribute("basketItems", tempBasket);
				return "io/edit-basket";
			};
		}
		
		tempBasket.add(orderBasketItem);
		session.setAttribute("basketItems", tempBasket);

		model.addAttribute("successMessage", "Success adding " + orderBasketItem.getQuantity() + " quantit(ies) of " + orderBasketItem.getProduct().getName() + ".");
		model.addAttribute("orderBasketName", orderBasket.getBasketName());
		model.addAttribute("orderBasketId", orderBasketId);
		model.addAttribute("basketItems", tempBasket);

		return "io/edit-basket";
	}
	
	@PostMapping(path = "/order_baskets/edit/{orderBasketId}", params = "delete")
	public String ioEditBasket_DeleteFromBasket (
			@PathVariable("orderBasketId") long orderBasketId,
			@RequestParam String productName,
			OrderBasketItem orderBasketItem,
			HttpSession session,
			Model model) {
		
	    @SuppressWarnings("unchecked")
	    Set<OrderBasketItem> tempBasket = (Set<OrderBasketItem>) session.getAttribute("basketItems");
	    OrderBasket orderBasket = orderBasketService.getOrderBasketById(orderBasketId);
	    
	    if (tempBasket == null) tempBasket = new HashSet<> ();
	    
	    for (OrderBasketItem obi : tempBasket) {
	        if (obi.getProduct().getName().equals(productName)) {
	            tempBasket.remove(obi);
	            session.setAttribute("basketItems", tempBasket);
	            
	            model.addAttribute("deleteMessage", "Successfully deleted " + obi.getQuantity() + " quantit(ies) of " + obi.getProduct().getName() + ".");
	            model.addAttribute("orderBasketName", orderBasket.getBasketName());
	            model.addAttribute("products", productService.getAllProducts());
	    		model.addAttribute("basketItem", new OrderBasketItem());
	            model.addAttribute("basketItems", tempBasket);
	            return "io/edit-basket";
	        }
	    }

	    return "redirect:/io/edit_basket";
		
	}
	
	@PostMapping(path = "/order_baskets/edit/{orderBasketId}", params = "edit_basket")
	public String ioEditBasket_FinishedEditingBasket (
			@PathVariable ("orderBasketId") long orderBasketId,
			@RequestParam String basketName,
			HttpSession session, 
			Model model) {
		
	    @SuppressWarnings("unchecked")
	    Set<OrderBasketItem> tempBasket = (Set<OrderBasketItem>) session.getAttribute("basketItems");
	    
	    if (tempBasket == null) tempBasket = new HashSet<> ();
	    
	    if (tempBasket.size() == 0) {
	    	model.addAttribute("noItemsInside", "Please input some product(s) into the basket before creating one.");
            model.addAttribute("products", productService.getAllProducts());
            model.addAttribute("orderBasketName", basketName);
    		model.addAttribute("basketItem", new OrderBasketItem());
            model.addAttribute("basketItems", tempBasket);
            return "io/edit-basket";
	    }
	    
	    for (OrderBasket ob : orderBasketService.getAllBaskets()) {
	    	if (ob.getOrderBasketId() == orderBasketId) continue;
	    	else if (ob.getBasketName().toLowerCase().equals(basketName.toLowerCase())) {
	    		session.setAttribute("basketItems", tempBasket);
	    		
	            model.addAttribute("duplicateOrderBasket", basketName + " already exists. Please choose a different name.");
	            model.addAttribute("products", productService.getAllProducts());
	    		model.addAttribute("basketItem", new OrderBasketItem());
	            model.addAttribute("basketItems", tempBasket);
	            return "io/edit-basket";
	    	}
	    }
	    
	    OrderBasket oldOrderBasket = orderBasketService.getOrderBasketById(orderBasketId);
	    
	    // Perform deep copy of oldOrderBasket property
	    OrderBasket keepOldOrderBasket = new OrderBasket();
	    Set<OrderBasketItem> oldBasketItems = new HashSet<>(oldOrderBasket.getOrderBasketItems());
	    keepOldOrderBasket.setOrderBasketItems(oldBasketItems);
	    
	    oldOrderBasket.setBasketName(basketName);
	    
	    orderBasketService.editOrderBasketItems(oldOrderBasket, tempBasket);
	    
	    session.removeAttribute("basketItems");
	    tempBasket.clear();
	    
	    model.addAttribute("successEditingOrderBasket", basketName + "'s order basket has been successfully edited.");
		model.addAttribute("orderBaskets", orderBasketService.getAllBaskets());
		model.addAttribute("orderBasketsPrices", orderBasketService.getTotalPricesOfEachBasket());
		
		OrderBasket newOrderBasket = orderBasketService.getOrderBasketById(orderBasketId);

		// Product Request Update - EDIT OB
		orderBasketService.EDIT_OB_updateProductRequests(newOrderBasket, keepOldOrderBasket);
		
		return "io/order-baskets";
		
	}
	
	
	
	/**
	 * IO_NewBasket
	 * @return
	 */
	@GetMapping("/new_basket")
	public String ioNewBasket(HttpSession session, Model model) {
		HashSet<OrderBasketItem> tempBasket = new HashSet<> ();

		model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("basketItem", new OrderBasketItem());
		model.addAttribute("basketItems", tempBasket);
		
		session.removeAttribute("basketItems");
		
		return "io/new-basket";
	}
	
	@PostMapping(path = "/new_basket", params = "add_to_basket")
	public String ioNewBasket_AddToBasket(
			@RequestParam String productName,
			OrderBasketItem orderBasketItem,
			HttpSession session,
			Model model) {
		orderBasketItem.setProduct(productService.getProductByName(productName));
		
		model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("basketItem", new OrderBasketItem());
		
		@SuppressWarnings("unchecked")
		HashSet<OrderBasketItem> tempBasket = (HashSet<OrderBasketItem>) session.getAttribute("basketItems");
		
		if (tempBasket == null) tempBasket = new HashSet<> ();
		
		for (OrderBasketItem obi : tempBasket) {
			if (obi.getProduct().getName().equals(orderBasketItem.getProduct().getName())) {
				model.addAttribute("duplicateError", orderBasketItem.getProduct().getName() + " has already existed in the basket.");
				model.addAttribute("basketItems", tempBasket);
				return "io/new-basket";
			};
		}
		
		tempBasket.add(orderBasketItem);
		session.setAttribute("basketItems", tempBasket);

		model.addAttribute("successMessage", "Success adding " + orderBasketItem.getQuantity() + " quantit(ies) of " + orderBasketItem.getProduct().getName() + ".");
		model.addAttribute("basketItems", tempBasket);

		return "io/new-basket";
	}
	
	@PostMapping(path = "/new_basket", params = "delete")
	public String ioNewBasket_DeleteFromBasket(
	        @RequestParam String productName,
	        HttpSession session,
	        Model model) {
	    @SuppressWarnings("unchecked")
	    HashSet<OrderBasketItem> tempBasket = (HashSet<OrderBasketItem>) session.getAttribute("basketItems");

	    if (tempBasket == null) tempBasket = new HashSet<> ();
	    
	    for (OrderBasketItem obi : tempBasket) {
	        if (obi.getProduct().getName().equals(productName)) {
	            tempBasket.remove(obi);
	            session.setAttribute("basketItems", tempBasket);
	            
	            model.addAttribute("deleteMessage", "Successfully deleted " + obi.getQuantity() + " quantit(ies) of " + obi.getProduct().getName() + ".");
	            model.addAttribute("products", productService.getAllProducts());
	    		model.addAttribute("basketItem", new OrderBasketItem());
	            model.addAttribute("basketItems", tempBasket);
	            return "io/new-basket";
	        }
	    }

	    return "redirect:/io/new_basket";
	}
	
	@PostMapping(path = "/new_basket", params = "create_basket")
	public String ioNewBasket_CreateBasket(
			@RequestParam String basketName,
			HttpSession session, 
			Model model) {
	    @SuppressWarnings("unchecked")
	    HashSet<OrderBasketItem> tempBasket = (HashSet<OrderBasketItem>) session.getAttribute("basketItems");

	    if (tempBasket == null) tempBasket = new HashSet<> ();
	    
	    if (tempBasket.size() == 0) {
	    	model.addAttribute("noItemsInside", "Please input some product(s) into the basket before creating one.");
            model.addAttribute("products", productService.getAllProducts());
    		model.addAttribute("basketItem", new OrderBasketItem());
            model.addAttribute("basketItems", tempBasket);
            return "io/new-basket";
	    }
	    
	    for (OrderBasket ob : orderBasketService.getAllBaskets()) {
	    	if (ob.getBasketName().toLowerCase().equals(basketName.toLowerCase())) {
	            model.addAttribute("duplicateOrderBasket", basketName + " already exists. Please choose a different name.");
	            model.addAttribute("products", productService.getAllProducts());
	    		model.addAttribute("basketItem", new OrderBasketItem());
	            model.addAttribute("basketItems", tempBasket);

	            return "io/new-basket";
	    	}
	    }
	    
	    OrderBasket orderBasket = new OrderBasket();
	    orderBasket.setBasketName(basketName);
	    
	    orderBasketService.addOrderBasketItems(orderBasket, tempBasket);
	    
	    session.removeAttribute("basketItems");
	    tempBasket.clear();
	    
	    model.addAttribute("successAddingOrderBasket", basketName + "'s order basket has been successfully saved.");
        model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("basketItem", new OrderBasketItem());
        model.addAttribute("basketItems", tempBasket);

	    return "io/new-basket"; 
	    
	}
		
}
