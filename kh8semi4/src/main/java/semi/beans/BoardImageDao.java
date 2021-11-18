package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
