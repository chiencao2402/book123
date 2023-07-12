package BookShop.Service;
import BookShop.Entity.Categorys;
import BookShop.Entity.Menu;
import BookShop.Entity.Slides;
import java.util.*;
import BookShop.Dto.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public interface IHomeService {
	@Autowired
	public List<Slides> GetDataSlide();

	public List<Categorys> GetDataCategorys();

	public List<Menu> GetDataMenu();
	
	public List<ProductsDto> GetDataProducts();

}
