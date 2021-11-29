package semi.stock.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ProductColorDao;
import semi.beans.ProductColorDto;
import semi.beans.ProductSizeDao;
import semi.beans.ProductSizeDto;
import semi.beans.StockDao;
import semi.beans.StockDto;

@WebServlet(urlPatterns = "/admin/stockadd.kj")
public class StockInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
						
			//입력 : StockDto(product_no, stock_change)
			//[1]Stock객체를 일단 만든다.
			int productNo = Integer.parseInt(req.getParameter("productNo"));
			int colorNo = Integer.parseInt(req.getParameter("colorNo"));
			int sizeNo = Integer.parseInt(req.getParameter("sizeNo"));
			
			StockDto stockDto = new StockDto();
			stockDto.setProductNo(productNo);
			stockDto.setColorNo(colorNo);
			stockDto.setSizeNo(sizeNo);
			stockDto.setStockChange(Integer.parseInt(req.getParameter("stockChange")));
			
			//[6]. StockDao를 이용해서 저장한 값을 처리한다.
			StockDao stockDao = new StockDao();
			stockDao.insert(stockDto);
			
			//재고관리화면으로 Redirect
			resp.sendRedirect(req.getContextPath()+"/admin/stockadd.jsp?productno="+productNo);
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
