package semi.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

@WebServlet(urlPatterns = "/member/join.kj")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		//입력 : MemberDto
		MemberDto memberDto = new MemberDto();
		memberDto.setId(req.getParameter("id"));
		memberDto.setPw(req.getParameter("pw"));
		memberDto.setName(req.getParameter("name"));
		memberDto.setAddress(req.getParameter("address"));
		memberDto.setPhone(req.getParameter("phone"));
		memberDto.setEmail(req.getParameter("email"));
		memberDto.setBirth(req.getParameter("birth"));
		memberDto.setGender(req.getParameter("gender"));
		
		//처리 : MemberDao
		MemberDao memberDao = new MemberDao();
		memberDao.join(memberDto);
		
		//성공시 
		resp.sendRedirect("join_success.jsp");
		
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
