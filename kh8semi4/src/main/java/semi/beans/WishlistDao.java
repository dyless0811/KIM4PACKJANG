package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDao {

	public void insert(WishlistDto wishlistDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into wishlist values(wishlist_seq.nextval, '?', ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, wishlistDto.getMemberId());
		ps.setInt(2, wishlistDto.getProductNo());
		ps.execute();
		
		con.close();
	}
	
	//좋아요 목록
	public List<WishlistDto>WishProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from wishlist where member_id =? order by product_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<WishlistDto> list = new ArrayList<>();
		while(rs.next()) {
			WishlistDto wishlistDto = new WishlistDto();
			
			wishlistDto.setNo(rs.getInt("no"));
			wishlistDto.setMemberId(rs.getString("member_id"));
			wishlistDto.setProductNo(rs.getInt("product_no"));
			
			list.add(wishlistDto);
		}
			con.close();
			return list;
	}
}
