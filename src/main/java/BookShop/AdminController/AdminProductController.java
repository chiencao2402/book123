package BookShop.AdminController;


import java.io.File;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import BookShop.Dao.ProductsDao;
import BookShop.Dto.ProductsDto;
import BookShop.Entity.Author;
import BookShop.Entity.Categorys;

import BookShop.Service.ProductServiceImpl;
import BookShop.UserController.BaseController;

@Controller
public class AdminProductController extends BaseController {
	
	
	@Autowired
	ProductServiceImpl _productService;
	
	@Autowired
	ProductsDao  dao;

	@RequestMapping(value = "admin/product")
	public ModelAndView ViewProduct() {
		
		 List<Author> listAuthor = _productService.GetDataAuthor();
		 List<Categorys> listCategory = _productService.GetDataCategory();
		List<ProductsDto> listProduct = _productService.GetDataProduct();
	
	
		_mvShare.addObject("product",new ProductsDto());
	    _mvShare.addObject("listAuthor",listAuthor);
	    _mvShare.addObject("listCategory",listCategory);
	    _mvShare.addObject("listProduct",listProduct);
	 
	    _mvShare.setViewName("admin/product");
	    return _mvShare;
	} 
	

	
    @RequestMapping(value="admin/product/delete/{id})",method = RequestMethod.GET)    
    public String delete(@PathVariable(required=true) String id ){
    	this._productService.delete(id);   
        return "redirect:/admin/product";    
    } 
    

    
  
	@RequestMapping(value="admin/product/add",method = RequestMethod.POST)    
    public String save(@ModelAttribute("product") ProductsDto product){  
	
		try {
	          MultipartFile multipartFile = product.getMultipartFile();
	          String fileName = multipartFile.getOriginalFilename();
	     
	      	String pathFile = System.getProperty("user.dir") + "//src//main//webapp//assets//user//img//img-book//";
	      
	          File file = new File(pathFile,fileName);
	          multipartFile.transferTo(file);
	          product.setImg(file.getName());
	          System.out.print(file);
	        } catch (Exception e) {
	        	
	          e.printStackTrace();
	        } 
        
        
        
        product.setIsDeleted(0);
        long millis = System.currentTimeMillis();
   	 java.sql.Date date = new java.sql.Date(millis);
   	 
        product.setCreatedAt(date);
        this._productService.save(product);    
        return "redirect:/admin/product";   
    } 
	
	   
    @RequestMapping(value="admin/product/update",method = RequestMethod.POST)    
    public String update(@ModelAttribute("product") ProductsDto product){
//    		
    	try {
	          MultipartFile multipartFile = product.getMultipartFile();
	          String fileName = multipartFile.getOriginalFilename();
	       	String pathFile = System.getProperty("user.dir") + "//src//main//webapp//assets//user//img//img-book//"; 
	   
	        	    File file = new File(pathFile,fileName);
	      		   multipartFile.transferTo(file);
	 	        	  product.setImg(file.getName());
	  	         		
	          
	     
	      		

	        } catch (Exception e) {	
	          e.printStackTrace();
	        } 
    	
        long millis = System.currentTimeMillis();
   	 	java.sql.Date date = new java.sql.Date(millis);
        product.setUpdatedAt(date);
        _productService.update(product);    
        return "redirect:/admin/product";   
    } 
    
}