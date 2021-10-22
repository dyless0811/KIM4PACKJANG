package semi.beans;

public class DeliveryDto {
	private int no;
	private int buyNo;
	private String memberId;
	private int productNo;
	public DeliveryDto() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
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
}
