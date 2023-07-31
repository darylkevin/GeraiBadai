package gr.GeraiBadai.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gr.GeraiBadai.model.Category;
import gr.GeraiBadai.model.Product;
import gr.GeraiBadai.repository.CategoryRepo;

@Service
public class CategoryService {

	@Autowired
	CategoryRepo cateRepo;
	
	public boolean addNewCategory(Category category) {
		
		Optional<Category> categoryOptional = cateRepo.findByName(category.getName());
		
		if(categoryOptional.isEmpty()) {
			cateRepo.save(category);
			return true;
		} else return false;
		
	}

	public List<Category> getAllCategories() {
		// TODO Auto-generated method stub
		return cateRepo.findAll();
	}

	public Category findCategoryById(long categoryId) {
		// TODO Auto-generated method stub
		return cateRepo.findById(categoryId).get();
	}

	public void deleteCategoryById(long categoryId) {
		// TODO Auto-generated method stub
		Category category = findCategoryById(categoryId);
		cateRepo.delete(category);
	}

	public Category getCategoryByCategoryName(String categoryName) {
		// TODO Auto-generated method stub
		Optional<Category> category = cateRepo.findByName(categoryName);
		return category.get();
	}

	public void deductProductCountInCategory(Product product) {
		// TODO Auto-generated method stub
		
		Category category = product.getCategory();
		category.setProductCount(category.getProductCount() - 1);
		
		cateRepo.save(category);
	}

}
