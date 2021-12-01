package semi.filter;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//회원인지 아닌지 확인해서 거르는 필터
@WebFilter(urlPatterns = {"/myshop/*",
										"/board/*",
										"/member/pw/find_pw_success.jsp",
										"/member/id/find_id_success.jsp"
										})
public class MemberFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			//일단 HttpServlet객체의 기능을 쓰기 위해 다운캐스팅을 실시한다.
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp = (HttpServletResponse)response;
			
			//현재 세션에 아이디가 들어있는지(로그인을 한 상태인지)
			String memberId = (String)req.getSession().getAttribute("loginId");
			
			if(memberId == null) {//만약 로그인을 한 상태가 아닐경우 권한없음:401 로 리다이렉트
				resp.sendError(401);
			}else {//로그인을 한 상태일 경우 통과
				chain.doFilter(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
