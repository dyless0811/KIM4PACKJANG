package semi.wish.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.WishlistDao;
import semi.beans.WishlistDto;

@WebServlet(urlPatterns = "/product/wishlistadd.kj")
public class WishInsertServlet extends HttpServlet{
				@Override
				protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					try {
						String memberId = (String) req.getSession().getAttribute("loginId");
						int productNo = Integer.parseInt(req.getParameter("productNo"));
						
						WishlistDto wishlistDto = new WishlistDto();
						wishlistDto.setMemberId(memberId);
						wishlistDto.setProductNo(productNo);
						
						WishlistDao wishlistDao = new WishlistDao();
						wishlistDao.insert(wishlistDto);
						
						resp.sendRedirect(req.getContextPath() + "/myshop/wish_list.jsp");
						
					}catch(Exception e) {
						e.printStackTrace();
						resp.sendError(500);
			}
		}
}