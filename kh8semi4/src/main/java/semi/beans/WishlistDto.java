package semi.beans;

public class WishlistDto {
	private int no;
	private String memberId;
	private int productNo;
	
	public WishlistDto() {
		super();
	}
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
	@Override
	public String toString() {
		return "WishlistDto [no=" + no + ", memberId=" + memberId + ", productNo=" + productNo + "]";
	}
	
	
}
