package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public BoardTypeDto get(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from boardType where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		ResultSet rs = ps.executeQuery();
		
		BoardTypeDto boardTypeDto = null;
		if(rs.next()) {
			boardTypeDto = new BoardTypeDto();
			boardTypeDto.setNo(rs.getInt("no"));
			boardTypeDto.setName(rs.getString("name"));
		}
		con.close();
		
		return boardTypeDto;
	}
	
	public List<BoardTypeDto> list() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from boardType";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BoardTypeDto> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardTypeDto boardTypeDto = new BoardTypeDto();
			boardTypeDto.setNo(rs.getInt("no"));
			boardTypeDto.setName(rs.getString("name"));
			
			list.add(boardTypeDto);
		}
		
		con.close();
		return list;
	}
}
