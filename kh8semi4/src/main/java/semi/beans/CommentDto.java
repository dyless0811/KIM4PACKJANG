package semi.beans;

public class CommentDto {
private int no;
private String memberId;
private int productNo;
private int starPoint;
private String content;
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
public int getStarPoint() {
	return starPoint;
}
public void setStarPoint(int starPoint) {
	this.starPoint = starPoint;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
//기본생성자
public CommentDto() {
	
}


}

