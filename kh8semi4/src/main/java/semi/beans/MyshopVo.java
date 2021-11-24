package semi.beans;

public class MyshopVo {
	private int basketCount;
	private int readyCount;
	private int shippingCount;
	private int boughtCount;
	
	public int getBasketCount() {
		return basketCount;
	}
	public void setBasketCount(int basketCount) {
		this.basketCount = basketCount;
	}
	public int getReadyCount() {
		return readyCount;
	}
	public void setReadyCount(int readyCount) {
		this.readyCount = readyCount;
	}
	public int getShippingCount() {
		return shippingCount;
	}
	public void setShippingCount(int shippingCount) {
		this.shippingCount = shippingCount;
	}
	public int getBoughtCount() {
		return boughtCount;
	}
	public void setBoughtCount(int boughtCount) {
		this.boughtCount = boughtCount;
	}
	@Override
	public String toString() {
		return "myshopVo [basketCount=" + basketCount + ", readyCount=" + readyCount + ", shippingCount="
				+ shippingCount + ", boughtCount=" + boughtCount + "]";
	}
	
	
}
