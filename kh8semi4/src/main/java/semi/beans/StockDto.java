package semi.beans;


public class StockDto {
	private int no;
	private int colorNo;
	private int sizeNo;
	private int productNo;
	private String stockDate;
	private int stockChange;
	public StockDto() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getColorNo() {
		return colorNo;
	}
	public void setColorNo(int colorNo) {
		this.colorNo = colorNo;
	}
	public int getSizeNo() {
		return sizeNo;
	}
	public void setSizeNo(int sizeNo) {
		this.sizeNo = sizeNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getStockDate() {
		return stockDate;
	}
	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}
	public int getStockChange() {
		return stockChange;
	}
	public void setStockChange(int stockChange) {
		this.stockChange = stockChange;
	}
}

