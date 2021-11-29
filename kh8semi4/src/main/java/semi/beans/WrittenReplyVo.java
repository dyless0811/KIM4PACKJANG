package semi.beans;

import java.util.Date;

public class WrittenReplyVo {
//내가 작성한 리뷰VO
	private int no;
	private int butNo;
	private String content;
	private Date time;
	private int productNo;
	private int smallTypeNo;
	private String name;
	private int price;
	private String description;
	private int views;
	
	public WrittenReplyVo() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getButNo() {
		return butNo;
	}
	public void setButNo(int butNo) {
		this.butNo = butNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getSmallTypeNo() {
		return smallTypeNo;
	}
	public void setSmallTypeNo(int smallTypeNo) {
		this.smallTypeNo = smallTypeNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}