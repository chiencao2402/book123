package BookShop.Entity;

public class BillDetail {
private long id;
private long bookId;
private long billsId;
private int quanty;
private double total;
public BillDetail(long id, long bookId, long billsId, int quanty, double total) {
	super();
	this.id = id;
	this.bookId = bookId;
	this.billsId = billsId;
	this.quanty = quanty;
	this.total = total;
}

public BillDetail() {
	super();
	
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public long getBookId() {
	return bookId;
}
public void setBookId(long bookId) {
	this.bookId = bookId;
}
public long getBillsId() {
	return billsId;
}
public void setBillsId(long billsId) {
	this.billsId = billsId;
}
public int getQuanty() {
	return quanty;
}
public void setQuanty(int quanty) {
	this.quanty = quanty;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}

}
