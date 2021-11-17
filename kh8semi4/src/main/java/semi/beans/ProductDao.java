package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;





public class ProductDao {
	
	//상품 등록
	public void insert(ProductDto productDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql ="insert into product values(product_seq.nextval,?,?,?,?,0)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, productDto.getSmallTypeNo());
		ps.setString(2, productDto.getName());
		ps.setInt(3, productDto.getPrice());
		ps.setString(4, productDto.getDescription());
		
		
		ps.execute();
		
		con.close();
		
	}
	//상품 수정
	public boolean update(ProductDto productDto) throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="update product set small_type_no=?,name=?,price=?,description=? where no=?";
		
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, productDto.getSmallTypeNo());
		ps.setString(2, productDto.getName());
		ps.setInt(3, productDto.getPrice());
		ps.setString(4, productDto.getDescription());
		ps.setInt(5, productDto.getNo());
				
		int result= ps.executeUpdate();
		con.close();
		
		return result>0;
		
	}
	
	//상품 삭제
	public boolean delete(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql="delete product where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		
		int result= ps.executeUpdate();
		con.close();
		
		return result>0;
	}
	
	//상품 조회
	public List<ProductDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql="select * from product order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto);
		}
		con.close();
		
		return list;
		
	}
	//상품 조회(단일조회)
	public ProductDto get(int no)throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="select * from product where no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,no);
		ResultSet rs= ps.executeQuery();
		
		ProductDto productDto;
		
		if(rs.next()) {
			productDto=new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			
		}else {
			productDto=null;
		}
		
		con.close();
		return productDto;
		
	}
	//상품검색
	public List<ProductDto> search(String column, String keyword) throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="select * from product where instr(#1,?)>0 order by #1 asc";
		sql=sql.replace("#1", column);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs =ps.executeQuery();
		
		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto);
		}
		con.close();
		
		return list;
		
		
	}
	//페이징이 가능한 목록
	public List<ProductDto> listByRownum(int begin,int end)throws Exception{
		Connection con= JdbcUtils.connect();
		
		String sql="select * from("
				+ "select rownum rn ,TMP.*from( "
				+ "select * from product order by no desc "
				+ ")TMP "
				+ ")where rn between ? and ? ";
		
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		

		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto);
		}
		con.close();
		
		return list;
		
		

	}
	//검색시 페이징 목록 
	public  List<ProductDto> searchByRownum(int begin,int end,String column, String keyword) throws Exception{
	Connection con = JdbcUtils.connect();
	
	 String sql = "select * from ("
	 		  + "select rownum rn,TMp.*from("
	 		    + "select * from product where instr(#1, ?) > 0 order by no desc"
	 		  + ")TMP"
	 		+ ")where rn between ? and ?";
	 
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, keyword);
	 ps.setInt(2, begin);
	 ps.setInt(3, end);
	 
	 ResultSet rs =  ps.executeQuery();
	 
		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto);
		}
		con.close();
		
		return list;
	}
	
//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능 ( 목록/ 검색 )
public int count()throws Exception {
	  Connection con = JdbcUtils.connect();
	  String sql="select count(*) from product";
	  PreparedStatement ps = con.prepareStatement(sql);
	  ResultSet rs=ps.executeQuery();
	  rs.next();
	  
	  int count=rs.getInt("count(*)");
//	  int count=rs.getInt(1);
	  con.close();
	  return count;
}

public int count(String column,String keyword) throws Exception{
	  Connection con = JdbcUtils.connect();
	  String sql="select count(*) from product where instr(#1,?)>0";
	  sql=sql.replace("#1",column);
	  PreparedStatement ps = con.prepareStatement(sql);
	  ps.setString(1, keyword);
	  ResultSet rs=ps.executeQuery();
	  rs.next();
	  
	  int count=rs.getInt("count(*)");
//	  int count=rs.getInt(1);
	  con.close();
	  return count;
	  
}
//계층형 목록 ( 미완성 )
public List<ProductDto> listByTreeSort(int begin,int end) throws Exception{
	 Connection con = JdbcUtils.connect();
	 String sql = "select* from ("
           + "select rownum rn, TMP.* from ("
               + "select * from product "
               + "connect by prior board_no = board_superno "
               + "start with board_superno is null "
               + "order siblings by board_groupno desc, board_no asc"
           + ")TMP "
       + ")where rn between ? and ?";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setInt(1, begin);
	 ps.setInt(2, end);
	 ResultSet rs=ps.executeQuery();
		List<ProductDto> list = new ArrayList<>();
		while(rs.next()) {
			ProductDto productDto = new ProductDto();
			productDto.setNo(rs.getInt("no"));
			productDto.setSmallTypeNo(rs.getInt("small_type_no"));
			productDto.setName(rs.getString("name"));
			productDto.setPrice(rs.getInt("price"));
			productDto.setDescription(rs.getString("description"));
			productDto.setViews(rs.getInt("views"));
			
			list.add(productDto);
		}
		con.close();
		
		return list;
}

public List<ProductDto> ListByReplyCount() throws Exception {
	
	Connection con = JdbcUtils.connect();
	String sql = "select p.*, c.cnt from product p inner join (select r.product_no, count(*) cnt from product p inner join reply r on r.product_no = p.no group by r.product_no order by count(*) desc) c on p.no = c.product_no order by c.cnt desc";
	PreparedStatement ps = con.prepareStatement(sql);
	List<ProductDto> list = null;
	return list;
}

}
