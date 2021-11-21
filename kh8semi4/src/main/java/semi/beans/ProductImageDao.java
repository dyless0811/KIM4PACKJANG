package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class ProductImageDao {
	public void insert(ProductImageDto productImageDto)throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="insert into productImage values(productImage_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1,productImageDto.getProductNo());
		ps.setString(2,productImageDto.getProductFileUploadName());
		ps.setString(3,productImageDto.getProductFileSaveName());
		ps.setLong(4,productImageDto.getProductFileSize());
		ps.setString(5,productImageDto.getProductFileType());
		
		ps.execute();
		
		con.close();
		
	}
	public ProductImageDto get(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from productImage"
				+ " inner join  product on productImage.product_no = product.no where product_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		ProductImageDto productImageDto;
		if(rs.next()) {
			productImageDto = new ProductImageDto();
			productImageDto.setNo(rs.getInt("no"));
			productImageDto.setProductNo(rs.getInt("product_no"));
			productImageDto.setProductFileUploadName(rs.getString("product_file_uploadname"));
			productImageDto.setProductFileSaveName(rs.getString("product_file_savename"));
			productImageDto.setProductFileSize(rs.getLong("product_file_size"));
			productImageDto.setProductFileType(rs.getString("product_file_type"));
		}
		else {
			productImageDto = null;
		}
		
		con.close();
		
		return productImageDto;
	}
	
}
