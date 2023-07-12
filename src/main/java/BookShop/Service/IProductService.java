package BookShop.Service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dto.ProductsDto;
import BookShop.Entity.Author;
import BookShop.Entity.Categorys;


@Service
public interface IProductService {
	@Autowired
	public ProductsDto GetProductByID(long bookId);
	
	public List<ProductsDto> GetProductByIDCategory(int id);
		@Autowired
	
	public List<Author> GetDataAuthor();
	public List<Categorys> GetDataCategory();
	@Autowired



	public int delete(String id);
}