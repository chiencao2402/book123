package BookShop.Entity;

public class Bills {
private long billsId;
private String user;
private int phone;
private String display_name;
private String address;
private double total;
private int quanty;
public int getQuanty() {
	return quanty;
}
public void setQuanty(int quanty) {
	this.quanty = quanty;
}
public Bills(String address, double total) {
	super();
	this.address = address;
	this.total = total;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}
private String note;
public long getBillsId() {
	return billsId;
}
public void setBillsId(long billsId) {
	this.billsId = billsId;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public int getPhone() {
	return phone;
}
public void setPhone(int phone) {
	this.phone = phone;
}
public String getDisplay_name() {
	return display_name;
}
public void setDisplay_name(String display_name) {
	this.display_name = display_name;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
public Bills(long billsId, String user, int phone, String display_name, String address, double total, String note, int quanty) {
	super();
	this.billsId = billsId;
	this.user = user;
	this.phone = phone;
	this.display_name = display_name;
	this.address = address;
	this.total = total;
	this.note = note;
	this.quanty = quanty;
}
public Bills() {
}
}
