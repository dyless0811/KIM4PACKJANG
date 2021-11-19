package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductSizeDao {
	public void insert(int sizeNo, int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into productsize values(productcolor_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, sizeNo);
		ps.setInt(2, productNo);
		
		ps.execute();
		
		con.close();
	}
	
	public List<SizeDto> sizeListByProductNo(int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select distinct s.no, s.sz from productsize ps inner join sz s on ps.size_no = s.no where ps.product_no = ? order by s.no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<SizeDto> list = new ArrayList<>();
		while(rs.next()) {
			SizeDto sizeDto = new SizeDto();
			sizeDto.setNo(rs.getInt("no"));
			sizeDto.setSizeName(rs.getString("sz"));
			
			list.add(sizeDto);
		}
		con.close();
		
		return list;
	}
}
