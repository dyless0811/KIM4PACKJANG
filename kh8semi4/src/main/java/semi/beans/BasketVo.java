package semi.beans;

public class BasketVo {
	private String productFileSavename;
	private int productNo;
	private String productName;
	private String colorName;
	private String sizeName;
	private int price;
	private int basketNo;
	private int count;
	
	public BasketVo() {
		super();
	}

	public String getProductFileSavename() {
		return productFileSavename;
	}

	public void setProductFileSavename(String productFileSavename) {
		this.productFileSavename = productFileSavename;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getColorName() {
		return colorName;
	}

	public void setColorName(String colorName) {
		this.colorName = colorName;
	}

	public String getSizeName() {
		return sizeName;
	}

	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}

	public int getPrice() {
		return price;
	}
	public int getReserves() {
		int reserves = (int)(price * 0.03);
		return reserves;
	}
	public int getTotalPrice() {
		int total = price * count;
		return total;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
