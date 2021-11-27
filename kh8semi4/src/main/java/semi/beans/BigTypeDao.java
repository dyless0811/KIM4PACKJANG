package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BigTypeDao {
	//추가
	public void insert(BigTypeDto bigtypeDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql="insert into bigtype values(bigtype_seq.nextval,?)";
		
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, bigtypeDto.getName());
		
		ps.execute();
		
		con.close();	
	}
	//수정
	public boolean update(BigTypeDto bigTypeDto) throws Exception{
		Connection con=JdbcUtils.connect();
		String sql="update bigType set name=? where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bigTypeDto.getName());
		ps.setInt(2, bigTypeDto.getNo());
		
		int result = ps.executeUpdate();
		
		con.close();
		return result>0;	
	}
	//삭제
	public boolean delete(int no)throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="delete bigType where no=?";
		
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setInt(1, no);
		
		int result = ps.executeUpdate();
		
		con.close();
		return result>0;	
	}
	//조회
	public List<BigTypeDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="select * from bigType order by no asc";
		
		PreparedStatement ps= con.prepareStatement(sql);
		
		ResultSet rs= ps.executeQuery();
		List<BigTypeDto> list= new ArrayList<>();
		while(rs.next()) {
			BigTypeDto bigTypeDto= new BigTypeDto();
			
			bigTypeDto.setNo(rs.getInt("no"));
			bigTypeDto.setName(rs.getString("name"));
			
			list.add(bigTypeDto);
		}
		con.close();
		
		return list;
	}
	

	
	//조회
	public boolean list9() throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="select count(*) from bigtype";
		
		PreparedStatement ps= con.prepareStatement(sql);
		
		ResultSet rs= ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
	
		con.close();
		
		return count<9;
	}
	
	//단일조회
	public  BigTypeDto get(int no) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="select * from bigType where no= ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,no);
		ResultSet rs= ps.executeQuery();
		
		BigTypeDto bigTypeDto;
		
		if(rs.next()) {
			bigTypeDto=new BigTypeDto();
			
			bigTypeDto.setNo(rs.getInt("no"));
			bigTypeDto.setName(rs.getString("name"));
		}else {
			bigTypeDto=null;
		}
		
		con.close();
		return bigTypeDto;
	}
}
