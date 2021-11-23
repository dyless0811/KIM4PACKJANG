package semi.categori.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SmallTypeDao;
import semi.beans.SmallTypeDto;
@WebServlet (urlPatterns = "/admin/scategorieidt.kj")
public class sCateforiEditServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			SmallTypeDto smallTypeDto = new SmallTypeDto();
			//smallTypeDto.setBigTypeNo(req.getParameter("bigtypeno"));
			smallTypeDto.setNo(Integer.parseInt(req.getParameter("no")));
			smallTypeDto.setName(req.getParameter("name"));
			//처리
			SmallTypeDao smallTypeDao = new SmallTypeDao();
			boolean success =smallTypeDao.update(smallTypeDto);
			

			//출력
			if(success) {
				resp.sendRedirect("./categoryedit.jsp");
			}else {
				resp.sendError(500);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
