package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.vo.MemberAgeVo;
import semi.vo.PopularItemVo;

public class StatisticsDao {
	
	//금일 매출값을 가져오는 메소드
	public int toDaySales() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(price*B.count) from product P "
							+ "inner join buy B "
							+ "on P.no = B.product_no "
							+ "where to_char(B.buy_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int price = rs.getInt(1);
		
		con.close();
		
		return price;
	}
	
	//월별 매출값을 가져오는 메소드
	public int toMonthSales() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(price*B.count) from product P "
							+ "inner join buy B "
							+ "on P.no = B.product_no "
							+ "where substr(to_char(B.buy_date, 'YYYYMMDD'), 0, 6) = to_char(sysdate, 'YYYYMM')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int price = rs.getInt(1);
		
		con.close();
		
		return price;
	}
	
	//연간 매출값을 가져오는 메소드
	public int toYearSales() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(price*B.count) from product P "
							+ "inner join buy B "
							+ "on P.no = B.product_no "
							+ "where substr(to_char(B.buy_date, 'YYYYMMDD'), 0, 4) = to_char(sysdate, 'YYYY')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int price = rs.getInt(1);
		
		con.close();
		
		return price;
	}
	
	//구간별 매출값을 가져오는 메소드
	public int termToTermSales(String start, String end) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select sum(price * B.count) from product P "
							+ "inner join buy B "
							+ "on P.no = B.product_no "
							+ "where B.buy_date "
							+ "between to_date(?, 'YYYY-MM-DD HH24:MI:SS') "
							+ "and to_date(?, 'YYYY-MM-DD HH24:MI:SS')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, end);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//인기 상품 리스트를 가져오는 메소드
	public List<PopularItemVo> popularList() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select P.name, count(P.no) from buy B "
							+ "inner join product P "
							+ "on B.product_no = P.no "
							+ "where B.status='배송 전' "
							+ "group by P.name "
							+ "order by count(P.no) desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<PopularItemVo> itemList = new ArrayList<>();
		while(rs.next()) {
			PopularItemVo item = new PopularItemVo();
			item.setItemName(rs.getString("name"));
			item.setCount(rs.getInt(2));
			
			itemList.add(item);
		}
		con.close();
		
		return itemList;
	}
	
	//토탈 방문자수를 구하는 메소드
	public int totalVisitantCount() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from memberlog";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//금일 방문자수를 구하는 메소드
	public int todayVisitantCount() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from memberlog where to_char(login_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//회원 남녀 성별을 카운트해오는 메소드
	public int memberGenderCount(String gender) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select count(*) from member where gender = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, gender);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//횐님덜 나이구하는 메소드
	public List<MemberAgeVo> memberAge() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select id, birth from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemberAgeVo> memberAge = new ArrayList<>();
		while(rs.next()) {
			MemberAgeVo age = new MemberAgeVo();
			age.setMemberid(rs.getString("id"));
			age.setAge(rs.getString("birth"));
			
			memberAge.add(age);
		}
		
		con.close();
		
		return memberAge;
	}
	
	//횐님덜 나이대를 구하는 메소드(반환값 count)
	public int memberAgeGroup(int start, int end) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from member "
							+ "where to_number((substr(to_char(sysdate ,'YYYYMMDD'), 0, 4)))"
							+ " - to_number((substr(to_char(birth, 'YYYYMMDD'),0, 4)), '9999') +1 "
						+ "between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//총합 회원 수를 구하는 메소드
	public int memberCount() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
}
