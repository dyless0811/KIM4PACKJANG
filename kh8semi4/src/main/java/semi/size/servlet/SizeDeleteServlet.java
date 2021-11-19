package semi.size.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SizeDao;

@WebServlet("/admin/sizedelete.kj")
public class SizeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SizeDao sizeDao = new SizeDao();
			boolean success = sizeDao.delete(Integer.parseInt(request.getParameter("no")));
			
			if(success) { 
				response.sendRedirect(request.getContextPath()+"/admin/sizeedit.jsp");
			} else {
				response.sendError(500);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
