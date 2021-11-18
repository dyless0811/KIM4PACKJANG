<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");

		MemberDao memberDao = new MemberDao();
		String id2 = memberDao.findId(name, phone);
%>

	<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>아이디 찾기 결과</h1>
	
	
     	<div class = "row">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="row">
	      <%=id%>
	      </div>
	      <h4>입니다</h4>
	     </div>
<jsp:include page="/template/footer.jsp"></jsp:include>