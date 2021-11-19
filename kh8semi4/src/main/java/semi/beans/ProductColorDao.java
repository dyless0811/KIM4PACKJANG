package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductColorDao {
	public void insert(int colorNo, int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into productcolor values(productcolor_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, colorNo);
		ps.setInt(2, productNo);
		
		ps.execute();
		
		con.close();
	}
	
	public List<ColorDto> colorListByProductNo(int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from productsize where product_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<ColorDto> list = new ArrayList<>();
		while(rs.next()) {
			ColorDto colorDto = new ColorDto();
			colorDto.setNo(rs.getInt("no"));
			colorDto.setColorName(rs.getString("color"));
			
			list.add(colorDto);
		}
		con.close();
		
		return list;
	}
}
