package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberLogDao {
	
	
	//로그인하면 MemberLog테이블에 값이 저장되도록 하는 메소드(insert)
	public void insert(String memberId) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into memberlog values(log_seq.nextval, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ps.execute();
		con.close();
	}
	
	//현재 MemberLog테이블에 당일날짜에 해당하는 아이디가 있는지 검색하는 메소드(Search)
	public MemberLogDto search(String memberId) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from memberlog "
							+ "where member_id = ? "
							+ "and to_char(login_date, 'YYYY-MM-DD') = to_char(sysdate, 'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		MemberLogDto memberLogDto;
		if(rs.next()) {
			memberLogDto = new MemberLogDto();
			memberLogDto.setLogNo(rs.getInt("log_no"));
			memberLogDto.setMemberId(rs.getString("member_id"));
			memberLogDto.setLoginDate(rs.getDate("login_date"));
		}else {
			memberLogDto = null;
		}
		
		con.close();
		
		return memberLogDto;
	}
}
