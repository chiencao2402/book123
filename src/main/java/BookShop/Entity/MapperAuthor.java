package BookShop.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperAuthor implements RowMapper<Author> {
    // Phương thức mapRow để ánh xạ từ ResultSet sang đối tượng Author
    public Author mapRow(ResultSet rs, int rowNum) throws SQLException {
        Author author = new Author();
        author.setId(rs.getInt("author_id")); // Lấy giá trị từ cột "author_id" trong ResultSet và gán cho thuộc tính "id" của đối tượng Author
        author.setName(rs.getString("author_name")); // Lấy giá trị từ cột "author_name" trong ResultSet và gán cho thuộc tính "name" của đối tượng Author
        return author; // Trả về đối tượng Author đã được ánh xạ từ ResultSet
    }
}
