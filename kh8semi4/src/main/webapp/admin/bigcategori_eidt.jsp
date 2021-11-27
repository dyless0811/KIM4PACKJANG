<%@page import="semi.beans.BigTypeDto"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 입력 --%> 
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String name=request.getParameter("name");
%>
  
<%-- 처리 --%>
<%
	BigTypeDao bigTypeDao = new BigTypeDao();
	BigTypeDto bigTypeDto = bigTypeDao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<form action="./bcategoriedit.kj" method="get">
	<input type="text" name=no value=<%=bigTypeDto.getNo()%> readonly>
	<label>
		대분류명<input type="text" name="name" class="form-input" value=<%=bigTypeDto.getName()%>>
	</label>
	<input type="submit" value="수정하기">
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>