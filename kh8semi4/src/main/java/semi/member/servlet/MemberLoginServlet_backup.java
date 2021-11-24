package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

//@WebServlet(urlPatterns = "/member/login.kj")
public class MemberLoginServlet_backup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
//			String id;
//			String pw;
			//String joinId = (String)req.getSession().getAttribute("joinId");
			//String joinPw = (String)req.getSession().getAttribute("joinPw");
			
//			
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
			
			// 처리
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(id);

			// 회원이 있는데 비밀번호까지 같다면 로그인이 성공한것으로 간주하고 싶다
			boolean isLogin = memberDto != null && pw.equals(memberDto.getPw());

			// 출력
			if (isLogin) {
				// 세션 = 서버에서 사용자 정보를 관리하기 위한 단골수첩과 같은 저장소
				// = 여기서는 가장 중요한 회원정보인 회원아이디를 loginId라는 이름으로 저장
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