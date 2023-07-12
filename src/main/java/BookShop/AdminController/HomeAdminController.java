package BookShop.AdminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import BookShop.UserController.BaseController;
@Controller
public class HomeAdminController extends BaseController {
	
	@RequestMapping(value = {"/admin"})
	public ModelAndView AdminIndex() {
		
	    _mvShare.setViewName("admin/adminIndex");
	    return _mvShare;
	}
}
