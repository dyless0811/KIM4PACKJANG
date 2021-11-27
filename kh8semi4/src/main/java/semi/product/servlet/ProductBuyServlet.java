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
import semi.beans.StockDao;
import semi.beans.StockDto;

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
			StockDao stockDao = new StockDao();
			
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
				//구매 등록
				BuyDto buyDto = new BuyDto();
				buyDto.setMemberId(memberId);
				buyDto.setProductNo(basketDto.getProductNo());
				buyDto.setColorNo(basketDto.getColorNo());
				buyDto.setSizeNo(basketDto.getSizeNo());
				buyDto.setCount(basketDto.getCount());
				buyDto.setType(type);
				
				buyDao.insert(buyDto);
				
				//적립금 증가
				int price = basketDao.priceByBaksetNo(basketNo) * basketDto.getCount();
				int reserves = (int)(price * 0.03);
				
				buyDao.updatePoint(reserves, memberId);
				
				//재고 감소
				StockDto stockDto = new StockDto();
				stockDto.setProductNo(basketDto.getProductNo());
				stockDto.setColorNo(basketDto.getColorNo());
				stockDto.setSizeNo(basketDto.getSizeNo());
				stockDto.setStockChange(-basketDto.getCount());
				
				stockDao.insert(stockDto);
				
				//장바구니 삭제
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

