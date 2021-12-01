<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%		
	String pw = request.getParameter("tmpPw");
	session.setAttribute("findpw", "check");
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="container-400 container-center">
	<div class="titleArea">
        	<h2>비밀번호 찾기 결과</h2>
	</div>
	 <div class="row">
				회원님의 임시 비밀번호는 
	</div>		
	<br>
	<div class ="row">
	      	<strong>[<%=pw%>] 입니다.
	      	<br>
	      	비밀번호를 변경해주세요.
	      	</strong>
	  </div>
		
		<a href="<%=request.getContextPath()%>/member/login.jsp">
			<button class="snap-sync-btn-submit">로그인</button>
		</a>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>