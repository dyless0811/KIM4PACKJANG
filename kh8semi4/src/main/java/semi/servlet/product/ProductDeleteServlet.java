package semi.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ProductDao;
@WebServlet (urlPatterns = "/adasdadasdasdasd")
public class ProductDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		//입력
		int no = Integer.parseInt(req.getParameter("no"));
		//처리
		ProductDao productDao =new ProductDao();
		boolean success =productDao.delete(no);
		
		if(success) {
			resp.sendRedirect("");
		}else {
			resp.sendRedirect("");
		}
			
		//출력
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
