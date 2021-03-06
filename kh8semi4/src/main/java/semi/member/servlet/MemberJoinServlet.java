package semi.member.servlet;

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
import semi.beans.sha256;


@WebServlet(urlPatterns = "/member/join.kj")
public class MemberJoinServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력 : MemberDto
			MemberDto memberDto = new MemberDto();
			memberDto.setId(req.getParameter("id"));
			memberDto.setPw(sha256.encodeSha256(req.getParameter("pw")));
			
			memberDto.setName(req.getParameter("name"));
			memberDto.setAddress(req.getParameter("address"));
			memberDto.setPhone(req.getParameter("phone"));
			memberDto.setEmail(req.getParameter("email"));
			memberDto.setBirth(req.getParameter("birth"));
			memberDto.setGender(req.getParameter("gender"));

			// 처리 : MemberDao
			MemberDao memberDao = new MemberDao();
			memberDao.join(memberDto);
			
			
			//req.getSession().setAttribute("joinId", memberDto.getId());
			//req.getSession().setAttribute("joinPw", memberDto.getPw());
			
			// 출력 : 리다이렉트
			
			resp.sendRedirect("autologin.kj?id="+memberDto.getId()+"&pw="+memberDto.getPw());
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}