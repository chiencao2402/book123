package BookShop.UserController;

import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import BookShop.Dto.ProductsDto;

@Controller
public class HomeController extends BaseController {

    // Xem trang chủ
    @RequestMapping(value = {"/","/home"})
    public ModelAndView Index(@RequestParam(name="seeMore", required = false, defaultValue = "false") Boolean seeMore) {
        _mvShare.addObject("slides",_homeService.GetDataSlide());
        _mvShare.addObject("categorys",_homeService.GetDataCategorys());
        _mvShare.addObject("products", _homeService.GetDataProducts());
        _mvShare.addObject("allProducts", _homeService.GetDataAllProducts(seeMore));
        _mvShare.setViewName("user/index");
        return _mvShare;
    }

    // Xem thêm sản phẩm bằng AJAX
    @RequestMapping(value = {"/home/seeMore"})
    public @ResponseBody String Index(HttpServletRequest request, HttpServletResponse response) {
        // Lấy danh sách sản phẩm
        List<ProductsDto> listProducts = _homeService.GetDataAllProducts(true);
        
        // Chuyển đổi danh sách sản phẩm sang chuỗi JSON
        Gson gson = new Gson();
        String productsStr = gson.toJson(listProducts);
        
        // Thiết lập bộ mã hóa cho response
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        
        return productsStr;
    }
}
