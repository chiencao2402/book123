package BookShop.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCategorys implements RowMapper<Categorys> {

    // Phương thức mapRow để ánh xạ từ ResultSet sang đối tượng Categorys
    public Categorys mapRow(ResultSet rs, int rowNum) throws SQLException {
        Categorys categorys = new Categorys();
        categorys.setId(rs.getInt("id")); // Lấy giá trị từ cột "id" trong ResultSet và gán cho thuộc tính "id" của đối tượng Categorys
        categorys.setName(rs.getString("name")); // Lấy giá trị từ cột "name" trong ResultSet và gán cho thuộc tính "name" của đối tượng Categorys
        categorys.setDescription(rs.getString("description")); // Lấy giá trị từ cột "description" trong ResultSet và gán cho thuộc tính "description" của đối tượng Categorys
        return categorys; // Trả về đối tượng Categorys đã được ánh xạ từ ResultSet
    }
}
