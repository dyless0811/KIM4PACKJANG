package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//관리자인지 확인하는 필터
@WebFilter(urlPatterns = {"/admin/*",
									"/product/productadd.jsp",
									"/product/productedit.jsp",
									})
public class AdminFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			//일단 HttpServlet객체의 기능을 쓰기 위해 다운캐스팅을 실시한다.
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp = (HttpServletResponse)response;
			
			//현재 세션에 들어있는 등급값을 가져온 뒤 관리자인지 아닌지 판별한다.
			String userGrade = (String)req.getSession().getAttribute("grade");
			
			if(userGrade != null && userGrade.equals("관리자")) {//만약 Grade:관리자일 경우 통과
				chain.doFilter(request, response);
			}else {//Grade:관리자가 아니면 에러페이지로 리다이렉트
				resp.sendError(401);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
