package BookShop.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "Customer")
public class Customer {
	private String address;
  

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotEmpty(message = "Tên người dùng không được trống")
    private String username;

    @NotEmpty(message = "Mật khẩu không được trống")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z]).{6,50}$", message = "Mật khẩu phải chứa ít nhất 1 chữ hoa, 1 chữ thường và từ 6 đến 50 ký tự")
    private String password;

    @NotEmpty(message = "Họ và tên không được trống")
    private String fullname;

    @NotEmpty(message = "Email không được trống")
    @Email(message = "Email không hợp lệ")
    private String email;

    @NotEmpty(message = "Số điện thoại không được trống")
    private String phone;

    private Boolean activated;

    private Boolean admin;

    // Getters and setters

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
    public String getAddress() {
  		return address;
  	}

  	public void setAddress(String address) {
  		this.address = address;
  	}
}
