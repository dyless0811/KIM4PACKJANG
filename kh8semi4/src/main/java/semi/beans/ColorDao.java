package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ColorDao {
	public void insert(ColorDto colorDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into color values(color_seq.nextval, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, colorDto.getColorName());
		
		ps.execute();
		
		con.close();
	}
	
	public boolean update(ColorDto colorDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "update color set name = ? where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, colorDto.getColorName());
		ps.setInt(2, colorDto.getNo());
		
		int result = ps.executeUpdate();
		
		con.close();
		return result > 0;
	}
	
	public List<ColorDto> list() throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from color order by no asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		List<ColorDto> list = new ArrayList<>();
		while(rs.next()) {
			ColorDto colorDto = new ColorDto();
			
			colorDto.setNo(rs.getInt("no"));
			colorDto.setColorName(rs.getString("color"));
			list.add(colorDto);
		}
		
		con.close();
		
		return list;
	}
	
	public boolean delete(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete from color where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		int result = ps.executeUpdate();
		
		con.close();
		return result > 0;
	}
	
	//Color_no를 이용해서 검색하는 메소드(단일조회)
	public ColorDto get(int colorNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from color where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, colorNo);
		ResultSet rs = ps.executeQuery();
		
		ColorDto colorDto;
		if(rs.next()) {
			colorDto = new ColorDto();
			colorDto.setNo(rs.getInt("no"));
			colorDto.setColorName(rs.getString("color"));
		} else {
			colorDto = null;
		}
		
		con.close();
		
		return colorDto;
	}
}
