package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BasketDao {
	public List<ProductDto> BasketProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select product.* from basket inner join product on basket.product_no = product.no where basket.member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto );
		}
			con.close();
			return list;
		}
	}