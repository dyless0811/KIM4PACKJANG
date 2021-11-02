package semi.beans;

public class ProductDto {
	private int no;
	private int smallTypeNo;
	private String name;
	private int price;
	private String description;
	private int views;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSmallTypeNo() {
		return smallTypeNo;
	}
	public void setSmallTypeNo(int smallTypeNo) {
		this.smallTypeNo = smallTypeNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public ProductDto() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	
}
