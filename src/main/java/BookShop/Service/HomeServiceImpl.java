package BookShop.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.CategoryDao;
import BookShop.Dao.MenuDao;
import BookShop.Dao.ProductsDao;
import BookShop.Dao.SlideDao;
import BookShop.Entity.Categorys;
import BookShop.Entity.Menu;
import BookShop.Entity.Slides;
import BookShop.Dto.ProductsDto;
@Service
public class HomeServiceImpl implements IHomeService {
	@Autowired
	private SlideDao slideDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductsDao productsDao;

	public List<Slides> GetDataSlide() {
		
		return slideDao.GetDataSlide();
	}
	public List<Menu> GetDataMenu() {
		
		return menuDao.GetDataMenu();
	}
	public List<Categorys> GetDataCategorys() {
		return categoryDao.GetDataCategory();
	}
	public List<ProductsDto> GetDataProducts() {
		List<ProductsDto> listProducts = productsDao.GetDataProducts();
		listProducts.get(0).getBookId();
		return listProducts;
	}
	
	public List<ProductsDto> GetDataAllProducts(Boolean seeMore) {
		List<ProductsDto> listProducts = productsDao.GetDataAllProducts(seeMore);
		listProducts.get(0).getBookId();
		return listProducts;
	}
	
	public List<ProductsDto> GetDataProductsBySearching(String bookname) {
		List<ProductsDto> listProducts1 = productsDao.GetSearchDataProducts(bookname);
		listProducts1.get(0).getBookId();
		return listProducts1;
	}
}
