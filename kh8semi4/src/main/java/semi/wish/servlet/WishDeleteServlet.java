package semi.wish.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.WishlistDao;

@WebServlet(urlPatterns = "/product/wishlistdelete.kj")
public class WishDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int wishlistNo = Integer.parseInt(req.getParameter("wishlistNo"));
			
			WishlistDao wishlistDao = new WishlistDao();
			boolean success = wishlistDao.delete(wishlistNo);
			
			resp.sendRedirect(req.getContextPath() + "/myshop/wish_list.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
