package BookShop.AdminController;



import java.util.List;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Entity.Categorys;

import BookShop.Service.CategoryServiceImpl;
import BookShop.UserController.BaseController;

@SuppressWarnings("unused")
@Controller
public class AdminCategoryController extends BaseController {
	@Autowired
	CategoryServiceImpl _categoryService;
	

	
	@RequestMapping(value = {"admin/category"})//URL 
	public ModelAndView ViewCategory() {
		List<Categorys> listCategory = _categoryService.GetDataCategory();// �?y d? li?u l�n list
		Categorys category = new Categorys(); // t?o d?i tu?ng category d? th�m xo� s?a
		_mvShare.addObject("category", category); // �nh x? d?i tu?ng category d? view li�n k?t
	    _mvShare.addObject("listCategory",listCategory);// �nh x? d?i tu?ng listCategory d? view li�n k?t
	    _mvShare.setViewName("admin/category"); // path: category
	    return _mvShare;
	} 
	
    @RequestMapping(value="admin/categorys/delete/{id}",method = RequestMethod.GET)    
    public String delete(@PathVariable int id){    
        this._categoryService.delete(id);    
        return "redirect:/admin/category";    
    } 
    
    @RequestMapping(value = "/admin/category/add", method = RequestMethod.POST)
    public String save(@ModelAttribute("category") Categorys category) {
        _categoryService.save(category);
        return "redirect:/admin/category";
    }

    
    @RequestMapping(value="admin/category/update",method = RequestMethod.POST)    
    public String update(@ModelAttribute("category") Categorys categorys){    
        _categoryService.update(categorys);    
        return "redirect:/admin/category";   
    } 
    

    
}
