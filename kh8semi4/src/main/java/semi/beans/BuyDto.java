package semi.beans;

import java.sql.Date;

public class BuyDto {
	private int no;
	private String memberId;
	private int productNo;
	private String type;
	private Date buyDate;
	private String status;
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	//toString 
	@Override
	public String toString() {
		return "BuyDto [no=" + no + ", memberId=" + memberId + ", productNo=" + productNo + ", type=" + type
				+ ", buyDate=" + buyDate + ", status=" + status + "]";
	}
	//생성자
	public BuyDto() {
		super();
	}
	
	
	
	

}
