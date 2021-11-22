<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String id = request.getParameter("id");
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<h1>아이디 찾기 결과</h1>
		<div class = "row">
				<h4>  회원님의 아이디는 </h4>  
		</div>		
	    <div class ="row">
	      		<%=id%>입니다
	     </div>

<jsp:include page="/template/footer.jsp"></jsp:include>