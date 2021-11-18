package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member/logout.kj")
public class MemberLogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 세션에서의 사용자 로그인 정보를 삭제
			// = 서블릿에서는 세션을 req.getSession() 형태로 접근
			req.getSession().removeAttribute("loginId");// 세션의 항목삭제 명령 - 로그아웃
			req.getSession().removeAttribute("grade");

			resp.sendRedirect(req.getContextPath() + "/index.jsp");// 절대
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}