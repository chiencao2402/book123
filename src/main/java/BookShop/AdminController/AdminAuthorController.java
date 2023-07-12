package BookShop.AdminController;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Entity.Author;
import BookShop.Service.AuthorServiceImpl;
import BookShop.UserController.BaseController;

@Controller
public class AdminAuthorController extends BaseController {
	@Autowired
	AuthorServiceImpl _authorService;
	

	
	@RequestMapping(value = {"admin/author"})
	public ModelAndView ViewAuthor() {
		List<Author> listAuthor = _authorService.GetDataAuthor();
		Author author = new Author();
		_mvShare.addObject("author",author);
	    _mvShare.addObject("listAuthor",listAuthor);
	    _mvShare.setViewName("admin/author");
	    return _mvShare;
	} 
	
    @RequestMapping(value="admin/author/delete/{id}",method = RequestMethod.GET)    
    public String delete(@PathVariable int id){    
        this._authorService.delete(id);    
        return "redirect:/admin/author";    
    } 
    
    @RequestMapping(value="admin/author/add",method = RequestMethod.POST)    
    public String save(@ModelAttribute("author") Author author){    
        _authorService.save(author);    
        return "redirect:/admin/author";   
    } 
    
    @RequestMapping(value="admin/author/update",method = RequestMethod.POST)    
    public String update(@ModelAttribute("author") Author author){    
        _authorService.update(author);    
        return "redirect:/admin/author"; 
    } 
    

    
}
