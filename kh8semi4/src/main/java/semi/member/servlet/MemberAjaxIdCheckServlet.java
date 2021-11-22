package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

//비동기 통신을 위한 서블릿
@WebServlet(urlPatterns = "/member/ajax_id_check.kj")
public class MemberAjaxIdCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String id = req.getParameter("id");
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto  = memberDao.get(id);
		
		if(memberDto == null) {
			//아이디가 없다 => 사용이 가능하다 => YESICAN를 전송
			resp.getWriter().write("YESICAN");
		}
		else {
			//아이디가 있다 => 사용이 불가능하다 => NONONO을 전송
			resp.getWriter().write("NONONO");
		}
		
		} catch(Exception e ) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}