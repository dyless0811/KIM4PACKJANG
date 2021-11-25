package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;
import semi.beans.MemberLogDao;
import semi.beans.MemberLogDto;

@WebServlet(urlPatterns = "/member/login.kj")
public class MemberLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				//기존 로그인 코드
//			String id;
//			String pw;
//			String joinId = (String)req.getSession().getAttribute("joinId");
//			String joinPw = (String)req.getSession().getAttribute("joinPw");
//			if(joinId != null && joinPw != null) {
//				id = joinId;
//				pw = joinPw;
//			}
//			else {
//				id = req.getParameter("id");
//				pw = req.getParameter("pw");
//			}
//			req.getSession().removeAttribute(joinId);
//			req.getSession().removeAttribute(joinPw);
			
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			//11/24 새롭게 추가된 코드 (Log테이블에 데이터 저장)
			MemberLogDao memberLogDao = new MemberLogDao();
			MemberLogDto memberLogDto = memberLogDao.search(id);
			
			if(memberLogDto == null) {//만약 로그가 기록되어있지 않으면 로그를 저장
				memberLogDao.insert(id);
			}//없으면 그냥 넘어가잇
			
			// 처리
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(id);

			// 회원이 있는데 비밀번호까지 같다면 로그인이 성공한것으로 간주하고 싶다
			boolean isLogin = memberDto != null && pw.equals(memberDto.getPw());

			// 출력
			if (isLogin) {
				// 세션 = 서버에서 사용자 정보를 관리하기 위한 단골수첩과 같은 저장소
				//세션에 아이디와 등급을 저장함
				req.getSession().setAttribute("loginId", id);
				req.getSession().setAttribute("grade", memberDto.getGrade());
				resp.sendRedirect(req.getContextPath() + "/index.jsp");

			} else {
				// login.jsp 로 이동하면서 ?error 파라미터를 붙여서 오류임을 표시
				resp.sendRedirect("login.jsp?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(0);
		}
	}
}