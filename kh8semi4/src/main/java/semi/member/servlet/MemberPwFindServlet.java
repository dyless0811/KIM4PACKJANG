package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.RandomPassword;
import semi.beans.sha256;

@WebServlet(urlPatterns = "/member/pw/find_pw.kj")
public class MemberPwFindServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String tmpPw = RandomPassword.getTempPassword(5);
			System.out.println("임시 = " + tmpPw);
			String enPw = sha256.encodeSha256(tmpPw);
			System.out.println("암호화 = " + enPw);
			// 입력 : 아이디, 이메일, 전화번호
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");

			// 처리
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.editPassword(enPw, id, email, phone);
//			기존 비밀번호 찾기 
//			String pw = memberDao.findpw(id, email, phone);
//			if (pw != null) {
//				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw_success.jsp?pw=" + pw);
//			} else {
//				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw.jsp?error");
//			}
			if(success) { 
				resp.sendRedirect("find_pw_success.jsp?enPw="+enPw);
			}
			else {
				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw.jsp?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}