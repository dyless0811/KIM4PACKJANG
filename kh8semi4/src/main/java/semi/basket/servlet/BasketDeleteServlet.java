package semi.basket.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BasketDao;

@WebServlet(urlPatterns = "/myshop/order/deletebasket.kj")
public class BasketDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try { 
			int basketNo = Integer.parseInt(req.getParameter("basketNo"));
		
		BasketDao basketDao = new BasketDao();
		boolean success = basketDao.delete(basketNo);
		
		resp.sendRedirect("basket.jsp");
		}catch(Exception e ) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
