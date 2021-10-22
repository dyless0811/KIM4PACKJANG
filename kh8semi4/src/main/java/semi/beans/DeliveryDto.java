package semi.beans;

public class DeliveryDto {
	private int no;
	private int buyNo;
	private String status;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
