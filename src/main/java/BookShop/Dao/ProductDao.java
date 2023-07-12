//package BookShop.Dao;
//
//import java.util.ArrayList;
//import java.util.List;
//
//
//import org.springframework.stereotype.Repository;
//
//import BookShop.Entity.Product;
//
//
//@Repository
//public class ProductDao extends BaseDao{
//	
//	public List<Product> GetDataProduct(){
//		List<Product> list = new ArrayList<Product>();
//		String sql = "SELECT * FROM books where is_deleted=0";
//		list = _jdbcTemplate.query(sql, new MapperProduct());
//		return list;
//	} 
//	
//	public int save(Product product){
//	    String sql="insert into books(name,price,author_id,category_id,quantity_remain,description,publisher,publish_year,img,avg_rating,created_at,is_deleted) values('"+product.getName()+"','"+product.getPrice()+"','"+product.getAuthor().getId()+"','"+product.getCategory().getId()+"','"+product.getQuantityRemain()+"','"+product.getDescription()+"','"+product.getPublisher()+"','"+product.getPublish_year()+"','"+product.getImg()+"','"+product.getAvg_rating()+"','"+product.getCreatedAt()+"','"+product.getIsDeleted()+"')";    
//	    return _jdbcTemplate.update(sql);    
//	}    
//	
//	
//	public int update(Product product){    
//		 String sql="update books set name='"+product.getName()+"',price='"+product.getPrice()+"',author_id='"+product.getAuthor().getId()+"',category_id='"+product.getCategory().getId()+"',quantity_remain='"+product.getQuantityRemain()+"',description='"+product.getDescription()+"',publisher='"+product.getPublisher()+"',publish_year='"+product.getPublish_year()+"',img='"+product.getImg()+"',avg_rating='"+product.getAvg_rating()+"',img='"+product.getImg()+"',updated_at='"+product.getUpdatedAt()+"' where id='"+product.getId()+"'";    
//	    return _jdbcTemplate.update(sql);    
//	}  
//	
//	
//	public int delete(String id){
//		
//		String sql="UPDATE books SET is_deleted = 1 WHERE books.id in ("+id+")";
//	    return _jdbcTemplate.update(sql);    
//	}   
//	
//
//	
//}