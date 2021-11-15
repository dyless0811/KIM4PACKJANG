package semi.servlet.categori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BigTypeDao;
import semi.beans.BigTypeDto;


@WebServlet (urlPatterns = "/admin/bcategoriedit.kj")
public class CategoriEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			BigTypeDto bigTypeDto = new BigTypeDto();
			bigTypeDto.setNo(Integer.parseInt(req.getParameter("no")));
			bigTypeDto.setName(req.getParameter("name"));
			
			//처리
			BigTypeDao bigTypeDao = new BigTypeDao();
			boolean success =bigTypeDao.update(bigTypeDto);
			

			//출력
			if(success) {
				resp.sendRedirect("");
			}else {
				resp.sendRedirect("");
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
