package semi.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/quit.kh")
public class MemberQuitSetvlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = (String) req.getSession().getAttribute("loginId");
			String pw = req.getParameter("pw");

			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.quit(id, pw);

			if (success) {
				req.getSession().removeAttribute("loginId");
				req.getSession().removeAttribute("grade");

				resp.sendRedirect("quit_success.jsp");
			} else {
				resp.sendRedirect("check.jsp?error");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}
