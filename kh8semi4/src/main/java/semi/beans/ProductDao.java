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
		
		String sql="update product set smallTypeNo=?,name=?,price=?,description=? where no=?";
		
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
		
		String sql="select * from product";
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
	
	

}
