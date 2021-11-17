package semi.beans;

public class ReplyListVo {
	int productNo;
	int smallTypeNo;
	String name;
	int price;
	String recentReply;
	int replyCount;
	double starpoint;
	public ReplyListVo() {
		super();
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
	public String getRecentReply() {
		return recentReply;
	}
	public void setRecentReply(String recentReply) {
		this.recentReply = recentReply;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public double getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(double starpoint) {
		this.starpoint = starpoint;
	}
}
