package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




public class BoardDao {
	//1. 게시글 등록(새글) 메소드
	public boolean insert(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into board(no, member_id, boardtype_no, board_title, board_content, board_groupno) "
					+ "values(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getNo());
		ps.setString(2, boardDto.getMemberId());
		ps.setInt(3, boardDto.getBoardTypeNo());
		ps.setString(4, boardDto.getBoardTitle());
		ps.setString(5, boardDto.getBoardContent());
		ps.setInt(6, boardDto.getNo());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	//2. 답글 등록 메소드
	public void insertAnswer(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into board(no, member_id, boardtype_no, board_title, board_content, board_superno, board_groupno, board_depth) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getNo());
		ps.setString(2, boardDto.getMemberId());
		ps.setInt(3, boardDto.getBoardTypeNo());
		
		ps.setString(4, boardDto.getBoardTitle());
		ps.setString(5, boardDto.getBoardContent());
		ps.setInt(6, boardDto.getBoardSuperno());
		ps.setInt(7, boardDto.getBoardGroupno());
		ps.setInt(8, boardDto.getBoardDepth());
		ps.execute();
		
		con.close();
	}
	
	//	게시글 수정 메소드
	public void update(BoardDto boardDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "update board set boardtype_no = ?, board_title = ?, board_content = ? where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardDto.getBoardTypeNo());
		ps.setString(2, boardDto.getBoardTitle());
		ps.setString(3, boardDto.getBoardContent());
		ps.setInt(4, boardDto.getNo());
		ps.execute();
		
		con.close();
	}
	
	//3. 시퀀스 번호를 미리 확인하는 메소드
	public int getSeq() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select board_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int seqNo = rs.getInt(1);
		con.close();
		
		return seqNo;
	}
	
	//4. 게시글 목록 조회 메소드
	public List<BoardDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> boardList = new ArrayList<>();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("no"));
			boardDto.setMemberId(rs.getString("member_id"));
			boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardDate(rs.getDate("board_date"));
			boardDto.setBoardHit(rs.getInt("board_hit"));
			boardDto.setBoardSuperno(rs.getInt("board_superno"));
			boardDto.setBoardGroupno(rs.getInt("board_groupno"));
			boardDto.setBoardDepth(rs.getInt("board_depth"));
			
			boardList.add(boardDto);
		}
		
		con.close();
		
		return boardList;
	}
	
	//5. 게시글 단일 조회 메소드
	public BoardDto get(int boardNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board where no = ? order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ResultSet rs = ps.executeQuery();
		
		BoardDto boardList;
		
		if(rs.next()) {
			boardList = new BoardDto();
			boardList.setNo(rs.getInt("no"));
			boardList.setMemberId(rs.getString("member_id"));
			boardList.setBoardTypeNo(rs.getInt("boardtype_no"));
			boardList.setBoardTitle(rs.getString("board_title"));
			boardList.setBoardContent(rs.getString("board_content"));
			boardList.setBoardDate(rs.getDate("board_date"));
			boardList.setBoardHit(rs.getInt("board_hit"));
			boardList.setBoardSuperno(rs.getInt("board_superno"));
			boardList.setBoardGroupno(rs.getInt("board_groupno"));
			boardList.setBoardDepth(rs.getInt("board_depth"));	
		} else {
			boardList = null;
		}
		
		con.close();
		
		return boardList;
	}
	
	//6. 게시글 내글 조회 메소드
	public List<BoardDto> list(String column, String memberId) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board where instr(#1, ?) > 0 order by board_no desc";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> boardList = new ArrayList<>();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("no"));
			boardDto.setMemberId(rs.getString("member_id"));
			boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardDate(rs.getDate("board_date"));
			boardDto.setBoardHit(rs.getInt("board_hit"));
			boardDto.setBoardSuperno(rs.getInt("board_superno"));
			boardDto.setBoardGroupno(rs.getInt("board_groupno"));
			boardDto.setBoardDepth(rs.getInt("board_depth"));
			
			boardList.add(boardDto);
		}
		
		con.close();
		
		return boardList;
	}
	
	//메뉴바에서 링크누르면 해당 no의 게시글을 반환하는 메소두
	public List<BoardDto> listByLink(int no) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board where boardtype_no = ? order by no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		List<BoardDto> boardList = new ArrayList<>();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("no"));
			boardDto.setMemberId(rs.getString("member_id"));
			boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardDate(rs.getDate("board_date"));
			boardDto.setBoardHit(rs.getInt("board_hit"));
			boardDto.setBoardSuperno(rs.getInt("board_superno"));
			boardDto.setBoardGroupno(rs.getInt("board_groupno"));
			boardDto.setBoardDepth(rs.getInt("board_depth"));
			
			boardList.add(boardDto);
		}
		
		con.close();
		
		return boardList;
	}
	
	//7. 게시글 삭제 메소드
	public boolean delete(int boardNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "delete board where no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		int result = ps.executeUpdate();
		
		con.close();
		
		//1 : 삭제 성공
		//0 : 삭제 실패
		return result > 0;
	}
	
	//조회 확인 메소드
	public void view(int no, String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		System.out.println("no = "+no);
		System.out.println("memberId = "+memberId);
		String sql = "update board set board_hit = board_hit+1 where no = ? and member_id != ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.setString(2, memberId);
		ps.execute();
		
		con.close();
	}
	//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능 ( 목록/ 검색 )
	  public int count()throws Exception {
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from board";
		  PreparedStatement ps = con.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
//		  int count=rs.getInt(1);
		  con.close();
		  return count;
	  }
	  public int count(int boardTypeNo)throws Exception {
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from board where boardtype_no = ?";
		  PreparedStatement ps = con.prepareStatement(sql);
		  ps.setInt(1, boardTypeNo);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
//		  int count=rs.getInt(1);
		  con.close();
		  return count;
	  }
	  
	  public int count(String column,String keyword) throws Exception{
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from board where instr(#1,?)>0";
		  sql=sql.replace("#1",column);
		  PreparedStatement ps = con.prepareStatement(sql);
		  ps.setString(1, keyword);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
//		  int count=rs.getInt(1);
		  con.close();
		  return count;
		  
	  }
	  public int count(int boardTypeNo ,String column,String keyword) throws Exception{
		  Connection con = JdbcUtils.connect();
		  String sql="select count(*) from board where boardtype_no = ? and instr(#1,?)>0";
		  sql=sql.replace("#1",column);
		  PreparedStatement ps = con.prepareStatement(sql);
		  ps.setInt(1, boardTypeNo);
		  ps.setString(2, keyword);
		  ResultSet rs=ps.executeQuery();
		  rs.next();
		  
		  int count=rs.getInt("count(*)");
//		  int count=rs.getInt(1);
		  con.close();
		  return count;
		  
	  }
	
	//댓글 개수 갱신 기능 
	public boolean refreshReplyCount(int boardNo) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql="update board "
				+  "set board_reply=(select count(*) from reply where board_no=?) "
				+  "where board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNo);
		ps.setInt(2, boardNo);
		
		int result =ps.executeUpdate();
		con.close();
		
		return result>0;

	}
	
	
	
	//계층형 목록
	public List<BoardDto> listByTreeSort(int begin,int end) throws Exception{
		 Connection con = JdbcUtils.connect();
		 String sql = "select* from ("
	             + "select rownum rn, TMP.* from ("
	                 + "select * from board "
	                 + "connect by prior no = board_superno "
	                 + "start with board_superno is null "
	                 + "order siblings by board_groupno desc,no asc"
	             + ")TMP "
	         + ")where rn between ? and ?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setInt(1, begin);
		 ps.setInt(2, end);
		 ResultSet rs=ps.executeQuery();
		 List<BoardDto> BoardList = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setNo(rs.getInt("no"));
				boardDto.setMemberId(rs.getString("member_id"));
				boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardContent(rs.getString("board_content"));
				boardDto.setBoardDate(rs.getDate("board_date"));
				boardDto.setBoardHit(rs.getInt("board_hit"));
				boardDto.setBoardSuperno(rs.getInt("board_superno"));
				boardDto.setBoardGroupno(rs.getInt("board_groupno"));
				boardDto.setBoardDepth(rs.getInt("board_depth"));
				
				
				BoardList.add(boardDto);
			}
			
			con.close();
			
			return BoardList;
	}
	//계층형 목록
	public List<BoardDto> listByTreeSort(int boardTypeNo, int begin,int end) throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select* from ("
				+ "select rownum rn, TMP.* from ("
				+ "select * from board "
				+ "where boardtype_no = ? "
				+ "connect by prior no = board_superno "
				+ "start with board_superno is null "
				+ "order siblings by board_groupno desc,no asc"
				+ ")TMP "
				+ ")where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardTypeNo);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs=ps.executeQuery();
		List<BoardDto> BoardList = new ArrayList<>();
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			
			boardDto.setNo(rs.getInt("no"));
			boardDto.setMemberId(rs.getString("member_id"));
			boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
			boardDto.setBoardTitle(rs.getString("board_title"));
			boardDto.setBoardContent(rs.getString("board_content"));
			boardDto.setBoardDate(rs.getDate("board_date"));
			boardDto.setBoardHit(rs.getInt("board_hit"));
			boardDto.setBoardSuperno(rs.getInt("board_superno"));
			boardDto.setBoardGroupno(rs.getInt("board_groupno"));
			boardDto.setBoardDepth(rs.getInt("board_depth"));
			
			
			BoardList.add(boardDto);
		}
		
		con.close();
		
		return BoardList;
	}

	//계층형 목록 /검색
	public List<BoardDto> searchByTreeSort(int boardTypeNo, String column, String keyword ,int begin,int end) throws Exception{
		 Connection con = JdbcUtils.connect();
		 String sql = "select * from ( "
		 		  + "select rownum rn,TMp.* from( "
		 		   + "select * from board where boardtype_no = ? and instr(#1, ?) > 0 "
		 		   + "connect by prior no = board_superno "
	               + "start with board_superno is null "
	               + "order siblings by board_groupno desc, no asc "
		 		  + ")TMP "
		 		+ ")where rn between ? and ?";
		 sql = sql.replace("#1", column);//
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setInt(1, boardTypeNo);
		 ps.setString(2, keyword);
		 ps.setInt(3, begin);
		 ps.setInt(4, end);
		 ResultSet rs=ps.executeQuery();
		 List<BoardDto> BoardList = new ArrayList<>();
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setNo(rs.getInt("no"));
				boardDto.setMemberId(rs.getString("member_id"));
				boardDto.setBoardTypeNo(rs.getInt("boardtype_no"));
				boardDto.setBoardTitle(rs.getString("board_title"));
				boardDto.setBoardContent(rs.getString("board_content"));
				boardDto.setBoardDate(rs.getDate("board_date"));
				boardDto.setBoardHit(rs.getInt("board_hit"));
				boardDto.setBoardSuperno(rs.getInt("board_superno"));
				boardDto.setBoardGroupno(rs.getInt("board_groupno"));
				boardDto.setBoardDepth(rs.getInt("board_depth"));
				
				BoardList.add(boardDto);
			}
			
			con.close();
			
			return BoardList;
	}
}
