package semi.beans;

public class ProductImageDto {
private int no;
private int productNo;
private String productFileSaveName;
private String productFileUploadName;
private long productFileSize;
private String productFileType;

//setter & getter 
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
public String getProductFileSaveName() {
	return productFileSaveName;
}
public void setProductFileSaveName(String productFileSaveName) {
	this.productFileSaveName = productFileSaveName;
}
public String getProductFileUploadName() {
	return productFileUploadName;
}
public void setProductFileUploadName(String productFileUploadName) {
	this.productFileUploadName = productFileUploadName;
}
public long getProductFileSize() {
	return productFileSize;
}
public void setProductFileSize(long productFileSize) {
	this.productFileSize = productFileSize;
}
public String getProductFileType() {
	return productFileType;
}
public void setProductFileType(String productFileType) {
	this.productFileType = productFileType;
}

//생성자

public ProductImageDto() {
	super();
}
//toString


@Override
public String toString() {
	return "ProductImageDto [no=" + no + ", productNo=" + productNo + ", productFileSaveName=" + productFileSaveName
			+ ", productFileUploadName=" + productFileUploadName + ", productFileSize=" + productFileSize
			+ ", productFileType=" + productFileType + "]";
}



}
