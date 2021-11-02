package semi.beans;

public class SizeDto {
	private int no;
	private String sizeName;
	
	//setter & getter 
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	
	//toString
	@Override
	public String toString() {
		return "SizeDto [no=" + no + ", sizeName=" + sizeName + "]";
	}
	//생성자
	public SizeDto() {
		super();
	}
	
	
	
	
	

}
