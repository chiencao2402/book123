package BookShop.Dao;

import org.springframework.stereotype.Repository;

import BookShop.Entity.BillDetail;
import BookShop.Entity.Bills;

@Repository
public class BillsDao extends BaseDao {

    // Thêm đơn hàng vào cơ sở dữ liệu
    public int AddBills(Bills bill) {
        String sql = "INSERT INTO bills (user, phone, display_name, address, total, note, quanty) VALUES (?, ?, ?, ?, ?, ?, ?)";

        int insert = _jdbcTemplate.update(
            sql,
            bill.getUser(),
            bill.getPhone(),
            bill.getDisplay_name(),
            bill.getAddress(),
            bill.getTotal(),
            bill.getNote(),
            bill.getQuanty()
        );

        return insert;
    }

    // Lấy ID của đơn hàng cuối cùng được thêm vào
    public long GetIDLastBills() {
        StringBuffer sql = new StringBuffer();
        sql.append("SELECT MAX(bills_id) FROM bills;");

        String sqlString = sql.toString(); // Convert StringBuffer to String

        Long id = _jdbcTemplate.queryForObject(sqlString, Long.class);
        return id;
    }

    // Thêm chi tiết đơn hàng vào cơ sở dữ liệu
    public int AddBillsDetail(BillDetail billDetail) {
        String sql = "INSERT INTO billdetail (book_id, bills_id, quanty, total) VALUES (?, ?, ?, ?)";

        int insert = _jdbcTemplate.update(
            sql,
            billDetail.getBookId(),
            billDetail.getBillsId(),
            billDetail.getQuanty(),
            billDetail.getTotal()
        );

        return insert;
    }

}
