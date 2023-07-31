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
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long productId;
	
	private LocalDateTime productCreationTime;
	private String name;
	
	@ManyToOne
	@JoinColumn(name = "FK_CATEGORY_ID")
	private Category category;
	
	@Column(length = 1000)
	private String description;
	private Double cost;
	private Double price;
	private String stock;
	private int requests;
	
	@ManyToOne
	@JoinColumn(name = "FK_TYPE_ID")
	private Type type;
	
	@ManyToOne
	@JoinColumn(name = "FK_STATUS_ID")
	private Status status;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
		this.productCreationTime = LocalDateTime.now(ZoneId.of("Asia/Hong_Kong")).withNano(0);
		this.stock = "Not Available";
		this.requests = 0;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public LocalDateTime getProductCreationTime() {
		return productCreationTime;
	}

	public void setProductCreationTime(LocalDateTime productCreationTime) {
		this.productCreationTime = productCreationTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public int getRequests() {
		return requests;
	}

	public void setRequests(int requests) {
		this.requests = requests;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}
	
}
