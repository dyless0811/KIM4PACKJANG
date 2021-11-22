package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductSizeDao {
	public void insert(int sizeNo, int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into productsize values(productcolor_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, sizeNo);
		ps.setInt(2, productNo);
		
		ps.execute();
		
		con.close();
	}
	
	public List<SizeDto> sizeListByProductNo(int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select distinct s.no, s.sz from productsize ps inner join sz s on ps.size_no = s.no where ps.product_no = ? order by s.no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		List<SizeDto> list = new ArrayList<>();
		while(rs.next()) {
			SizeDto sizeDto = new SizeDto();
			sizeDto.setNo(rs.getInt("no"));
			sizeDto.setSizeName(rs.getString("sz"));
			
			list.add(sizeDto);
		}
		con.close();
		
		return list;
	}
	
	//상품번호를 이용해서 ProductSize테이블과 Sz테이블을 이너조인하여
	//해당 상품의 ProductSize테이블의 정보를 가져오는 메소드
	public ProductSizeDto getProductSizeData(int productNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select R.* from product P "
						+ "inner join productsize R on P.no = R.product_no "
						+ "inner join sz S on R.size_no = S.no "
						+ "where P.no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		ProductSizeDto pSDto;
		if(rs.next()) {
			pSDto = new ProductSizeDto();
			pSDto.setNo(rs.getInt("no"));
			pSDto.setSizeNo(rs.getInt("size_no"));
			pSDto.setProductNo(rs.getInt("product_no"));
		} else {
			pSDto = null;
		}
		
		
		con.close();
		
		return pSDto;
		
	}
}
