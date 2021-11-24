package semi.reply.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ReplyDao;
import semi.beans.ReplyDto;

@WebServlet("/reply/delete.kj")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String memberId = (String) request.getSession().getAttribute("loginId");
			int replyNo = Integer.parseInt(request.getParameter("no"));
			
			ReplyDao replyDao = new ReplyDao();
			ReplyDto replyDto = replyDao.get(replyNo);
			
			if(memberId == replyDao.getMemberIdByBuyNo(replyDto.getBuyNo())) {
				replyDao.delete(replyNo);
			}
			
			response.sendRedirect("/kh8semi4/myshop/board/myboard");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
