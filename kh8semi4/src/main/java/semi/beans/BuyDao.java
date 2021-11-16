package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BuyDao {
	
	//구매내역 추가
	public void insert(BuyDto buyDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into buy values(buy_seq.nextval, ? ,? ,? ,sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getProductNo());
		ps.setString(3, buyDto.getType());
		ps.setDate(4, buyDto.getBuyDate());
		ps.setString(5, buyDto.getStatus());
		ps.execute();
		
		con.close();
	}
	//구매내역 목록
	public List<BuyDto> BuyProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from buy where member_id = ? order by product_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<BuyDto> list = new ArrayList<>();
		while(rs.next()) {
			BuyDto buyDto = new BuyDto();
			
			buyDto.setNo(rs.getInt("no"));
			buyDto.setMemberId(rs.getString("member_id"));
			buyDto.setProductNo(rs.getInt("product_no"));
			buyDto.setType(rs.getString("type"));
			buyDto.setBuyDate(rs.getDate("buy_date"));
			buyDto.setStatus(rs.getString("status"));
			
			list.add(buyDto);
		}
		con.close();
		
		return list;
	}
}
