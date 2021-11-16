package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.MemberDao;
import semi.beans.MemberDto;

@WebServlet(urlPatterns = "/admin/memberedit.kj")
public class AdminMemberEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 파라미터로 넘어온애들 Dto로 만들기
			MemberDto memberDto = new MemberDto();
			memberDto.setName(req.getParameter("name"));
			memberDto.setAddress(req.getParameter("addr"));
			memberDto.setPhone(req.getParameter("phone"));
			memberDto.setEmail(req.getParameter("email"));
			
			System.out.println(req.getParameter("birth"));
			
			memberDto.setBirth(req.getParameter("birth"));
			memberDto.setGrade(req.getParameter("grade"));
			memberDto.setGender(req.getParameter("gender"));
			//확인용 id, pw
			memberDto.setId(req.getParameter("id"));
			memberDto.setPw(req.getParameter("pw"));
			
			//처리 : 
			MemberDao memberDao = new MemberDao();
			boolean isSuccess = memberDao.adminMemberEdit(memberDto);

			//출력
			if(isSuccess) {
				System.out.println(memberDto.getId());
				resp.sendRedirect("customerdetail.jsp?memberId="+memberDto.getId());
//				resp.sendRedirect("");
			} else {
				resp.sendError(500);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
