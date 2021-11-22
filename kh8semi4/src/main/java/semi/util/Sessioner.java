package semi.util;

import javax.servlet.http.HttpSession;

import semi.beans.MemberDto;

public class Sessioner {
	public static void login(HttpSession  session, MemberDto memberDto) throws Exception {
		
		String id = memberDto.getId();
		
		session.setAttribute("id9", id);
	}
}
