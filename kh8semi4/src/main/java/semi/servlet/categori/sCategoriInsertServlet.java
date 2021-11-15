package semi.servlet.categori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SmallTypeDao;
import semi.beans.SmallTypeDto;
@WebServlet (urlPatterns = "/admin/scategoriinsert.kj")
public class sCategoriInsertServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			SmallTypeDto smalltypeDto = new SmallTypeDto();
			smalltypeDto.setBigTypeNo(Integer.parseInt(req.getParameter("bigTypeNo")));
			smalltypeDto.setName(req.getParameter("name"));
			
			//처리
			SmallTypeDao smallTypeDao =new SmallTypeDao();
			smallTypeDao.insert(smalltypeDto);
			//출력
			resp.sendRedirect("./categoryedit.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
