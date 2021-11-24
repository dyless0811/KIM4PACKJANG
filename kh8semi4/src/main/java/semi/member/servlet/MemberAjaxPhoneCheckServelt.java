package semi.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

@WebServlet(urlPatterns = "/member/ajax_phone_check.kj")
public class MemberAjaxPhoneCheckServelt extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String phone=req.getParameter("phone");
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto  = memberDao.getPhone(phone);
			
			if(memberDto == null) {
				//핸드폰번호가 없다 => 사용이 가능하다 => YESICAN를 전송
				resp.getWriter().write("YESICAN");
			}
			else {
				//핸드폰번호가 있다 => 사용이 불가능하다 => NONONO을 전송
				resp.getWriter().write("NONONO");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
