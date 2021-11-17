package semi.board.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BoardDao;
import semi.beans.BoardDto;

@WebServlet("/board/delete.kj")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			String memberId = (String) request.getSession().getAttribute("loginId");
			int boardNo = Integer.parseInt(request.getParameter("no"));
			BoardDao boardDao = new BoardDao();
			BoardDto boardDto = boardDao.get(boardNo);
			if(memberId == boardDto.getMemberId()) {
				boardDao.delete(boardNo);
			}
			
			response.sendRedirect("/kh8semi4/board/list.jsp?no="+boardDto.getBoardTypeNo());
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("500");
		}
	}
}
