package semi.servlet.categori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BigTypeDao;
import semi.beans.BigTypeDto;
@WebServlet (urlPatterns = "/admin/bcategoriinsert.kj")
public class CategoriInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				//입력
				BigTypeDto bigTypeDto = new BigTypeDto();
				bigTypeDto.setName(req.getParameter("name"));
				
				//처리
				BigTypeDao bigTypeDao = new BigTypeDao();
				bigTypeDao.insert(bigTypeDto);
				//출력 
				resp.sendRedirect("./category.jsp");
				
				
				
				
				
			}catch(Exception e ){
				e.printStackTrace();
				resp.sendError(500);
			}

	}

}
