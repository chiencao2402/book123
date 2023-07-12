package BookShop.Dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import BookShop.Dto.*;
import BookShop.Entity.MapperCategorys;

@Repository
public class ProductsDao extends BaseDao {

    private static final boolean YES = true;
    private static final boolean NO = false;

    private StringBuffer SqlString() {
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT ");
        sql.append("b.book_id");
        sql.append(", b.id ");
        sql.append(", b.book_name ");
        sql.append(", b.price ");
        sql.append(", b.author_id ");
        sql.append(", b.quantity_remain ");
        sql.append(", b.description ");
        sql.append(", b.publisher ");
        sql.append(", b.publish_year ");
        sql.append(", b.avg_rating");
        sql.append(", b.img ");
        sql.append(", b.created_at ");
        sql.append(", b.updated_at ");
        sql.append(", b.is_deleted ");
        sql.append(", b.new_books ");
        sql.append(", b.high_light ");
        sql.append("FROM ");
        sql.append("books AS b ");

        return sql;
    }

    private String SqlProducts(boolean newBooks, boolean highLight) {
        StringBuffer sql = SqlString();
        sql.append("WHERE 1 = 1 ");
        if (highLight) {
            sql.append("AND b.high_light = 1 ");
        }
        if (newBooks) {
            sql.append("AND b.new_books = 1 ");
        }
        sql.append("GROUP BY b.id, b.book_id ");
        sql.append("ORDER BY RAND() ");
        if (highLight) {
            sql.append("LIMIT 9 ");
        }
        if (newBooks) {
            sql.append("LIMIT 12 ");
        }
        return sql.toString();
    }

    private String SqlProductsAll(boolean watchMore) {
        StringBuffer sql = SqlString();
        sql.append("WHERE 1 = 1 ");
        if (!watchMore) {
            sql.append("LIMIT 6");
        }
        return sql.toString();
    }

    private StringBuffer SqlProductsByID(int id) {
        StringBuffer sql = SqlString();
        sql.append("WHERE 1 = 1 ");
        sql.append("AND b.id = " + id + " ");
        return sql;
    }

    private String SqlProductsPaginate(int bookId, int start, int totalPage) {
        StringBuffer sql = SqlProductsByID(bookId);
        sql.append("LIMIT " + start + ", " + totalPage);
        return sql.toString();
    }

    public List<ProductsDto> GetDataProducts() {
        String sql = SqlProducts(YES, NO);
        List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return listProducts;
    }

    public List<ProductsDto> GetDataAllProducts(Boolean seeMore) {
        String sql = SqlProductsAll(seeMore);
        List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return listProducts;
    }

    public List<ProductsDto> GetSearchDataProducts(String bookName) {
        String sql = SqlProductsByBookName(bookName);
        List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return listProducts;
    }

    public List<ProductsDto> GetAllProductsByID(int bookId) {
        String sql = SqlProductsByID(bookId).toString();
        List<ProductsDto> listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return listProducts;
    }

    public List<ProductsDto> GetDataProductsPaginate(int bookId, int start, int totalPage) {
        StringBuffer sqlGetDataByID = SqlProductsByID(bookId);
        List<ProductsDto> listProductsByID = _jdbcTemplate.query(sqlGetDataByID.toString(), new ProductsDtoMapper());
        List<ProductsDto> listProducts = new ArrayList<ProductsDto>();
        if (listProductsByID.size() > 0) {
            String sql = SqlProductsPaginate(bookId, start, totalPage);
            listProducts = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        }
        return listProducts;
    }

    private String SqlProductByID(long bookId) {
        StringBuffer sql = SqlString();
        sql.append("WHERE 1 = 1 ");
        sql.append("AND b.book_id = " + bookId + " ");
        sql.append("LIMIT 1 ");
        return sql.toString();
    }

    public List<ProductsDto> GetProductByID(long bookId) {
        String sql = SqlProductByID(bookId);
        List<ProductsDto> listProduct = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return listProduct;
    }

    public ProductsDto FindProductByID(long bookId) {
        String sql = SqlProductByID(bookId);
        ProductsDto product = _jdbcTemplate.queryForObject(sql, new ProductsDtoMapper());
        return product;
    }

    private String SqlProductsByBookName(String bookname) {
        StringBuffer sql = SqlString();
        sql.append("WHERE 1 = 1 ");
        sql.append("AND b.book_name like '%" + bookname + "%'");
        return sql.toString();
    }

    public List<ProductsDto> GetDataProduct() {
        List<ProductsDto> list = new ArrayList<ProductsDto>();
        String sql = "SELECT * FROM books where is_deleted=0";
        list = _jdbcTemplate.query(sql, new ProductsDtoMapper());
        return list;
    }

    public int save(ProductsDto product) {
        Date publishYear = product.getPublishYear();
        String publishYearStr = null;

        if (publishYear != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            publishYearStr = dateFormat.format(publishYear);
        }

        String sql = "INSERT INTO books (book_name, price, author_id, id, quantity_remain, description, publisher, publish_year, avg_rating, img, created_at, updated_at, is_deleted, new_books, high_light) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return _jdbcTemplate.update(sql, product.getBookName(), product.getPrice(), product.getAuthorId(), product.getId(), product.getQuantityRemain(),
                product.getDescription(), product.getPublisher(), publishYearStr, product.getAvgRating(), product.getImg(),
                product.getCreatedAt(), product.getUpdatedAt(), product.getIsDeleted(), product.getNewBooks(), product.getHighLight());

    }


    public int update(ProductsDto product) {
        String sql = "UPDATE books SET " +
                "book_name = '" + product.getBookName() + "', " +
                "price = '" + product.getPrice() + "', " +
                "author_id = '" + product.getAuthorId() + "', " +
                "category_id = '" + product.getId() + "', " +
                "quantity_remain = '" + product.getQuantityRemain() + "', " +
                "description = '" + product.getDescription() + "', " +
                "publisher = '" + product.getPublisher() + "', " +
                "publish_year = '" + product.getPublishYear() + "', " +
                "img = '" + product.getImg() + "', " +
                "avg_rating = '" + product.getAvgRating() + "', " +
                "updated_at = '" + product.getUpdatedAt() + "' " +
                "WHERE book_id = '" + product.getBookId() + "'";

        return _jdbcTemplate.update(sql);
    }



    public int delete(String id) {
        String sql = "UPDATE books SET is_deleted = 1 WHERE book_id = '" + id + "'";
        return _jdbcTemplate.update(sql);
    }

}
