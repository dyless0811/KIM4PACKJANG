<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%-- 입력--%> 
  <%

  int no = Integer.parseInt(request.getParameter("no"));
  String name=request.getParameter("name");
  %>
  <%
  	SmallTypeDao smallTypeDao = new SmallTypeDao();
  	SmallTypeDto smallTypeDto = smallTypeDao.get(no);
  %>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="./scategorieidt.kj" method="get">
	<input type="text" name=no value=<%=smallTypeDto.getNo()%> readonly>
	<label>소분류명</label>
	<input type="text" name="name" class="form-input" value=<%=smallTypeDto.getName()%>>
	<input type="submit" value="수정하기">
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>