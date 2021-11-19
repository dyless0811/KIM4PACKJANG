package semi.size.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.SizeDao;
import semi.beans.SizeDto;

@WebServlet("/admin/sizeinsert.kj")
public class SizeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SizeDto sizeDto = new SizeDto();
			sizeDto.setSizeName(request.getParameter("name"));
			
			SizeDao sizeDao = new SizeDao();
			sizeDao.insert(sizeDto);
			
			response.sendRedirect(request.getContextPath()+"/admin/sizeedit.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
