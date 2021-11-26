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
		
		String sql = "insert into buy values(buy_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, default)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, buyDto.getMemberId());
		ps.setInt(2, buyDto.getProductNo());
		ps.setInt(3, buyDto.getColorNo());
		ps.setInt(4, buyDto.getSizeNo());
		ps.setInt(5, buyDto.getCount());
		ps.setString(6, buyDto.getType());
		ps.execute();
		
		con.close();
	}
	//구매내역 목록
	public List<BuyDto> BuyProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from buy where member_id = ? order by no desc";
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
	
	//적립금 변경 기능
	public boolean updatePoint(int point, String memberId) throws Exception { 
		Connection con = JdbcUtils.connect();
		String sql = "update member set point = point + ? where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, point);
		ps.setString(2, memberId);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	public BuyDto get(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from buy where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		BuyDto buyDto;
		if(rs.next()) {
			buyDto = new BuyDto();
			buyDto.setNo(rs.getInt(1));
			buyDto.setMemberId(rs.getString(2));
			buyDto.setProductNo(rs.getInt(3));
			buyDto.setColorNo(rs.getInt(4));
			buyDto.setSizeNo(rs.getInt(5));
			buyDto.setCount(rs.getInt(6));
			buyDto.setType(rs.getString(7));
			buyDto.setBuyDate(rs.getDate(8));
			buyDto.setStatus(rs.getString(9));
		} else {
			buyDto = null;
		}
		
		con.close();
		
		return buyDto;
	}
	
	public List<BuyDto> buyList() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from buy order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BuyDto> buyList = new ArrayList<>();
		while(rs.next()) {
			BuyDto buy = new BuyDto();
			buy.setNo(rs.getInt("no"));
			buy.setMemberId(rs.getString("member_id"));
			buy.setProductNo(rs.getInt("product_no"));
			buy.setColorNo(rs.getInt("color_no"));
			buy.setSizeNo(rs.getInt("size_no"));
			buy.setCount(rs.getInt("count"));
			buy.setType(rs.getString("type"));
			buy.setBuyDate(rs.getDate("buy_Date"));
			buy.setStatus(rs.getString("status"));
			
			buyList.add(buy);
		}
		
		con.close();
		
		return buyList;
	}
	
	//상태 변경 메소드
	public boolean changeStatus(int no, String status) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "update buy set status = ? where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, status);
		ps.setInt(2, no);
		
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
}
