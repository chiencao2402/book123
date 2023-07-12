package BookShop.Dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductsDto {
private int bookId;
private String bookName;
private int price;
private int authorId;
private int id;
private int quantityRemain;
private String description;
private String publisher;
private Date publishYear;
private float avgRating;
private String img;
private  Date createdAt;
private Date updatedAt;
private int isDeleted;
private boolean highLight;
private boolean newBooks;

public int getBookId() {
	return bookId;
}
public void setBookId(int bookId) {
	this.bookId = bookId;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = (int) price;
}
public int getAuthorId() {
	return authorId;
}
public void setAuthorId(int authorId) {
	this.authorId = authorId;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getQuantityRemain() {
	return quantityRemain;
}
public void setQuantityRemain(int quantityRemain) {
	this.quantityRemain = quantityRemain;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getPublisher() {
	return publisher;
}
public void setPublisher(String publisher) {
	this.publisher = publisher;
}
public Date getPublishYear() {
	return publishYear;
}
public void setPublishYear(Date publishYear) {
	this.publishYear = publishYear;
}
public float getAvgRating() {
	return avgRating;
}
public void setAvgRating(float avgRating) {
	this.avgRating = avgRating;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public Date getCreatedAt() {
	return createdAt;
}
public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}
public Date getUpdatedAt() {
	return updatedAt;
}
public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}
public int getIsDeleted() {
	return isDeleted;
}
public void setIsDeleted(int isDeleted) {
	this.isDeleted = isDeleted;
}

public boolean getHighLight() {
	return highLight;
}
public void setHighLight(boolean highLight) {
	this.highLight = highLight;
}
public boolean getNewBooks() {
	return newBooks;
}
public void setNewBooks(boolean newBooks) {
	this.newBooks = newBooks;
}
public ProductsDto() {

}
public MultipartFile getMultipartFile() {
	// TODO Auto-generated method stub
	return null;
}

}
