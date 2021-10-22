package semi.beans;

import java.util.Date;

public class StockDto {
	private int stockNo;
	private int colorNo;
	private int sizeNo;
	private int productNo;
	private Date stockDate;
	private int stockChange;
	
	public StockDto() {
		super();
	
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
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
	public Date getStockDate() {
		return stockDate;
	}
	public void setStockDate(Date stockDate) {
		this.stockDate = stockDate;
	}
	public int getStockChange() {
		return stockChange;
	}
	public void setStockChange(int stockChange) {
		this.stockChange = stockChange;
	}
	
	
	
}
