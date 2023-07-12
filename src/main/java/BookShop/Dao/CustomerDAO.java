package BookShop.Dao;

import java.util.List;
import BookShop.Entity.Customer;
import org.hibernate.SessionFactory;
public interface CustomerDAO {
	 public void setSessionFactory(SessionFactory sessionFactory);
    Customer findByUserName(String username);
    List<Customer> findAll();
    Customer create(Customer entity);
    Customer update(Customer entity);
    Customer delete(String username);
    Customer findById(int id);
    
}

