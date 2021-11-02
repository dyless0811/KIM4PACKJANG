package semi.beans;

public class ColorDto{
	private int no;
	private String colorName;
	//setter getter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;

	}
	//to string
	@Override
	public String toString() {
		return "ColorDto [no=" + no + ", colorName=" + colorName + "]";
	}
	//생정자
	public ColorDto() {
		super();
	}
	
	
	

}
