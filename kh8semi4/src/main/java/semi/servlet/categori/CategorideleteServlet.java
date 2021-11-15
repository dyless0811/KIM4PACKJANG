package semi.servlet.categori;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import semi.beans.BigTypeDao;
import semi.beans.BigTypeDto;


@WebServlet (urlPatterns = "/admin/bcategoridelete.kj")
public class CategorideleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int no = Integer.parseInt(req.getParameter("no"));
	
	
			
			//처리
			BigTypeDao bigTypeDao = new BigTypeDao();
			boolean success =bigTypeDao.delete(no);
			

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
