package BookShop.config;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return null;
        // Lấy thông tin người dùng từ nguồn dữ liệu (ví dụ: cơ sở dữ liệu)
        // Xây dựng và trả về đối tượng UserDetails
        // ...
    }
}
