package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/pw/find_pw.kj")
public class MemberPwFindServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDao memberDao = new MemberDao();
			String id = req.getParameter("id");
			String email = req.getParameter("email"); 
			String phone = req.getParameter("phone");
			String pw = memberDao.findpw(id, email, phone);
			if(pw != null) {
			resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw_success.jsp?pw="+pw);
			}
			else {
				resp.sendRedirect(req.getContextPath() + "/member/pw/find_pw.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
