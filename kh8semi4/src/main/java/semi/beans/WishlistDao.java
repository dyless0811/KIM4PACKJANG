package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDao {
	
	//좋아요 추가
	public void insert(WishlistDto wishlistDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into wishlist values(wishlist_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, wishlistDto.getMemberId());
		ps.setInt(2, wishlistDto.getProductNo());
		ps.execute();
		
		con.close();
	}
	
	//좋아요 목록
	public List<ProductDto>WishProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select product.* from wishlist inner join product on wishlist.product_no = product.no where wishlist.member_id = ?";
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