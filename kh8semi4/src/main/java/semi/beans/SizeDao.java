package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SizeDao {
    public void insert(SizeDto sizeDto) throws Exception{
        Connection con = JdbcUtils.connect();
        String sql = "insert into sz values(smallType_seq.nextval,?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, sizeDto.getSizeName());
        
        ps.execute();
        
        con.close();
    }
    
    //수정
    public boolean update(SizeDto sizeDto) throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "update sz set sz=? where no=?";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, sizeDto.getSizeName());
    	ps.setInt(2, sizeDto.getNo());
    	
    	int result = ps.executeUpdate();
    	
    	con.close();
    	return result>0;
    }
    
    //삭제
   public boolean delete(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "delete sz where no =?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   
	   int result = ps.executeUpdate();
	   
	   con.close();
	   return result>0;
   }
   
   //조회
   public List<SizeDto> list() throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select * from sz";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   
	   ResultSet rs =ps.executeQuery();
	   List<SizeDto> list = new ArrayList<>();
	   
	   while(rs.next()) {
		   SizeDto smallTypeDto = new SizeDto();
		   
		   smallTypeDto.setNo(rs.getInt("no"));
		   smallTypeDto.setSizeName(rs.getString("sz"));
		   list.add(smallTypeDto);
	   }
	   con.close();
	   
	   return list;
   }
   
   //단일 조회
   public SizeDto get(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select * from sz where no = ?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   ResultSet rs = ps.executeQuery();
	   
	   SizeDto sizeDto = new SizeDto();
	   
	   if(rs.next()) {
		   sizeDto.setNo(rs.getInt("no"));
		   sizeDto.setSizeName(rs.getString("sz"));
	   }
	   else {
		   sizeDto = null;
	   }
	   
	   con.close();
	   return sizeDto;
   }
}
