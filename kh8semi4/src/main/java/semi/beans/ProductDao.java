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
		
		String sql ="insert into product values(?,?,?,?,?,0)";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, productDto.getNo());
		ps.setInt(2, productDto.getSmallTypeNo());
		ps.setString(3, productDto.getName());
		ps.setInt(4, productDto.getPrice());
		ps.setString(5, productDto.getDescription());
		
		
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
	public List<ProductDto> listByRownum(String no, String noType, int begin,int end)throws Exception{
		
		//주소에 B가 넘어오거나 S가 넘어올때 알아서 실행하겠지뭐...
		Connection con= JdbcUtils.connect();
		
		String sql="select * from("
							+ "select rownum rn ,TMP.*from( "
								+ "select * from product P "
								+ "inner join smalltype S "
								+ "on P.small_type_no = S.no "
								+ "inner join bigtype B "
								+ "on S.bigtype_no = B.no "
								+ "where #1.no = ? "
								+ "order by S.no desc "
							+ ")TMP "
						+ ")where rn between ? and ? ";
		sql = sql.replace("#1", noType);
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(no));
		ps.setInt(2, begin);
		ps.setInt(3, end);
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
	public  List<ProductDto> searchByRownum(String no, String noType, int begin,int end,String column, String keyword) throws Exception{
	Connection con = JdbcUtils.connect();
	
	 String sql = "select * from ("
	 		  + "select rownum rn,tmp.*from("
	 		    + "select * from product where instr(#1, ?) > 0 order by no desc"
	 		  + ")tmp"
	 		+ ")where rn between ? and ?";
	 sql = sql.replace("#1", column);
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
public int count(String noType, String no)throws Exception {
	  Connection con = JdbcUtils.connect();
	  String sql="select count(*) from("
		  				+ "select * from product P "
		  				+ "inner join smalltype S "
		  				+ "on P.small_type_no = S.no "
		  				+ "inner join bigtype B "
		  				+ "on S.bigtype_no = B.no "
		  				+ "where S.#1 = ? "
		  				+ "order by P.no desc"
	  				+ ")";
	  if(noType.equals("B")) {		  
		  sql = sql.replace("#1", "bigtype_no");
	  }else {		  
		  sql = sql.replace("#1", "no");
	  }

	  PreparedStatement ps = con.prepareStatement(sql);
	  ps.setInt(1, Integer.parseInt(no));
	  ResultSet rs=ps.executeQuery();
	  rs.next();
	  
	  int count=rs.getInt("count(*)");

	  con.close();
	  return count;
}

public int count(String noType, String no, String column,String keyword) throws Exception{
	  Connection con = JdbcUtils.connect();
	  String sql="select count(*) from("
				+ "select * from product P "
				+ "inner join smalltype S "
				+ "on P.small_type_no = S.no "
				+ "inner join bigtype B "
				+ "on S.bigtype_no = B.no "
				+ "where S.#1 = ? and instr(P.#2, ?)"
				+ "order by P.no desc"
			+ ")";
	  if(noType.equals("B")) {		  
		  sql = sql.replace("#1", "bigtype_no");
	  }else {		  
		  sql = sql.replace("#1", "no");
	  }
	  sql = sql.replace("#2", column);

	  PreparedStatement ps = con.prepareStatement(sql);
	  ps.setInt(1, Integer.parseInt(no));
	  ps.setString(2, keyword);
	  ResultSet rs=ps.executeQuery();
	  rs.next();
	  
	  int count=rs.getInt("count(*)");
	  
	  con.close();
	  return count;
	  
}
  

//리뷰 수를 기준으로 정렬된 목록
public List<ProductDto> listByReplyCount() throws Exception {
	
	Connection con = JdbcUtils.connect();
	String sql = "select p.*, c.cnt "
				+ "from product p "
				+ "inner join ("
					+ "select r.product_no, count(*) cnt "
					+ "from product p "
					+ "inner join reply r "
					+ "on r.product_no = p.no "
					+ "group by r.product_no "
					+ "order by count(*) desc) c "
				+ "on p.no = c.product_no "
				+ "order by c.cnt desc";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	List<ProductDto> list = new ArrayList<>();
	
	while(rs.next()) {
		ProductDto productDto = new ProductDto();
		productDto.setNo(rs.getInt("no"));
		productDto.setSmallTypeNo(rs.getInt("small_type_no"));
		productDto.setName(rs.getString("name"));
		productDto.setPrice(rs.getInt("price"));
		
		list.add(productDto);
	}
	
	con.close();
	
	return list;
}
	//3. 시퀀스 번호를 미리 확인하는 메소드
	public int getSeq() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select product_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int seqNo = rs.getInt(1);
		con.close();
		
		return seqNo;
	}
	//상품 게시글 클릭시 조회수 증가 기능 
		public boolean readUp(int no) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "update product set views = views + 1 where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
		
		//상품 게시글 클릭시 조회수 증가 기능 
		public boolean readUp(int no ,String memberId) throws Exception {
			Connection con = JdbcUtils.connect();
			
			String sql = "update product set views = views + 1 where no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int result = ps.executeUpdate();
			
			con.close();
			
			return result > 0;
		}
	
	
	
}
