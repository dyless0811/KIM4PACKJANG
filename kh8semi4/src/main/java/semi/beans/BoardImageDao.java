package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardImageDao {
	public void insert(BoardImageDto boardImageDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into boardimage values(boardimage_seq.nextval,? ,? ,? ,? ,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardImageDto.getBoardNo());
		ps.setString(2, boardImageDto.getBoardUploadName());
		ps.setString(3, boardImageDto.getBoardSaveName());
		ps.setLong(4, boardImageDto.getBoardFileSize());
		ps.setString(5, boardImageDto.getBoardFileType());
		ps.execute();
		
		con.close();
	}
	
	public BoardImageDto getByBoardNo(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from boardimage where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		BoardImageDto boardImageDto;
		if(rs.next()) {
			boardImageDto = new BoardImageDto();
			boardImageDto.setNo(rs.getInt("no"));
			boardImageDto.setBoardNo(rs.getInt("board_no"));
			boardImageDto.setBoardUploadName(rs.getString("board_uploadname"));
			boardImageDto.setBoardSaveName(rs.getString("board_savename"));
			boardImageDto.setBoardFileSize(rs.getLong("board_file_size"));
			boardImageDto.setBoardFileType(rs.getString("board_file_type"));
		} else {
			boardImageDto = null;			
		}
		
		con.close();
		
		return boardImageDto;
	}
	
	public void deleteByBoardNo(int boardNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "delete from boardimage where board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.execute();
		
		con.close();
	}
}
