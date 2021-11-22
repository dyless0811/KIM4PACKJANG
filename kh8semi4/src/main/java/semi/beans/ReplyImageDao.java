package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class ReplyImageDao {
	public void insert(ReplyImageDto replyImageDto)throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="insert into productImage values(productImage_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1,replyImageDto.getReplyNo());
		ps.setString(2,replyImageDto.getReplyUploadName());
		ps.setString(3,replyImageDto.getReplySaveName());
		ps.setLong(4,replyImageDto.getReplyFileSize());
		ps.setString(5,replyImageDto.getReplyFileType());
		
		ps.execute();
		
		con.close();
		
	}
	public ReplyImageDto getByReplyNo(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from replyImage"
				+ " inner join reply on replyImage.reply_no = reply.no where reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		ReplyImageDto replyImageDto;
		if(rs.next()) {
			replyImageDto = new ReplyImageDto();
			replyImageDto.setNo(rs.getInt("no"));
			replyImageDto.setReplyNo(rs.getInt("reply_no"));
			replyImageDto.setReplyUploadName(rs.getString("reply_uploadname"));
			replyImageDto.setReplySaveName(rs.getString("reply_savename"));
			replyImageDto.setReplyFileSize(rs.getLong("reply_file_size"));
			replyImageDto.setReplyFileType(rs.getString("reply_file_type"));
		}
		else {
			replyImageDto = null;
		}
		
		con.close();
		
		return replyImageDto;
	}
	public void deleteByReplyNo(int replyNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete from replyimage where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		ps.execute();
		
		con.close();
	}
	
}
