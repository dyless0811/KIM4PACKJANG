package semi.vo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.StatisticsDao;

@WebServlet(urlPatterns = "/admin/convert.kj")
public class ConvertDateServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력값 start, end
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			//값 비교를 위해 하이픈을 지우고 숫자로 만든 뒤 비교한다.
			start = start.replace("-", "");
			int startNumber = Integer.parseInt(start);
			end = end.replace("-", "");
			int endNumber = Integer.parseInt(end);
			
			//숫자로 만든 뒤 더 큰 값을 startDate에 넣고 작은 값을 endDate에 넣는다.
			int startDate = Math.min(startNumber, endNumber);
			int endDate = Math.max(startNumber, endNumber);
			
			//startDate를 문자열로 바꾼 뒤 000000을 붙여주고
			//endDate를 문자열로 바꾼 뒤 235959를 붙여준다
			String realStart = String.valueOf(startDate) +"000000";
			String realEnd = String.valueOf(endDate) + "235959";
			//처리
			StatisticsDao statisticsDao = new StatisticsDao();
			int price = statisticsDao.termToTermSales(realStart, realEnd);
			
			//출력 : statistics.jsp
			resp.sendRedirect("statistics.jsp?price="+price);
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
