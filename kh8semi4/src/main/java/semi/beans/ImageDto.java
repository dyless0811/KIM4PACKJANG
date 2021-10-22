package semi.beans;

public class ImageDto {
	private int no;
	private int productNo;
	private String bodyPath;
	private String thumPath;
	
	public ImageDto() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getBodyPath() {
		return bodyPath;
	}
	public void setBodyPath(String bodyPath) {
		this.bodyPath = bodyPath;
	}
	public String getThumPath() {
		return thumPath;
	}
	public void setThumPath(String thumPath) {
		this.thumPath = thumPath;
	}
	
	
}
