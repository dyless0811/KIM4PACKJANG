package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;

@WebServlet(urlPatterns = "/member/id/find_id.kj")
public class MemberIdFindSevlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try { 
		MemberDao memberDao = new MemberDao();
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String id = memberDao.findId(name, phone);
		if (id ==null) {
			System.out.println("아이디없음");
			resp.sendRedirect(req.getContextPath() +"/member/id/find_id.jsp");
			
		}
		else {
			System.out.println("아이디있음");
			resp.sendRedirect(req.getContextPath() + "/member/id/find_id_success.jsp?id="+id);
		}
		
		} catch(Exception e ) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
