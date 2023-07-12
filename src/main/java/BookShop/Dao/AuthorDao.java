package BookShop.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import BookShop.Entity.Author;
import BookShop.Entity.MapperAuthor;

@Repository
public class AuthorDao extends BaseDao {
	
    // Lấy danh sách tác giả từ cơ sở dữ liệu
    public List<Author> GetDataAuthor() {
        List<Author> listAuthor = new ArrayList<Author>();
        String sql = "SELECT * FROM authors";
        listAuthor = _jdbcTemplate.query(sql, new MapperAuthor());
        return listAuthor;
    } 
    
    // Lưu thông tin tác giả vào cơ sở dữ liệu
    public int save(Author author) {
        String sql = "INSERT INTO authors(author_name) VALUES('" + author.getName() + "')";
        return _jdbcTemplate.update(sql);
    }    
    
    // Cập nhật thông tin tác giả trong cơ sở dữ liệu
    public int update(Author author) {
        String sql = "UPDATE authors SET author_name='" + author.getName() + "' WHERE author_id='" + author.getId() + "'";
        return _jdbcTemplate.update(sql);
    }    
    
    // Xóa tác giả khỏi cơ sở dữ liệu
    public int delete(int id) {
        String sql = "DELETE FROM authors WHERE author_id=" + id + "";
        return _jdbcTemplate.update(sql);
    } 
}
