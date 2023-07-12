package BookShop.UserController;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.MappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import BookShop.Dao.CustomerDAO;
import BookShop.Entity.Customer;
import BookShop.Service.CookieService;
import BookShop.Service.MailService;
import BookShop.bean.MailInfo;
import BookShop.config.Mailer;

@Controller
public class AccountController {
    @Autowired
    private CustomerDAO dao;
    
    @Autowired
    private HttpSession session;
    
    @Autowired
    private CookieService cookie;
    
    @Autowired
    private MailService mailer;
    
    @Autowired
    private HttpServletRequest request;
   
    @Transactional
    @GetMapping("/dang-nhap")
    public String showLoginForm(Model model) {
        // Kiểm tra người dùng đã đăng nhập hay chưa và chuyển hướng tới trang admin hoặc trang chủ nếu đã đăng nhập
        Customer user = (Customer) session.getAttribute("user");
        if (user != null) {
            if (user.getAdmin()) {
                return "redirect:/admin";
            } else {
                return "redirect:/home";
            }
        }

        // Kiểm tra cookie để điền thông tin đăng nhập vào form
        Cookie ckid = cookie.read("username");
        Cookie ckpw = cookie.read("password");
        if (ckid != null) {
            String username = ckid.getValue();
            String pwd = ckpw != null ? ckpw.getValue() : "";
            model.addAttribute("username", username);
            model.addAttribute("password", pwd);
        } else {
            model.addAttribute("username", "");
            model.addAttribute("password", "");
        }
        return "user/account/login";
    }


    @Transactional
    @PostMapping("/dang-nhap")
    public String processLoginForm(Model model, @RequestParam("username") String username,
                                   @RequestParam("password") String pw,
                                   @RequestParam(value = "rm", defaultValue = "false") boolean rm) {
        // Kiểm tra tên đăng nhập và mật khẩu không được trống
        if (username.isEmpty() || pw.isEmpty()) {
            model.addAttribute("message", "Vui lòng nhập tên đăng nhập và mật khẩu");
            return "user/account/login";
        }

        // Kiểm tra thông tin đăng nhập
        Customer user = dao.findByUserName(username);
        if (user == null) {
            model.addAttribute("message", "Người dùng không hợp lệ");
        } else if (!pw.equals(user.getPassword())) {
            model.addAttribute("message", "Mật khẩu không hợp lệ");
        } else if (!user.getActivated()) {
            model.addAttribute("message", "Tài khoản chưa được kích hoạt");
        } else {
            // Đăng nhập thành công, thiết lập session và tạo cookie nếu người dùng chọn "ghi nhớ mật khẩu"
            model.addAttribute("message", "Đăng nhập thành công");
            session.setAttribute("user", user);

            if (rm) {
                cookie.create("username", user.getUsername(), 30);
                cookie.create("password", user.getPassword(), 30);
            } else {
                cookie.delete("username");
                cookie.delete("password");
            }

            // Chuyển hướng tới trang admin nếu là người dùng admin
            if (user.getAdmin()) {
                return "redirect:/admin";
            }

            // Chuyển hướng tới trang trước đó nếu có
            String backUrl = (String) session.getAttribute("back-url");
            if (backUrl != null) {
                session.removeAttribute("back-url");
                return "redirect:" + backUrl;
            }
            return "redirect:/home";
        }

        return "user/account/login";
    }

    @GetMapping("/dang-xuat")
    public String logout(Model model) {
        // Xóa thông tin người dùng khỏi session và chuyển hướng tới trang đăng nhập
        session.removeAttribute("user");
        return "redirect:/dang-nhap";
    }



    @Transactional
    @GetMapping("/dang-ky")
    public String register(Model model) {
        // Hiển thị form đăng ký và truyền một đối tượng Customer rỗng vào form
        Customer user = new Customer();
        model.addAttribute("form", user);
        return "user/account/register";
    }
    
    @Transactional
    @PostMapping("/dang-ky")
    public String register(Model model, @Validated @ModelAttribute("form") Customer user, BindingResult errors)
            throws MappingException, MessagingException {
        // Kiểm tra và xử lý yêu cầu đăng ký
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng sửa các lỗi sau");
            return "user/account/register";
        }

        // Kiểm tra các trường thông tin đăng ký không được trống
        if (isAnyFieldEmpty(user)) {
            model.addAttribute("message", "Vui lòng điền đầy đủ thông tin đăng ký");
            return "user/account/register";
        }

        // Kiểm tra tên đăng nhập đã tồn tại
        Customer existingUser = dao.findByUserName(user.getUsername());
        if (existingUser != null) {
            model.addAttribute("message", "Tên đăng nhập đã tồn tại");
            return "user/account/register";
        }

        // Tạo tài khoản mới và lưu vào cơ sở dữ liệu
        user.setActivated(true);
        user.setAdmin(false);
        dao.create(user);

        model.addAttribute("message", "Đăng ký thành công");
        return "user/account/register";
    }

    private boolean isAnyFieldEmpty(Customer user) {
        // Kiểm tra xem có trường thông tin nào không được điền trong form đăng ký hay không
        return user.getUsername().isEmpty() || user.getPassword().isEmpty() || user.getEmail().isEmpty();
    }

    @GetMapping("/forgot")
    public String forgot(Model model) {
        // Hiển thị form quên mật khẩu
        return "user/account/forgot";
    }

    @PostMapping("/forgot")
    public String forgot(Model model, @RequestParam("username") String username, @RequestParam("email") String email)
            throws MappingException, MessagingException {
        // Xử lý yêu cầu quên mật khẩu
        Customer user = dao.findByUserName(username);
        if (user == null) {
            model.addAttribute("message", "Người dùng không hợp lệ");
        } else if (!email.equals(user.getEmail())) {
//            modelThêm dòng code đã bị cắt:

//java
            model.addAttribute("message", "Email không hợp lệ");
        } else {
            // Gửi email chứa mật khẩu tới địa chỉ email đã đăng ký
            String from = "your_email@gmail.com";
            String to = user.getEmail();
            String subject = "Chào bạn " + user.getUsername();
            String body = "Mật khẩu của bạn là: " + user.getPassword();
            MailInfo mail = new MailInfo(from, to, subject, body);
            mailer.send(mail);
            model.addAttribute("message", "Email đã được gửi");
        }
        return "redirect:/dang-nhap";
    }

    @GetMapping("/change")
    public String change(Model model) {
        // Hiển thị form thay đổi mật khẩu
        return "user/account/change";
    }

    @PostMapping("/change")
    public String change(Model model, @RequestParam("username") String username, @RequestParam("pw") String pw,
            @RequestParam("pw1") String pw1, @RequestParam("pw2") String pw2) {
        // Xử lý yêu cầu thay đổi mật khẩu
        if (!pw1.equals(pw2)) {
            model.addAttribute("message", "Mật khẩu không trùng nhau");
        } else {
            Customer user = dao.findByUserName(username);
            if (user == null) {
                model.addAttribute("message", "Người dùng không hợp lệ");
            } else {
                user.setPassword(pw1);
                dao.update(user);
                model.addAttribute("message", "Đổi mật khẩu thành công");
            }
        }
        return "redirect:/login";
    }

    @GetMapping("/edit")
    public String edit(Model model) {
        // Hiển thị form chỉnh sửa thông tin người dùng
        Customer user = (Customer) session.getAttribute("user");
        model.addAttribute("form", user);
        return "user/account/edit";
    }

    @PostMapping("/edit")
    public String edit(Model model, @ModelAttribute("form") Customer user) {
        // Xử lý yêu cầu chỉnh sửa thông tin người dùng
        dao.update(user);
        session.setAttribute("user", user);
        model.addAttribute("message", "Cập nhật thành công");
        return "user/account/edit";
    }
}
