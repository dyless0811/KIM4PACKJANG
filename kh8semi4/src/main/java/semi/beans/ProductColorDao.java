package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductColorDao {
	public void insert(int colorNo, int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into productcolor values(productcolor_seq.nextval, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, colorNo);
		ps.setInt(2, productNo);
		
		ps.execute();
		
		con.close();
	}
	
	public List<ColorDto> colorListByProductNo(int productNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select distinct c.no, c.color from productcolor pc inner join color c on pc.color_no = c.no where pc.product_no = ? order by c.no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
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
	
		//상품번호를 이용해서 ProductColor테이블과 Color테이블을 이너조인하여
		//해당 상품의 ProductColor정보를 구하는 메소드
		public ProductColorDto getProductColorData(int productNo) throws Exception{
			Connection con = JdbcUtils.connect();
			
			String sql = "select R.* from product P "
							+ "inner join productcolor R on P.no = R.product_no "
							+ "inner join color C on R.color_no = C.no "
							+ "where P.no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, productNo);
			ResultSet rs = ps.executeQuery();
			
			ProductColorDto pCDto;
			if(rs.next()) {
				pCDto = new ProductColorDto();
				pCDto.setNo(rs.getInt("no"));
				pCDto.setColorNo(rs.getInt("color_no"));
				pCDto.setProductNo(rs.getInt("product_no"));
			} else {
				pCDto = null;
			}
			
			
			con.close();
			
			return pCDto;
			
		}
}
