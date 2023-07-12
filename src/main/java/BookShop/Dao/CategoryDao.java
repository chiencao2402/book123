package BookShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import BookShop.Entity.Categorys;
import BookShop.Entity.MapperCategorys;

@Repository
public class CategoryDao extends BaseDao {
    
    // Lấy danh sách các category từ cơ sở dữ liệu
    public List<Categorys> GetDataCategory() {
        List<Categorys> listCategory = new ArrayList<Categorys>();
        String sql = "SELECT * FROM categorys";
        listCategory = _jdbcTemplate.query(sql, new MapperCategorys());
        return listCategory;
    }

    // Thêm một category vào cơ sở dữ liệu
    public int save(Categorys categorys) {
        String sql = "INSERT INTO categorys(name, description) VALUES (?, ?)";
        return _jdbcTemplate.update(sql, categorys.getName(), categorys.getDescription());
    }

    // Cập nhật thông tin một category trong cơ sở dữ liệu
    public int update(Categorys categorys) {
        String sql = "UPDATE categorys SET name = ?, description = ? WHERE id = ?";
        return _jdbcTemplate.update(sql, categorys.getName(), categorys.getDescription(), categorys.getId());
    }

    // Xóa một category khỏi cơ sở dữ liệu
    public int delete(int id) {
        String sql = "DELETE FROM categorys WHERE id = ?";
        return _jdbcTemplate.update(sql, id);
    }

    // Lấy thông tin của một category dựa trên id
    public Categorys getCatgegoryById(int id) {
        String sql = "SELECT * FROM categorys WHERE id = ?";
        return _jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<Categorys>(Categorys.class));
    }

}
