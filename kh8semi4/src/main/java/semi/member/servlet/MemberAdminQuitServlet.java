package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/admin/quit.kj")
public class MemberAdminQuitServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getParameter("memberId");
			
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.quit(id);
			if (success) {
				resp.sendRedirect(req.getContextPath()+"/admin/customerlist.jsp");
			} else {
				resp.sendRedirect(req.getContextPath()+"/admin/customerlist.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}