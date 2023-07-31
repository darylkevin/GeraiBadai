package gr.GeraiBadai.model;

import java.time.LocalDateTime;
import java.time.ZoneId;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class SalesOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long orderId;
	
	private LocalDateTime orderCreationTime;
	private String customerName;
	private String phoneNumber;
	
	@Column(length = 1000)
	private String shippingAddress;
	
	@ManyToOne
	@JoinColumn(name = "FK_ORDER_BASKET_ID")
	private OrderBasket orderBasket;
	
	@Column(length = 1000)
	private String specialRequests;
	
	@ManyToOne
	@JoinColumn(name = "FK_COLLECTION_METHOD_ID")
	private CollectionMethod collectionMethod;
	private LocalDateTime collectionPeriod;
	private Double amountPaid;
	private int orderState;
	
	public SalesOrder() {
		super();
		this.orderCreationTime = LocalDateTime.now(ZoneId.of("Asia/Hong_Kong")).withNano(0);
		this.orderState = 0;
		// TODO Auto-generated constructor stub
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	
	public LocalDateTime getOrderCreationTime() {
		return orderCreationTime;
	}
	public void setOrderCreationTime(LocalDateTime orderCreationTime) {
		this.orderCreationTime = orderCreationTime;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public OrderBasket getOrderBasket() {
		return orderBasket;
	}
	public void setOrderBasket(OrderBasket orderBasket) {
		this.orderBasket = orderBasket;
	}
	public String getSpecialRequests() {
		return specialRequests;
	}
	public void setSpecialRequests(String specialRequests) {
		this.specialRequests = specialRequests;
	}
	
	public LocalDateTime getCollectionPeriod() {
		return collectionPeriod;
	}
	public void setCollectionPeriod(LocalDateTime collectionPeriod) {
		this.collectionPeriod = collectionPeriod;
	}
	public CollectionMethod getCollectionMethod() {
		return collectionMethod;
	}
	public void setCollectionMethod(CollectionMethod collectionMethod) {
		this.collectionMethod = collectionMethod;
	}
	public Double getAmountPaid() {
		return amountPaid;
	}
	public void setAmountPaid(Double amountPaid) {
		this.amountPaid = amountPaid;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	
	
	
	
}
