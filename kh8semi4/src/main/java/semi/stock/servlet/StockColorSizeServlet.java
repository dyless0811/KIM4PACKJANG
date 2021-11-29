package semi.stock.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.StockDao;

@WebServlet(urlPatterns = {"/admin/stock-colorsize.kj","/product/stock-colorsize.kj"})
public class StockColorSizeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("UTF-8");
				
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			int colorNo = Integer.parseInt(request.getParameter("colorNo"));
			int sizeNo = Integer.parseInt(request.getParameter("sizeNo"));
			
			StockDao stockDao = new StockDao();
			int stock = stockDao.getStockCount(productNo, colorNo, sizeNo);
			if(stock <= 0) {
				response.getWriter().write("0");				
			}else {
				response.getWriter().write(stock+"");								
			}							
							
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
