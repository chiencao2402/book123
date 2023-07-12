package BookShop.Dto;



import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProductsDtoMapper implements RowMapper<ProductsDto> {

	public ProductsDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductsDto products = new ProductsDto();
		products.setBookId(rs.getInt("book_id"));
		products.setBookName(rs.getString("book_name"));
		products.setPrice(rs.getInt("price"));
		products.setAuthorId(rs.getInt("author_id"));
		products.setId(rs.getInt("id"));
		products.setQuantityRemain(rs.getInt("quantity_remain"));
		products.setDescription(rs.getString("description"));
		products.setPublisher(rs.getString("publisher"));
		products.setPublishYear(rs.getDate("publish_year"));
		products.setAvgRating(rs.getFloat("avg_rating"));
		products.setImg(rs.getString("img"));
		products.setCreatedAt(rs.getDate("created_at"));
		products.setUpdatedAt(rs.getDate("updated_at"));
		products.setIsDeleted(rs.getInt("is_deleted"));
		products.setNewBooks(rs.getBoolean("new_books"));
		products.setHighLight(rs.getBoolean("high_light"));
		

		return products;
	}

}