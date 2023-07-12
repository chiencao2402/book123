package BookShop.Service;

import java.util.List;
import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import BookShop.Dao.CategoryDao;
import BookShop.Entity.Author;
import BookShop.Entity.Categorys;
import BookShop.Dao.ProductsDao;
import BookShop.Dto.ProductsDto;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductsDao productsDao;
	@Override
	public List<Categorys> GetDataCategory() {
		// TODO Auto-generated method stub
		return categoryDao.GetDataCategory();
	}

	@Override
	public int save(Categorys category) {
		// TODO Auto-generated method stub
		return categoryDao.save(category);
	}

	@Override
	public int update(Categorys category) {
		// TODO Auto-generated method stub
		return categoryDao.update(category);
	}



	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return categoryDao.delete(id);
	}
	
	public List<ProductsDto> GetAllProductsByID(int id) {
		return productsDao.GetAllProductsByID(id);
	}
	
	public List<ProductsDto> GetDataProductsPaginate(int id, int start, int totalPage) {
		return productsDao.GetDataProductsPaginate(id, start, totalPage);
	}
	

	
}

