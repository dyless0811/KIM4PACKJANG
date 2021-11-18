<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%		
			
		
						
				String pw = request.getParameter("pw");
%>

	<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>비밀번호찾기 결과</h1>
	
	
     	<div class = "row">
	      <h4>  회원님의 비밀번호는 </h4>  
	      <div class ="row">
	      <%=pw.substring(0,4)%>
	      </div>
	      <h4>입니다</h4>
	     </div>
<jsp:include page="/template/footer.jsp"></jsp:include>