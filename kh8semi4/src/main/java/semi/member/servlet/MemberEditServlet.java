package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

@WebServlet(urlPatterns = "/member/edit.kj")
public class MemberEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 입력 : MemberDto
			// = 세션 : id (loginId)
			MemberDto memberDto = new MemberDto();
			memberDto.setId((String) req.getSession().getAttribute("loginId"));// 세션
			memberDto.setPw(req.getParameter("pw"));// 파라미터
			memberDto.setName(req.getParameter("name"));// 파라미터
			memberDto.setAddress(req.getParameter("address"));// 파라미터
			memberDto.setPhone(req.getParameter("phone"));// 파라미터
			memberDto.setEmail(req.getParameter("email"));// 파라미터
			memberDto.setBirth(req.getParameter("birth"));// 파라미터
			memberDto.setGender(req.getParameter("gender"));// 파라미터

			// 처리
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.edit(memberDto);

			// 출력
			if (success) {
				resp.sendRedirect("modify.jsp");
				
			} else {
				resp.sendRedirect("modify.jsp?error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}