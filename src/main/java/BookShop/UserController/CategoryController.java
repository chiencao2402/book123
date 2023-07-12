package BookShop.UserController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Dto.PaginatesDto;
import BookShop.Service.CategoryServiceImpl;
import BookShop.Service.PaginateServiceImpl;

@Controller
public class CategoryController extends BaseController {
    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    @Autowired
    private PaginateServiceImpl paginateServiceImpl;

    private int totalProductsPage = 9;

    // Hiển thị trang danh mục sản phẩm
    @RequestMapping(value = "/san-pham/{id}")
    public ModelAndView Product(@PathVariable String id) {
        _mvShare.setViewName("user/products/category");
        // Lấy tổng số dữ liệu sản phẩm thuộc danh mục
        int totalData = categoryServiceImpl.GetAllProductsByID(Integer.parseInt(id)).size();
        // Lấy thông tin phân trang
        PaginatesDto paginateInfo = paginateServiceImpl.GetInfoPaginates(totalData, totalProductsPage, 1);
        // Thêm thông tin vào model
        _mvShare.addObject("idCategory", id);
        _mvShare.addObject("paginateInfo", paginateInfo);
        _mvShare.addObject("productsPaginate", categoryServiceImpl.GetDataProductsPaginate(Integer.parseInt(id), paginateInfo.getStart(), totalProductsPage));
        return _mvShare;
    }

    // Hiển thị trang danh mục sản phẩm với phân trang
    @RequestMapping(value = "/san-pham/{id}/{currentPage}")
    public ModelAndView Product(@PathVariable String id, @PathVariable String currentPage) {
        _mvShare.setViewName("user/products/category");
        // Lấy tổng số dữ liệu sản phẩm thuộc danh mục
        int totalData = categoryServiceImpl.GetAllProductsByID(Integer.parseInt(id)).size();
        // Lấy thông tin phân trang
        PaginatesDto paginateInfo = paginateServiceImpl.GetInfoPaginates(totalData, totalProductsPage, Integer.parseInt(currentPage));
        // Thêm thông tin vào model
        _mvShare.addObject("idCategory", id);
        _mvShare.addObject("paginateInfo", paginateInfo);
        _mvShare.addObject("productsPaginate", categoryServiceImpl.GetDataProductsPaginate(Integer.parseInt(id), paginateInfo.getStart(), totalProductsPage));
        return _mvShare;
    }
}
