package BookShop.Service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
    @Autowired
    HttpServletRequest request;
    
    @Autowired
    HttpServletResponse response;

    // Tạo một cookie mới với tên, giá trị và số ngày tồn tại được chỉ định
    public Cookie create(String name, String value, int days) {
        String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
        Cookie cookie = new Cookie(name, encodedValue);
        cookie.setMaxAge(days * 24 * 60 * 60);
        cookie.setPath("/");
        response.addCookie(cookie);
        return cookie;
    }

    // Đọc giá trị của cookie dựa trên tên
    public Cookie read(String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(name)) {
                    String encodedValue = new String(Base64.getDecoder().decode(cookie.getValue()));
                    cookie.setValue(encodedValue);
                    return cookie;
                }
            }
        }
        return null;
    }

    // Xóa cookie dựa trên tên
    public void delete(String name) {
        this.create(name, "", 0);
    }
}
