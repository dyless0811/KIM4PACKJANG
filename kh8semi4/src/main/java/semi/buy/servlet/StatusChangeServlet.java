package semi.buy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.BuyDao;
import semi.beans.BuyDto;

@WebServlet(urlPatterns = "/admin/statuschange.kj")
public class StatusChangeServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int buyNo = Integer.parseInt(req.getParameter("buyNo"));
			
			System.out.println("서블릿 입갤");
			//처리
			BuyDao buyDao = new BuyDao();
			BuyDto buyDto = buyDao.get(buyNo);
			boolean isSuccess;
			System.out.println(buyDto.getStatus());
			if(buyDto.getStatus().equals("배송 전")) {
				isSuccess = buyDao.changeStatus(buyNo, "배송 중");
			} else if(buyDto.getStatus().equals("배송 중")) {
				isSuccess = buyDao.changeStatus(buyNo, "배송 후");
			} else if(buyDto.getStatus().equals("배송 후")) {
				isSuccess = buyDao.changeStatus(buyNo, "배송 전");
			} else {
				isSuccess = false;
			}
			if(isSuccess) {				
				System.out.println("상태 변경 완료");
				resp.sendRedirect("./ordermanagement.jsp?memberId="+buyDto.getMemberId());
			} else {
				System.out.println("상태 변경 실패");
				resp.sendError(500);
			}
			
			//출력
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
