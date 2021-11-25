package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BasketDao {
	public List<ProductDto> BasketProductMember(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select product.* from basket inner join product on basket.product_no = product.no where basket.member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
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
			
			list.add(productDto );
		}
			con.close();
			return list;
	}
	
	public void insert(BasketDto basketDto) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "insert into basket values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, basketDto.getNo());
		ps.setString(2, basketDto.getMemberId());
		ps.setInt(3, basketDto.getProductNo());
		ps.setInt(4, basketDto.getColorNo());
		ps.setInt(5, basketDto.getSizeNo());
		ps.setInt(6, basketDto.getCount());
		
		ps.execute();
		
		con.close();
	}
	
	public BasketDto get(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select * from basket where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		BasketDto basketDto = null;
		if(rs.next()) {
			basketDto = new BasketDto();
			basketDto.setMemberId(rs.getString("member_id"));
			basketDto.setProductNo(rs.getInt("product_no"));
			basketDto.setColorNo(rs.getInt("color_no"));
			basketDto.setSizeNo(rs.getInt("size_no"));
			basketDto.setCount(rs.getInt("count"));
		}
		
		con.close();
		
		return basketDto;
	}
	
	public int[] getSeqList(int count) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select basket_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		
		int[] seqList = new int[count];
		
		for (int i = 0; i < count; i++) {
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			seqList[i] = rs.getInt(1);
		}
		
		con.close();
		
		return seqList;
	}
	
	public boolean delete(int no) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete from basket where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	//장바구니 전체비우기
	public boolean BasketEmpty(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "delete from basket where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	public List<BasketVo> voListByMemberId(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select i.product_file_savename, p.no product_no, p.name product_name, c.color color_name, s.sz size_name, p.price, b.no basket_no, b.count from basket b "
				+ "inner join product p on b.product_no = p.no "
				+ "inner join productimage i on p.no = i.product_no "
				+ "inner join sz s on b.size_no = s.no "
				+ "inner join color c on b.color_no = c.no "
				+ "where member_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<BasketVo> voList = new ArrayList<>();
		while(rs.next()) {
			BasketVo basketVo = new BasketVo();
			basketVo.setProductFileSavename(rs.getString("product_file_savename"));
			basketVo.setProductNo(rs.getInt("product_no"));
			basketVo.setProductName(rs.getString("product_name"));
			basketVo.setColorName(rs.getString("color_name"));
			basketVo.setSizeName(rs.getString("size_name"));
			basketVo.setPrice(rs.getInt("price"));
			basketVo.setBasketNo(rs.getInt("basket_no"));
			basketVo.setCount(rs.getInt("count"));
			
			voList.add(basketVo);
		}
		
		con.close();
		return voList;
	}

	//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능 ( 목록/ 검색 )
	  public int count()throws Exception {
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from basket";
		  PreparedStatement ps = con.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
//		int count=rs.getInt(1);
		  con.close();
		  return count;
	  }

	public int priceByBaksetNo(int basketNo) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select p.price from product p inner join basket b on b.product_no = p.no where b.no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, basketNo);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int price = rs.getInt(1);
		con.close();
		
		return price;
	}

}