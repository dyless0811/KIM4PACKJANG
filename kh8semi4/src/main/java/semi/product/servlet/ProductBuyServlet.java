 package semi.product.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BuyDao;
import semi.beans.BuyDto;
@WebServlet (urlPatterns = "/product/buy.kj")
public class ProductBuyServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			String memberId=(String)req.getSession().getAttribute("loginId");
			
			BuyDto buyDto = new BuyDto();
			buyDto.setNo(Integer.parseInt(req.getParameter("no")));
			buyDto.setMemberId(memberId);
			buyDto.setProductNo(Integer.parseInt(req.getParameter("product_no")));
			buyDto.setType(req.getParameter("type"));
			
			//처리
			BuyDao buyDao = new BuyDao();
			buyDao.insert(buyDto);
			//출력
			resp.sendRedirect("/product/productBuySuccess.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
