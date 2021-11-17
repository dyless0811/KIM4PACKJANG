package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
	
	public boolean insert(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into reply values(reply_seq.nextval, ?, ?, ?, ?, default)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getMemberId());
		ps.setInt(2, replyDto.getProductNo());
		ps.setInt(3, replyDto.getStarPoint());
		ps.setString(4, replyDto.getContent());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	public List<ReplyDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from reply order by time desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> replyList = new ArrayList<>();
		
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setNo(rs.getInt("no"));
			replyDto.setMemberId(rs.getString("member_id"));
			replyDto.setProductNo(rs.getInt("product_no"));
			replyDto.setStarPoint(rs.getInt("starpoint"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			replyList.add(replyDto);
		}
		
		con.close();
		
		return replyList;
	}
	
	public List<ReplyDto> listByRownum(int begin,int end)throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="select * from("
				+ "select rownum rn ,TMP.*from( "
				+ "select * from reply order by time desc "
				+ ")TMP "
				+ ")where rn between ? and ? ";
		
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		

		List<ReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setNo(rs.getInt("no"));
			replyDto.setMemberId(rs.getString("member_id"));
			replyDto.setProductNo(rs.getInt("product_no"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			list.add(replyDto);
		}
		con.close();
		
		return list;
	}
}
