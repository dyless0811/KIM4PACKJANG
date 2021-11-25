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
	//좋아요 목록
		public List<WishlistVo> WishProductMember2(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select i.product_file_savename, p.no product_no, p.name product_name,p.price, w.no wishlist_no from wishlist w inner join product p on w.product_no = p.no inner join productimage i on p.no = i.product_no where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			List<WishlistVo> list = new ArrayList<>();
			while(rs.next()) {
				WishlistVo wishlistVo = new WishlistVo();
				wishlistVo.setProductFileSavename(rs.getString("product_file_savename"));
				wishlistVo.setProductNo(rs.getInt("product_no"));
				wishlistVo.setProductName(rs.getString("product_name"));
				wishlistVo.setPrice(rs.getInt("price"));
				wishlistVo.setWishlistNo(rs.getInt("wishlist_no"));
				
				list.add(wishlistVo);
			}
				con.close();
				return list;
		}
		//좋아요 증가 기능
		public boolean likeUp(int boardNo) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "update board set board_read = board_read + 1 where board_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}

		public boolean delete(int wishlistNo) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "delete from wishlist where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, wishlistNo);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
}