package gr.GeraiBadai.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.Category;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.model.SalesOrder;
import gr.GeraiBadai.model.Status;
import gr.GeraiBadai.model.Type;
import gr.GeraiBadai.repository.ProductRepo;

@Service
public class ProductService {

	@Autowired
	ProductRepo productRepo;
	
	@Autowired
	SalesOrderService salesOrderService;

	public long addNewProduct(Product product) {
		// TODO Auto-generated method stub
		Optional<Product> productOptional = productRepo.findByName(product.getName());
		
		if (productOptional.isEmpty()) {
			productRepo.save(product);
			return -1;
		} else return productOptional.get().getProductId();
		
	}

	public Product getProductByName(String productName) {
		// TODO Auto-generated method stub
		Optional<Product> product = productRepo.findByName(productName);
		return product.get();
	}
	
	public long editProduct(Product product, Product oldProduct) {
		// TODO Auto-generated method stub
		List<Product> products = this.getAllProducts();
		
		if (
				oldProduct.getName().equals(product.getName()) &&
				oldProduct.getCategory().equals(product.getCategory()) &&
				oldProduct.getDescription().equals(product.getDescription()) &&
				oldProduct.getCost().equals(product.getCost()) &&
				oldProduct.getPrice().equals(product.getPrice()) &&
				oldProduct.getType().equals(product.getType()) &&
				oldProduct.getStatus().equals(product.getStatus()) &&
				oldProduct.getStock().equals(product.getStock())) return 0;

		for (Product p : products) {
			if (p.getProductId() == product.getProductId()) continue;
			else {
				if (p.getName().equals(product.getName())) return p.getProductId();
				else continue;
			}}

		return -1;
	}
	
	public Product setNewDetails(Product product, long productId, String name, Category category, String description, Double cost,
			Double price, Type type, Status status, String stock, int requests) {
		// TODO Auto-generated method stub
		product.setProductId(productId);
		product.setName(name);
		product.setCategory(category);
		product.setDescription(description);
		product.setCost(cost);
		product.setPrice(price);
		product.setType(type);
		product.setStatus(status);
		product.setStock(stock);
		product.setRequests(requests);
		return product;
	}
	
	public void saveExistingProductWithNewDetails(Product product) {
		// TODO Auto-generated method stub
		productRepo.save(product);
	}
	
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return productRepo.findAll();
	}

	public void deleteProductById(long productId) {
		// TODO Auto-generated method stub
		productRepo.deleteById(productId);
	}

	public Product getProductById(long productId) {
		// TODO Auto-generated method stub
		return productRepo.getReferenceById(productId);
	}

	public void deleteSOByProduct(Category delCat) {
		// TODO Auto-generated method stub

		for (Product product : this.getAllProducts()) {
			if (product.getCategory().equals(delCat)) {
				List<SalesOrder> salesOrdersFromProduct = salesOrderService.getSalesOrdersFromProduct(product);
				if (salesOrdersFromProduct.size() > 0) {
					// Cascading Delete - DELETE PRODUCT
					salesOrderService.cascadeDeleteForSOWithProduct(salesOrdersFromProduct, product);
				}
			}
		}
	}
	
	public int getLiveCounts() {
		// TODO Auto-generated method stub
		return productRepo.findCountOfLiveProducts();
	}

	public int getPrivateCounts() {
		// TODO Auto-generated method stub
		return productRepo.findCountOfPrivateProducts();
	}

	public int getRequests() {
		// TODO Auto-generated method stub
		return productRepo.findTotalRequests();
	}









	
}
