package semi.beans;

public class BasketDto {
private int no;
private String memberId;
private int productNo;
//setter & getter 
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getMemberId() {
	return memberId;
}
public void setMemberId(String memberId) {
	this.memberId = memberId;
}
public int getProductNo() {
	return productNo;
}
public void setProductNo(int productNo) {
	this.productNo = productNo;
}
//기본생성자
public BasketDto() {
	
}




}
