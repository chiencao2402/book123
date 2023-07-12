package BookShop.Service;


import java.util.HashMap;

import org.springframework.stereotype.Service;

import BookShop.Dto.CartDto;
import BookShop.Entity.Bills;
@Service
public interface IBillsService {
	public int AddBills(Bills bill);
	
	public void AddBillsDetail(HashMap<Long, CartDto> carts);


}
