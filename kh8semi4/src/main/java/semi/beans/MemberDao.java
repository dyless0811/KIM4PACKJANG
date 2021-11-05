package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {

	//회원가입 메소드
	public void join(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'), sysdate, 0,'회원',?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getId());
		ps.setString(2, memberDto.getPw());
		ps.setString(3, memberDto.getName());
		ps.setString(4, memberDto.getAdrress());
		ps.setString(5, memberDto.getPhone());
		ps.setString(6, memberDto.getEmail());
		ps.setDate(7, memberDto.getBirth());
		ps.setString(8, memberDto.getGender());
		ps.execute();
		
		con.close();
	}
	
	//회원 탈퇴 기능
	public boolean delete(String id, String pw) throws Exception {
		Connection con = JdbcUtils.connect();
	
		String sql="delete member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		int result = ps.executeUpdate();
	
		con.close();
	
		return result > 0;
}
	//목록 조회 기능
	public List<MemberDto> list() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql="select * from member ";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemberDto> memberList = new ArrayList<>();
		while(rs.next()) {
			MemberDto memberDto = new MemberDto();
			
			memberDto.setId(rs.getString("id"));
			memberDto.setPw(rs.getString("pw"));
			memberDto.setName(rs.getString("name"));
			memberDto.setAdrress(rs.getString("adress"));
			memberDto.setPhone(rs.getString("phone"));
			memberDto.setEmail(rs.getString("email"));
			memberDto.setBirth(rs.getDate("birth"));
			memberDto.setJoin(rs.getDate("join"));
			memberDto.setPoint(rs.getInt("point"));
			memberDto.setGrade(rs.getString("grade"));
			memberDto.setGender(rs.getString("gender"));
			
			memberList.add(memberDto);
		}
		con.close();
		
		return memberList;
		}
	
	//회원상세 기능
	public MemberDto get(String id) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		MemberDto memberDto;
		
		if(rs.next()) {
			memberDto = new MemberDto();
			
			memberDto.setId(rs.getString("id"));
			memberDto.setPw(rs.getString("pw"));
			memberDto.setName(rs.getString("name"));
			memberDto.setAdrress(rs.getString("adress"));
			memberDto.setPhone(rs.getString("phone"));
			memberDto.setEmail(rs.getString("email"));
			memberDto.setBirth(rs.getDate("birth"));
			memberDto.setJoin(rs.getDate("join"));
			memberDto.setPoint(rs.getInt("point"));
			memberDto.setGrade(rs.getString("grade"));
			memberDto.setGender(rs.getString("gender"));
		}
		else {
			memberDto = null;
		}
		con.close();
		
		return memberDto;
	}
}
