package gr.GeraiBadai.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderBasketItem {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long orderBasketItemId;

    @ManyToOne
    @JoinColumn(name = "FK_PRODUCT_ID")
    private Product product;

    private int quantity;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<OrderBasket> orderBaskets = new HashSet<>();

    public OrderBasketItem() {
        super();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getOrderBasketItemId() {
        return orderBasketItemId;
    }

    public void setOrderBasketItemId(long orderBasketItemId) {
        this.orderBasketItemId = orderBasketItemId;
    }

    public Set<OrderBasket> getOrderBaskets() {
        return orderBaskets;
    }

    public void setOrderBaskets(Set<OrderBasket> orderBaskets) {
        this.orderBaskets = orderBaskets;
    }
}