<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String id = request.getParameter("id");
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="container-400 container-center">
	<div class="titleArea">
        	<h2>아이디 찾기 결과</h2>
	</div>
	<div class="row">
				회원님의 아이디는 
	</div>		
	<div class ="row">
	      	<strong>[<%=id%>] 입니다.</strong>
	 </div>
		
		<a href="<%=request.getContextPath()%>/member/login.jsp">
			<button class="snap-sync-btn-submit">로그인</button>
		</a>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>