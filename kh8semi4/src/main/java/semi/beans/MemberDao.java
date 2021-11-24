package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {

	// 회원가입 메소드
	public void join(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "insert into member values(?, ?, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'), sysdate, 0,'회원',?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getId());
		ps.setString(2, memberDto.getPw());
		ps.setString(3, memberDto.getName());
		ps.setString(4, memberDto.getAddress());
		ps.setString(5, memberDto.getPhone());
		ps.setString(6, memberDto.getEmail());
		ps.setString(7, memberDto.getBirth());
		ps.setString(8, memberDto.getGender());
		ps.execute();

		con.close();
	}

	// 회원 탈퇴 기능
	public boolean quit(String id, String pw) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "delete member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 목록 조회 기능
	public List<MemberDto> list() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from member order by join desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> memberList = new ArrayList<>();
		while (rs.next()) {
			MemberDto memberDto = new MemberDto();

			memberDto.setId(rs.getString("id"));
			memberDto.setPw(rs.getString("pw"));
			memberDto.setName(rs.getString("name"));
			memberDto.setAddress(rs.getString("address"));
			memberDto.setPhone(rs.getString("phone"));
			memberDto.setEmail(rs.getString("email"));
			memberDto.setBirth(rs.getString("birth"));
			memberDto.setJoin(rs.getDate("join"));
			memberDto.setPoint(rs.getInt("point"));
			memberDto.setGrade(rs.getString("grade"));
			memberDto.setGender(rs.getString("gender"));

			memberList.add(memberDto);
		}
		con.close();

		return memberList;
	}

	// 회원 상세 조회
	public MemberDto get(String id) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		MemberDto memberDto;

		if (rs.next()) {
			memberDto = new MemberDto();

			memberDto.setId(rs.getString("id"));
			memberDto.setPw(rs.getString("pw"));
			memberDto.setName(rs.getString("name"));
			memberDto.setAddress(rs.getString("address"));
			memberDto.setPhone(rs.getString("phone"));
			memberDto.setEmail(rs.getString("email"));
			memberDto.setBirth(rs.getString("birth"));
			memberDto.setJoin(rs.getDate("join"));
			memberDto.setPoint(rs.getInt("point"));
			memberDto.setGrade(rs.getString("grade"));
			memberDto.setGender(rs.getString("gender"));
		} else {
			memberDto = null;
		}
		con.close();
		
		return memberDto;
}
	//휴대폰 번호 조회 메소드
	public MemberDto getPhone(String phone) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select * from member where phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, phone);
		
		ResultSet rs = ps.executeQuery();

		MemberDto memberDto;

		if (rs.next()) {
			memberDto = new MemberDto();
			memberDto.setPhone(rs.getString("phone"));
		} else {
			memberDto = null;
		}
		con.close();
		
		return memberDto;
		
	}

	//개인정보 변경 메소드
	public boolean edit(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update member "
				+ "set "
							+ "pw = ?, "
							+ "address = ?, "
							+ "phone = ?, "
							+ "email = ?, "
							+ "birth = to_date(?, 'YYYY-MM-DD'), "
							+ "gender = ? "
				+ "where "
							+ "id = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getPw());
		ps.setString(2, memberDto.getAddress());
		ps.setString(3, memberDto.getPhone());
		ps.setString(4, memberDto.getEmail());
		ps.setString(5, memberDto.getBirth());
		ps.setString(6, memberDto.getGender());
		ps.setString(7, memberDto.getId());
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}
	
	// 개인정보 변경 메소드(관리자용)
		public boolean adminMemberEdit(MemberDto memberDto) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "update member "
					+ "set "
								+ "name = ?, "
								+ "address = ?, "
								+ "phone = ?, "
								+ "email = ?, "
								+ "birth = to_date(?, 'YYYY-MM-DD'), "
								+ "gender = ?, "
								+ "grade = ? "
					+ "where "
								+ "id = ? and pw = ?";
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDto.getName());
			ps.setString(2, memberDto.getAddress());
			ps.setString(3, memberDto.getPhone());
			ps.setString(4, memberDto.getEmail());
			ps.setString(5, memberDto.getBirth());
			ps.setString(6, memberDto.getGender());
			ps.setString(7, memberDto.getGrade());
			ps.setString(8, memberDto.getId());
			ps.setString(9, memberDto.getPw());
			int result = ps.executeUpdate();

			con.close();

			return result > 0;
		}

	// 비밀번호 변경 메소드
	public boolean editPassword(String id, String pw, String changePw) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update member set pw = ? where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, changePw);// 바꿀비밀번호
		ps.setString(2, id);// 현재아이디
		ps.setString(3, pw);// 현재비밀번호
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}
	
	// 회원 목록 검색
	public List<MemberDto> search(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from member where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<MemberDto> list = new ArrayList<>();
		while(rs.next()) {
			MemberDto memberDto = new MemberDto();
			
			memberDto.setId(rs.getString("id"));
			memberDto.setId(rs.getString("pw"));
			memberDto.setId(rs.getString("name"));
			memberDto.setId(rs.getString("address"));
			memberDto.setId(rs.getString("phone"));
			memberDto.setId(rs.getString("email"));
			memberDto.setId(rs.getString("birth"));
			memberDto.setId(rs.getString("join"));
			memberDto.setId(rs.getString("point"));
			memberDto.setId(rs.getString("grade"));
			memberDto.setId(rs.getString("gender"));
			
			list.add(memberDto);
			
		}
		
		con.close();
		
		return list;
	}
	//아이디 찾기
	public String findId(String name, String phone) throws Exception {
		String id = null;
		
		Connection con = JdbcUtils.connect();
		String sql  = "select id from member where name=? and phone=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, phone);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			id = rs.getString("id");
		}
		return id;
	}
	//비밀번호 찾기
	public String findpw(String id, String email, String phone) throws Exception {
		String pw = null;
		
		Connection con = JdbcUtils.connect();
		String sql = "select pw from member where id = ? and email = ? and phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, email);
		ps.setString(3, phone);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			pw = rs.getString("pw");
		}
		return pw;
	}
	
	//관리자 페이지에서 회원의 개수를 가져오는 메소드(전체목록)
	 public int count() throws Exception{
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from member";
		  PreparedStatement ps = con.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
		  con.close();
		  return count;
		  
	  }
	 
	 //관리자 페이지에서 회원의 개수를 가져오는 메소드(검색)
	  public int count(String column,String keyword) throws Exception{
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from member where instr(#1, ?) > 0";
		  sql=sql.replace("#1",column);
		  PreparedStatement ps = con.prepareStatement(sql);
		  ps.setString(1, keyword);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
		  con.close();
		  return count;
		  
	  }
	  
	  //관리자 페이지에서 회원목록의 리스틀 가져오는 메소드(전체)
	  public List<MemberDto> listByRownum(int begin, int end) throws Exception{
		  	Connection con = JdbcUtils.connect();
		  	
		  	String sql = "select * from("
			  					+ "select rownum rn, tmp.* from("
			  						+ "select * from member order by join desc"
			  					+ ")tmp"
		  					+ ")where rn between ? and ?";
		  	PreparedStatement ps = con.prepareStatement(sql);
		  	ps.setInt(1, begin);
		  	ps.setInt(2, end);
		  	ResultSet rs = ps.executeQuery();
		  	
		  	List<MemberDto> memberList = new ArrayList<>();
		  	while(rs.next()) {
		  		MemberDto memberDto = new MemberDto();
		  		
		  		memberDto.setId(rs.getString("id"));
				memberDto.setPw(rs.getString("pw"));
				memberDto.setName(rs.getString("name"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setPhone(rs.getString("phone"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setBirth(rs.getString("birth"));
				memberDto.setJoin(rs.getDate("join"));
				memberDto.setPoint(rs.getInt("point"));
				memberDto.setGrade(rs.getString("grade"));
				memberDto.setGender(rs.getString("gender"));
				
				memberList.add(memberDto);
		  	}
		  	
		  	con.close();
		  	
		  	return memberList;
	  }
	
	//관리자 페이지에서 회원목록의 리스트를 가져오는 메소드(검색)
	public List<MemberDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception{
		Connection con = JdbcUtils.connect();
	  	
	  	String sql = "select * from("
		  					+ "select rownum rn, tmp.* from("
		  						+ "select * from member where instr(#1, ?) > 0 "
		  						+ "order by join desc"
		  					+ ")tmp"
	  					+ ")where rn between ? and ?";
	  	sql = sql.replace("#1", column);
	  	PreparedStatement ps = con.prepareStatement(sql);
	  	ps.setString(1, keyword);
	  	ps.setInt(2, begin);
	  	ps.setInt(3, end);
	  	ResultSet rs = ps.executeQuery();
	  	
	  	List<MemberDto> memberList = new ArrayList<>();
	  	while(rs.next()) {
	  		MemberDto memberDto = new MemberDto();
	  		
	  		memberDto.setId(rs.getString("id"));
			memberDto.setPw(rs.getString("pw"));
			memberDto.setName(rs.getString("name"));
			memberDto.setAddress(rs.getString("address"));
			memberDto.setPhone(rs.getString("phone"));
			memberDto.setEmail(rs.getString("email"));
			memberDto.setBirth(rs.getString("birth"));
			memberDto.setJoin(rs.getDate("join"));
			memberDto.setPoint(rs.getInt("point"));
			memberDto.setGrade(rs.getString("grade"));
			memberDto.setGender(rs.getString("gender"));
			
			memberList.add(memberDto);
	  	}
	  	
	  	con.close();
	  	
	  	return memberList;
	}

	
}