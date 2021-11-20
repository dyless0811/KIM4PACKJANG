package semi.basket.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BasketDao;
import semi.beans.BasketDto;

@WebServlet("/myshop/order/addbasket.kj")
public class BasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			BasketDao basketDao = new BasketDao();
			
			String memberId = (String) request.getSession().getAttribute("loginId");
			String[] productNoList = request.getParameterValues("productNo");
			String[] colorList = request.getParameterValues("color");
			String[] sizeList = request.getParameterValues("size");
			String[] countList = request.getParameterValues("count");
			int[] no = basketDao.getSeqList(productNoList.length);
			boolean isBuy = request.getParameter("addType").equals("Buy");
			
			//값 전달 테스트 용
			System.out.println("isBuy = "+isBuy);
			for (int i = 0; i < productNoList.length; i++) {
					System.out.println(memberId+"/"+
							productNoList[i]+"/"+
							colorList[i]+"/"+
							sizeList[i]+"/"+
							countList[i]);
			}
			
			//basket 테이블에 추가
			for (int i = 0; i < productNoList.length; i++) {
				BasketDto basketDto = new BasketDto();
				basketDto.setNo(no[i]);
				basketDto.setMemberId(memberId);
				basketDto.setProductNo(Integer.parseInt(productNoList[i]));
				basketDto.setColorNo(Integer.parseInt(colorList[i]));
				basketDto.setSizeNo(Integer.parseInt(sizeList[i]));
				basketDto.setCount(Integer.parseInt(countList[i]));
					
				basketDao.insert(basketDto);
			}
			
			//redirect URL
			String buyURL = request.getContextPath()+"/product/productbuy.jsp?";
			String basketURL = request.getContextPath()+"/myshop/order/basket.jsp";
			
			//장바구니 번호 파라미터 세팅
			for (int i : no) {
				buyURL += "basketNo="+i+"&";
			}
			System.out.println(buyURL);
			System.out.println(basketURL);
			
			if(isBuy) {
				response.sendRedirect(buyURL);
			} else {				
				response.sendRedirect(basketURL);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
