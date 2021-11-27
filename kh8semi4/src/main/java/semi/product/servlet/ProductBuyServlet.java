package semi.product.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BasketDao;
import semi.beans.BasketDto;
import semi.beans.BuyDao;
import semi.beans.BuyDto;

@WebServlet("/product/buy.kj")
public class ProductBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String[] basketList = request.getParameterValues("basketNo");
			String memberId = (String)request.getSession().getAttribute("loginId");
			String type = request.getParameter("type");
			
			BasketDao basketDao = new BasketDao();
			BuyDao buyDao = new BuyDao();
			
//			//값 전달 확인용
//			for (String basketNo : basketList) {
//				BasketDto basketDto = basketDao.get(Integer.parseInt(basketNo));
//				
//				BuyDto buyDto = new BuyDto();
//				System.out.println(memberId +"/"+ basketDto.getProductNo()+"/"+basketDto.getColorNo()+"/"+basketDto.getSizeNo()+"/"+basketDto.getCount()+"/"+type);
//			}
			
			for (String basketN : basketList) {
				int basketNo = Integer.parseInt(basketN);
				BasketDto basketDto = basketDao.get(basketNo);
				
				BuyDto buyDto = new BuyDto();
				buyDto.setMemberId(memberId);
				buyDto.setProductNo(basketDto.getProductNo());
				buyDto.setColorNo(basketDto.getColorNo());
				buyDto.setSizeNo(basketDto.getSizeNo());
				buyDto.setCount(basketDto.getCount());
				buyDto.setType(type);
				
				buyDao.insert(buyDto);
				
				int price = basketDao.priceByBaksetNo(basketNo) * basketDto.getCount();
				int reserves = (int)(price * 0.03);
				
				buyDao.updatePoint(reserves, memberId);
				basketDao.delete(basketNo);
			}
			
			response.sendRedirect(request.getContextPath()+"/myshop/order/list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}

