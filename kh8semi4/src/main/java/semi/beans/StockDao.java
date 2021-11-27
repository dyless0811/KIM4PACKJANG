package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StockDao {
	
	//1. 상품번호를 이용해서 stock정보를 가져오는 메소드
	public StockDto get(int productNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select S.* from product P inner join stock S on P.no = S.product_no where P.no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		StockDto stock;
		if(rs.next()) {
			stock = new StockDto();
			stock.setNo(rs.getInt("no"));
			stock.setColorNo(rs.getInt("color_no"));
			stock.setSizeNo(rs.getInt("size_no"));
			stock.setProductNo(rs.getInt("product_no"));
			stock.setStockDate(rs.getString("stock_date"));
			stock.setStockChange(rs.getInt("stock_change"));
			
		}else {
			stock = null;
		}
		
		con.close();
		
		return stock;
	}
	
	//상품번호 색상번호 사이즈번호로 재고 수량을 계산해서 반환하는 메소드
	public int getStockCount(int productNo, int colorNo, int sizeNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(stock_change) from stock where product_no = ? and color_no = ? and size_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ps.setInt(2, colorNo);
		ps.setInt(3, sizeNo);
		ResultSet rs = ps.executeQuery();
		
		int count;
		if(rs.next()) {
			count = rs.getInt(1);
		} else {
			count = 0;
		}
		con.close();
		
		return count;
	}
	
	//2. 재고 정보 등록 메소드
	public void insert(StockDto stockDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into stock values(stock_seq.nextval, ?, ?, ?, sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, stockDto.getColorNo());
		ps.setInt(2, stockDto.getSizeNo());
		ps.setInt(3, stockDto.getProductNo());
		ps.setInt(4, stockDto.getStockChange());
		
		ps.execute();
		con.close();
	}
	
	//3. 재고 정보 업데이트 메소드
	public boolean update(StockDto stockDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "update stock set stock_change = ? + stock_change where product_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, stockDto.getStockChange());
		ps.setInt(2, stockDto.getProductNo());
		
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	//4. 상품번호를 이용해서 재고를 계산한 뒤 값을 가져오는 메소드
	public int stockCount(int productNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(stock_change) from stock where product_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, productNo);
		ResultSet rs = ps.executeQuery();
		
		int count;
		if(rs.next()) {
			count = rs.getInt(1);
		} else {
			count = 0;
		}
		con.close();
		
		return count;
	}
}
