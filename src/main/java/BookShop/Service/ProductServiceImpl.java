package BookShop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.AuthorDao;
import BookShop.Dao.CategoryDao;
import BookShop.Dao.ProductsDao;
import BookShop.Dto.ProductsDto;
import BookShop.Entity.Author;
import BookShop.Entity.Categorys;


@Service
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	ProductsDao productsDao = new ProductsDao();
	@Autowired
	CategoryDao categoryDao = new CategoryDao();
	@Autowired
	AuthorDao authorDao = new AuthorDao();

	public ProductsDto GetProductByID(long id) {
		List<ProductsDto> listProducts = productsDao.GetProductByID(id);
		return listProducts.get(0);
	}

	public List<ProductsDto> GetProductByIDCategory(int id) {
		return productsDao.GetAllProductsByID(id);
	}

	@Override
	public List<Author> GetDataAuthor() {
		List<Author> listAuthor = authorDao.GetDataAuthor();
		return listAuthor;
	}

	@Override
	public List<Categorys> GetDataCategory() {
		List<Categorys> listCategory = categoryDao.GetDataCategory();
		return listCategory;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return productsDao.delete(id);
	}

	public List<ProductsDto> GetDataProduct() {
	    return productsDao.GetDataProducts(); // Thay thế GetAllProducts() bằng phương thức thích hợp trong ProductsDao để truy xuất dữ liệu từ cơ sở dữ liệu
	}


	public int update(ProductsDto product) {
		// TODO Auto-generated method stub
		return productsDao.update(product);
		
	}

	public int save(ProductsDto product) {
		// TODO Auto-generated method stub
		return productsDao.save(product);
		
	}

}