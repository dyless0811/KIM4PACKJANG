package semi.vo;

public class BuyProductVo {
	private int productNo;
	private int basketNo;
	private String sizeName;
	private String cololrName;
	private String productFileSavename;
	private String productDescription;
	private int price;
	private int count;
	private int saveMoney;
	private int totalPrice;
	
	public BuyProductVo() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public String getCololrName() {
		return cololrName;
	}
	public void setCololrName(String cololrName) {
		this.cololrName = cololrName;
	}
	public String getProductFileSavename() {
		return productFileSavename;
	}
	public void setProductFileSavename(String productFileSavename) {
		this.productFileSavename = productFileSavename;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSaveMoney() {
		return saveMoney;
	}
	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
