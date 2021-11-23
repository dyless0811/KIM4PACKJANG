package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SmallTypeDao {
    //추가
    public void insert(SmallTypeDto smalltypeDto) throws Exception{
        Connection con = JdbcUtils.connect();
        String sql = "insert into smalltype values(smalltype_seq.nextval,?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, smalltypeDto.getBigTypeNo());
        ps.setString(2, smalltypeDto.getName());
        
        ps.execute();
        
        con.close();
    }
    
    //수정
    public boolean update(SmallTypeDto smallTypeDto) throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "update smallType set name=? where no=?";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, smallTypeDto.getName());
    	ps.setInt(2, smallTypeDto.getNo());
    	
    	int result = ps.executeUpdate();
    	
    	con.close();
    	return result>0;
    }
    
    //삭제
   public boolean delete(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "delete smallType where no =?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   
	   int result = ps.executeUpdate();
	   
	   con.close();
	   return result>0;
   }
   
   //조회
   public List<SmallTypeDto> list() throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select * from smallType";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   
	   ResultSet rs =ps.executeQuery();
	   List<SmallTypeDto> list = new ArrayList<>();
	   
	   while(rs.next()) {
		   SmallTypeDto smallTypeDto = new SmallTypeDto();
		   
		   smallTypeDto.setNo(rs.getInt("no"));
		   smallTypeDto.setName(rs.getString("name"));
		   list.add(smallTypeDto);
	   }
	   con.close();
	   
	   return list;
   }
   
   //단일 조회
   public SmallTypeDto get(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select * from smallType where no = ?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   ResultSet rs = ps.executeQuery();
	   
	   SmallTypeDto smallTypeDto = new SmallTypeDto();
	   
	   if(rs.next()) {
		   smallTypeDto.setNo(rs.getInt("no"));
		   smallTypeDto.setBigTypeNo(rs.getInt("bigtype_no"));
		   smallTypeDto.setName(rs.getString("name"));
	   }
	   else {
		   smallTypeDto = null;
	   }
	   
	   con.close();
	   return smallTypeDto;
   }



//단일 조회
public List<SmallTypeDto> searchSmallType(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select * from smallType where bigtype_no = ?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   ResultSet rs = ps.executeQuery();
	   
	   List<SmallTypeDto> list = new ArrayList<>();
	   
	   while(rs.next()) {
		   SmallTypeDto smallTypeDto = new SmallTypeDto();
		   smallTypeDto.setNo(rs.getInt("no"));
		   smallTypeDto.setBigTypeNo(rs.getInt("bigtype_no"));
		   smallTypeDto.setName(rs.getString("name"));
		   list.add(smallTypeDto);
	   }
	  
	   
	   con.close();
	   return list;
}
//스몰타입NO로 빅타입NO가져오기
	public int searchBigTypeNo(int no) throws Exception{
	   Connection con = JdbcUtils.connect();
	   String sql = "select bigtype_no from smalltype where no=?";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, no);
	   ResultSet rs = ps.executeQuery();
	   
	   rs.next();
	   int bno =rs.getInt("bigtype_no");
	   
	   con.close();
	   return bno;
}
}