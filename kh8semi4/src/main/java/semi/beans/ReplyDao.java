package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
		
		public ReplyDto get(int no) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select * from reply where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			
			ReplyDto replyDto = new ReplyDto();
			
			if(rs.next()) {
				replyDto.setNo(rs.getInt("no"));
				replyDto.setBuyNo(rs.getInt("buy_no"));
				replyDto.setStarPoint(rs.getInt("starpoint"));
				replyDto.setContent(rs.getString("content"));
				replyDto.setTime(rs.getDate("time"));
			}
			con.close();
			
			return replyDto;
		}
		
		public String getMemberIdByBuyNo(int no) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select b.member_id from reply r inner join buy b on b.no = r.buy_no where b.no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String memberId = rs.getString(1);
			
			con.close();
			return memberId;
		}
		
		public List<ReplyDto> ProductReplyMember(String memberId) throws Exception{
			Connection con = JdbcUtils.connect();
			String sql = "select buy.*,reply.* from reply left outer join buy on reply.product_no = buy.no where reply.member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			List<ReplyDto>list = new ArrayList<>();
			while(rs.next()) {
				ReplyDto replyDto = new ReplyDto();
				
				replyDto.setNo(rs.getInt("no"));
				replyDto.setBuyNo(rs.getInt("buy_no"));
				replyDto.setStarPoint(rs.getInt("starpoint"));
				replyDto.setContent(rs.getString("content"));
				replyDto.setTime(rs.getDate("time"));
				
				list.add(replyDto);
			}
			con.close();
			return list;
		}

		public List<ProductDto> CanWriteReply(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select product.* from product left outer join buy on product.no = buy.product_no where buy.member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();
			
			List<ProductDto>list  = new ArrayList<>();
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
		//작성가능한 리뷰 메소드
		public List<BuyDto> CanWriteReplyBuyList(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select b.* from product p left outer join buy b on p.no = b.product_no where b.member_id = ? minus select b.* from product p left outer join buy b on p.no = b.product_no inner join reply r on r.buy_no = b.no where b.member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ps.setString(2, memberId);
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
		
	public List<ReplyVo> replyListbyProductNo(int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select r.no, p.no product_no, p.name product_name, c.color color_name, s.sz size_name, r.content, b.member_id, r.starpoint, ri.reply_savename from reply r inner join buy b on b.no = r.buy_no inner join product p on p.no = b.product_no left outer join replyimage ri on ri.reply_no = r.no inner join color c on c.no = b.color_no inner join sz s on b.size_no = s.no where p.no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyVo> list = new ArrayList<>();
		while(rs.next()) {
			ReplyVo replyVo = new ReplyVo();
			replyVo.setNo(rs.getInt(1));
			replyVo.setProductNo(rs.getInt(2));
			replyVo.setProductName(rs.getString(3));
			replyVo.setColorName(rs.getString(4));
			replyVo.setSizeName(rs.getString(5));
			replyVo.setContent(rs.getString(6));
			replyVo.setMemberId(rs.getString(7));
			replyVo.setStarpoint(rs.getInt(8));
			replyVo.setReplySavename(rs.getString(9));
			list.add(replyVo);
		}
		
		con.close();
		
		return list;
	}
	
	public boolean insert(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into reply values(?, ?, ?, ?, default)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyDto.getNo());
		ps.setInt(2, replyDto.getBuyNo());
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
			replyDto.setBuyNo(rs.getInt("buy_no"));
			replyDto.setStarPoint(rs.getInt("starpoint"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			replyList.add(replyDto);
		}
		
		con.close();
		
		return replyList;
	}
	
	public List<ReplyDto> list3(int productNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="select * from("
				+ "select rownum rn ,TMP.*from("
				+ "select * from reply r inner join buy b on b.no = r.buy_no where b.product_no = ? order by time desc"
				+ ")TMP"
				+ ")where rn between 1 and 3";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> replyList = new ArrayList<>();
		
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setNo(rs.getInt("no"));
			replyDto.setBuyNo(rs.getInt("buy_no"));
			replyDto.setStarPoint(rs.getInt("starpoint"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			replyList.add(replyDto);
		}
		
		con.close();
		
		return replyList;
	}
	
	public List<ReplyDto> ProductReplyMember2(String memberId) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select r.* from reply r inner join buy b on b.no = r.buy_no where b.member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto>list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			
			replyDto.setNo(rs.getInt("no"));
			replyDto.setBuyNo(rs.getInt("buy_no"));
			replyDto.setStarPoint(rs.getInt("starpoint"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			list.add(replyDto);
		}
		con.close();
		return list;
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
			replyDto.setBuyNo(rs.getInt("buy_no"));
			replyDto.setContent(rs.getString("content"));
			replyDto.setTime(rs.getDate("time"));
			
			list.add(replyDto);
		}
		con.close();
		
		return list;
	
	}
	
	//최근 리뷰 순서로 정렬한 상품목록
	public List<ReplyListVo> listByReplyTime() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select p.no product_no, p.small_type_no, p.name, p.price, max(r.time) recent_reply, count(r.no) reply_count, avg(r.starpoint) starpoint from product p inner join buy b on p.no = b.product_no inner join reply r on r.buy_no = b.no group by p.no, p.small_type_no, p.name, p.price order by recent_reply desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyListVo> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyListVo replyListVo = new ReplyListVo();
			replyListVo.setProductNo(rs.getInt("product_no"));
			replyListVo.setSmallTypeNo(rs.getInt("small_type_no"));
			replyListVo.setName(rs.getString("name"));
			replyListVo.setPrice(rs.getInt("price"));
			replyListVo.setRecentReply(rs.getString("recent_reply"));
			replyListVo.setReplyCount(rs.getInt("reply_count"));
			replyListVo.setStarpoint(rs.getDouble("starpoint"));
			
			
			list.add(replyListVo);
		}
		
		con.close();
		
		return list;
	}
	//최근 리뷰 순서로 정렬한 Top N VO
	public List<ReplyListVo> listByReplyTime(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
				+ "select p.no product_no, p.small_type_no, p.name, p.price, max(r.time) recent_reply, count(r.no) reply_count, avg(r.starpoint) starpoint from product p inner join buy b on p.no = b.product_no inner join reply r on r.buy_no = b.no group by p.no, p.small_type_no, p.name, p.price order by recent_reply desc"
				+ ")TMP "
				+ ")where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyListVo> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyListVo replyListVo = new ReplyListVo();
			replyListVo.setProductNo(rs.getInt("product_no"));
			replyListVo.setSmallTypeNo(rs.getInt("small_type_no"));
			replyListVo.setName(rs.getString("name"));
			replyListVo.setPrice(rs.getInt("price"));
			replyListVo.setRecentReply(rs.getString("recent_reply"));
			replyListVo.setReplyCount(rs.getInt("reply_count"));
			replyListVo.setStarpoint(rs.getDouble("starpoint"));
			replyListVo.setProductImageSavename((rs.getString("productimage_savename")));
			
			list.add(replyListVo);
		}
		
		con.close();
		
		return list;
	}
	
	//리뷰 수를 기준으로 정렬한 Top N VO
	public List<ReplyListVo> listByReplyCount() throws Exception {
		
		Connection con = JdbcUtils.connect();
		String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
					+ "select p.no product_no, p.small_type_no, p.name, p.price, max(r.time) recent_reply, count(r.no) reply_count, avg(r.starpoint) starpoint, pi.product_file_savename from product p inner join buy b on p.no = b.product_no inner join reply r on r.buy_no = b.no inner join productimage pi on pi.product_no = p.no group by p.no, p.small_type_no, p.name, p.price, pi.product_file_savename order by reply_count desc"
					+ ")TMP "
					+ ")where rn between 1 and 12";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyListVo> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyListVo replyListVo = new ReplyListVo();
			replyListVo.setProductNo(rs.getInt("product_no"));
			replyListVo.setSmallTypeNo(rs.getInt("small_type_no"));
			replyListVo.setName(rs.getString("name"));
			replyListVo.setPrice(rs.getInt("price"));
			replyListVo.setRecentReply(rs.getString("recent_reply"));
			replyListVo.setReplyCount(rs.getInt("reply_count"));
			replyListVo.setStarpoint(rs.getDouble("starpoint"));
			replyListVo.setProductImageSavename((rs.getString("product_file_savename")));
			
			list.add(replyListVo);
		}
		
		con.close();
		
		return list;
	}
	//리뷰순으로 정렬한 TOP20
public List<ReplyListVo> ReplyTop20() throws Exception {
		
		Connection con = JdbcUtils.connect();
		String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
					+ "select p.no product_no, p.small_type_no, p.name, p.price, max(r.time) recent_reply, count(r.no) reply_count, avg(r.starpoint) starpoint, pi.product_file_savename from product p inner join buy b on p.no = b.product_no inner join reply r on r.buy_no = b.no inner join productimage pi on pi.product_no = p.no group by p.no, p.small_type_no, p.name, p.price, pi.product_file_savename order by reply_count desc"
					+ ")TMP "
					+ ")where rn between 1 and 20";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyListVo> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyListVo replyListVo = new ReplyListVo();
			replyListVo.setProductNo(rs.getInt("product_no"));
			replyListVo.setSmallTypeNo(rs.getInt("small_type_no"));
			replyListVo.setName(rs.getString("name"));
			replyListVo.setPrice(rs.getInt("price"));
			replyListVo.setRecentReply(rs.getString("recent_reply"));
			replyListVo.setReplyCount(rs.getInt("reply_count"));
			replyListVo.setStarpoint(rs.getDouble("starpoint"));
			replyListVo.setProductImageSavename((rs.getString("product_file_savename")));
			
			list.add(replyListVo);
		}
		
		con.close();
		
		return list;
	}

	public boolean delete(int replyNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "delete reply where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		int result = ps.executeUpdate();
		
		con.close();
		
		//1 : 삭제 성공
		//0 : 삭제 실패
		return result > 0;
	}

	public int getSeq() throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "select reply_seq.nextval from dual";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs =  ps.executeQuery();
			
			rs.next();
			
			int seqNo = rs.getInt(1);
			con.close();
		
			return seqNo;
	}
}