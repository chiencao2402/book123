package BookShop.Service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import BookShop.Dao.CartDao;
import BookShop.Dto.CartDto;

@Service
public class CartServiceImpl implements ICartService {
    @Autowired
    private CartDao cartDao;

    // Thêm sản phẩm vào giỏ hàng
    public HashMap<Long, CartDto> AddCart(long id, HashMap<Long, CartDto> cart) {
        return cartDao.AddCart(id, cart);
    }

    // Chỉnh sửa thông tin sản phẩm trong giỏ hàng
    public HashMap<Long, CartDto> EditCart(long id, int quanty, HashMap<Long, CartDto> cart) {
        return cartDao.EditCart(id, quanty, cart);
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public HashMap<Long, CartDto> DeleteCart(long id, HashMap<Long, CartDto> cart) {
        return cartDao.DeleteCart(id, cart);
    }

    // Tính tổng số lượng sản phẩm trong giỏ hàng
    public int TotalQuanty(HashMap<Long, CartDto> cart) {
        return cartDao.TotalQuanty(cart);
    }

    // Tính tổng giá trị của giỏ hàng
    public double TotalPrice(HashMap<Long, CartDto> cart) {
        return cartDao.TotalPrice(cart);
    }
}
