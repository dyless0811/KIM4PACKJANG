package semi.servlet.categori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SmallTypeDao;
@WebServlet (urlPatterns = "/admin/scategoridelete.kj")
public class sCategoriDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int no =Integer.parseInt(req.getParameter("no"));
			
			//처리
			SmallTypeDao smalltypeDao = new SmallTypeDao();
			boolean succees=smalltypeDao.delete(no);
			
			//출력
			if(succees) {
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
