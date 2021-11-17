package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
		public List<ReplyDto> ProductReplyMember(String memberId) throws Exception{
			Connection con = JdbcUtils.connect();
			String sql = "select buy.*,reply.* from reply left outer join buy on reply.product_no = buy.no where reply.member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<ReplyDto>list = new ArrayList<>();
			while(rs.next()) {
				ReplyDto replyDto = new ReplyDto();
				
				replyDto.setNo(rs.getInt("no"));
				replyDto.setMemberId(rs.getString("memberId"));
				replyDto.setProductNo(rs.getInt("productNo"));
				replyDto.setStarPoint(rs.getInt("starPoint"));
				replyDto.setContent(rs.getString("content"));
				replyDto.setTime(rs.getDate("time"));
				
				list.add(replyDto);
			}
			con.close();
			return list;
		}
	}