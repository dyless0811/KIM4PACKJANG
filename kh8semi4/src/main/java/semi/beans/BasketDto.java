package semi.beans;

public class BasketDto {
	private int no;
	private String memberId;
	private int ProductNo;
	private int colorNo;
	private int SizeNo;
	
	public int getColorNo() {
		return colorNo;
	}

	public void setColorNo(int colorNo) {
		this.colorNo = colorNo;
	}

	public int getSizeNo() {
		return SizeNo;
	}

	public void setSizeNo(int sizeNo) {
		SizeNo = sizeNo;
	}

	public BasketDto() {
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
		return ProductNo;
	}

	public void setProductNo(int productNo) {
		ProductNo = productNo;
	}
	
}
