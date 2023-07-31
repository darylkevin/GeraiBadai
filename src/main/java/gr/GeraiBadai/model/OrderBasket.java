package gr.GeraiBadai.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;

@Entity
public class OrderBasket {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long orderBasketId;	
	private String basketName;
	
	@ManyToMany
	@JoinTable(
			name = "ob-item-association",
			joinColumns = @JoinColumn(name = "order-basket-id"),
			inverseJoinColumns = @JoinColumn(name = "order-basket-item-id"))
	private Set<OrderBasketItem> orderBasketItems = new HashSet<> ();
	
	public OrderBasket() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getOrderBasketId() {
		return orderBasketId;
	}

	public void setOrderBasketId(long orderBasketId) {
		this.orderBasketId = orderBasketId;
	}

	public String getBasketName() {
		return basketName;
	}

	public void setBasketName(String basketName) {
		this.basketName = basketName;
	}

	public Set<OrderBasketItem> getOrderBasketItems() {
		return orderBasketItems;
	}

	public void setOrderBasketItems(Set<OrderBasketItem> orderBasketItems) {
		this.orderBasketItems = orderBasketItems;
	}


	
	
	
	
}
