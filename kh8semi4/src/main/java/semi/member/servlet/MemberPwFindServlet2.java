package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/pw/find_pw2.kj")
public class MemberPwFindServlet2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			// 입력 : 아이디, 이메일, 전화번호
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");

			// 처리
			MemberDao memberDao = new MemberDao();
			String pw = memberDao.findpw(id, email, phone);
			if (pw != null) {
				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw_success.jsp?pw=" + pw);
			} else {
				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw.jsp?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}