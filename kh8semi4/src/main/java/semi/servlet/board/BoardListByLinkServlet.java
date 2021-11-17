package semi.servlet.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BoardDao;
import semi.beans.BoardDto;

@WebServlet(urlPatterns = "/board/listbylink.kj")
public class BoardListByLinkServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : boardtype_no
			int typeNo = Integer.parseInt(req.getParameter("no"));
			
			//처리
			BoardDao boardDao = new BoardDao();
			List<BoardDto> boardList = boardDao.listByLink(typeNo);
			
			
			//출력
			resp.sendRedirect("./list.jsp");
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
