package gr.GeraiBadai.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gr.GeraiBadai.model.Category;
import gr.GeraiBadai.model.OrderBasket;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.model.SalesOrder;
import gr.GeraiBadai.model.Status;
import gr.GeraiBadai.model.Type;
import gr.GeraiBadai.service.CategoryService;
import gr.GeraiBadai.service.OrderBasketService;
import gr.GeraiBadai.service.ProductService;
import gr.GeraiBadai.service.SalesOrderService;
import gr.GeraiBadai.service.StatusService;
import gr.GeraiBadai.service.TypeService;

@Controller
@RequestMapping("/mp")
public class ProductsController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private StatusService statusService;
	
	@Autowired
	private OrderBasketService orderBasketService;
	
	@Autowired
	private SalesOrderService salesOrderService;

	/**
	 * MP_CurrentListings
	 * @return
	 */
	@GetMapping("/current_listings")
	public String mpListings(Model model) {
		model.addAttribute("liveCount", productService.getLiveCounts());
		model.addAttribute("privateCount", productService.getPrivateCounts());
		model.addAttribute("requests", productService.getRequests());
		model.addAttribute("products", productService.getAllProducts());
		return "mp/current-listings";
	}
	
	@PostMapping("/current_listings/edit/{productId}")
	public String mpEditProducts(
			@PathVariable("productId") long productId,
			Model model) {
		Product product = productService.getProductById(productId);
		
		model.addAttribute("product", product);
		model.addAttribute("categories", categoryService.getAllCategories());
		
		return "mp/edit-products";
	}
	
	@PostMapping(path = "/current_listings/{productId}", params = "edit")
	public String mpProducts(
			@PathVariable("productId") long productId,
			@RequestParam String name,
			@RequestParam String categoryName,
			@RequestParam String description,
			@RequestParam Double cost,
			@RequestParam Double price,
			@RequestParam boolean typeBool,
			@RequestParam boolean statusBool,
			@RequestParam String stock,
			Model model) {
		Product oldProduct = productService.getProductById(productId);
		
		Category oldCategory = productService.getProductById(productId).getCategory();
		oldCategory.setProductCount(oldCategory.getProductCount() - 1);
		
		Category category = categoryService.getCategoryByCategoryName(categoryName);
		category.setProductCount(category.getProductCount() + 1);
		
		int requests = oldProduct.getRequests();
		
		Type type = typeService.getTypeByBool(typeBool);
		Status status = statusService.getStatusByBool(statusBool);
		
		Product product = productService.setNewDetails(new Product(), productId, name, category, description, cost, price, type, status, stock, requests);
		
		Long duplicateEntry = productService.editProduct(product, oldProduct);

		if (duplicateEntry == -1) {
			productService.saveExistingProductWithNewDetails(product);
			model.addAttribute("editAcknowledgement", "'" + product.getName() + "' details have been successfully edited.");
			model.addAttribute("products", productService.getAllProducts());
		} else if (duplicateEntry == 0) {
			model.addAttribute("products", productService.getAllProducts());
		}
		else {
			model.addAttribute("product", productService.getProductById(productId));
			model.addAttribute("categories", categoryService.getAllCategories());
			model.addAttribute("editFailed", "You already have a product named '" + product.getName() + "'.");
			return "mp/edit-products";
		}
		
		model.addAttribute("liveCount", productService.getLiveCounts());
		model.addAttribute("privateCount", productService.getPrivateCounts());
		model.addAttribute("requests", productService.getRequests());
		
		return "mp/current-listings";
	}

	@PostMapping(path = "/current_listings/{productId}", params = "delete")
	public String mpProducts(
			@PathVariable("productId") long productId,
			Model model) {
		
		Product product = productService.getProductById(productId);
		categoryService.deductProductCountInCategory(product);
		
		List<SalesOrder> salesOrdersFromProduct = salesOrderService.getSalesOrdersFromProduct(product);
		List<OrderBasket> orderBasketsFromProduct = orderBasketService.getOrderBasketsFromProduct(product);
		
		if (salesOrdersFromProduct.size() > 0 ) {
			// Cascading Delete - DELETE PRODUCT AFFECT SALES ORDERS
			salesOrderService.cascadeDeleteForSOWithProduct(salesOrdersFromProduct, product);
		}
		
		if (orderBasketsFromProduct.size() > 0) {
			// Cascading Delete - DELETE PRODUCT AFFECT ORDER BASKETS
			orderBasketService.cascadeDeleteForOBWithProduct(orderBasketsFromProduct, product);	
		}
		
		productService.deleteProductById(productId);
		model.addAttribute("products", productService.getAllProducts());
		model.addAttribute("deleteAcknowledgement", product.getName() + " has been successfully deleted.");
		
		model.addAttribute("liveCount", productService.getLiveCounts());
		model.addAttribute("privateCount", productService.getPrivateCounts());
		model.addAttribute("requests", productService.getRequests());
		
		return "mp/current-listings"; 
	}
	
	/**
	 * MP_AddProducts
	 * @return
	 */
	@GetMapping("/add_products")
	public String mpProducts(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryService.getAllCategories());
		return "mp/add-products";
	}
	
	@PostMapping(path = "/add_products", params = "create")
	public String mpProducts(
			@RequestParam String categoryName,
			@RequestParam boolean typeBool,
			@RequestParam boolean statusBool,
			Model model, 
			Product product) {
		
		Category category = categoryService.getCategoryByCategoryName(categoryName);
		category.setProductCount(category.getProductCount() + 1);
		
		Type type = typeService.getTypeByBool(typeBool);
		Status status = statusService.getStatusByBool(statusBool);
		
		product.setCategory(category);
		product.setType(type);
		product.setStatus(status);
		
		Long duplicateEntry = productService.addNewProduct(product);
		
		if (duplicateEntry == -1) {
			model.addAttribute("product", new Product());
			model.addAttribute("successMessage", product.getName() + " added!");
			model.addAttribute("categories", categoryService.getAllCategories());
			return "mp/add-products";
		}
		else {
			model.addAttribute("duplicateError", "You already have a product named '" + product.getName() + "'.");
			model.addAttribute("categories", categoryService.getAllCategories());
			return "mp/add-products";
		}
	}
	
	/**
	 * MP_SetCategories
	 * @param model
	 * @return
	 */
	@GetMapping("/set_categories")
	public String mpCategories(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categories", categoryService.getAllCategories());
		return "mp/set-categories";
	}
	
	@PostMapping(path = "/set_categories", params = "create")
	public String mpAddCategory(Model model, Category category) {
		if (categoryService.addNewCategory(category)) {
			model.addAttribute("successMessage", category.getName() + " added!");
			model.addAttribute("categories", categoryService.getAllCategories());
			return "mp/set-categories";
		}
		else {
			model.addAttribute("duplicateError", category.getName() + " already exists!");
			model.addAttribute("categories", categoryService.getAllCategories());
			return "mp/set-categories";
		}
	}
	
	@PostMapping(path = "/set_categories/{categoryId}", params = "delete")
	public String mpDelCategory(
			@PathVariable("categoryId") long categoryId, 
			Model model, 
			Category category) {
		Category delCat = categoryService.findCategoryById(categoryId);
		
		productService.deleteSOByProduct(delCat);
		orderBasketService.deleteOBByProduct(delCat);
		
		categoryService.deleteCategoryById(categoryId);
		model.addAttribute("categories", categoryService.getAllCategories());
		model.addAttribute("deleteMessage", delCat.getName() + " deleted.");
		return "mp/set-categories";
	}
	
	
		
}
