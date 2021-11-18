package semi.color.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ColorDao;
import semi.beans.ColorDto;

@WebServlet("/admin/colorinsert.kj")
public class ColorInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ColorDto colorDto = new ColorDto();
			colorDto.setColorName(request.getParameter("name"));
			
			ColorDao colorDao = new ColorDao();
			colorDao.insert(colorDto);
			
			response.sendRedirect(request.getContextPath()+"/admin/coloredit.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}
}
