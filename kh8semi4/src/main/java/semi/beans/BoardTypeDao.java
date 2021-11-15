package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BoardTypeDao {
	public void insert(BoardTypeDto boardTypeDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into values(boardtype_seq.nextval, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, boardTypeDto.getName());
		
		ps.execute();
		
		con.close();
	}
	
	public boolean delete(int no) throws Exception { 
		Connection con = JdbcUtils.connect();
		String sql = "delete boardtype where no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		int result = ps.executeUpdate();
		
		con.close();
		return result > 0;
	}
}
