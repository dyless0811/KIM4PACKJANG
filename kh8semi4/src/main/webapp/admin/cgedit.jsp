<%@page import="semi.beans.BigTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//대분류 목록 출력
	
	int no = Integer.parseInt(request.getParameter("no"));
	BigTypeDao bigTypeDao = new BigTypeDao();
	BigTypeDto bigTypeList = bigTypeDao.get(no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<h2><%=bigTypeList.getName()%>에 소분류 추가</h2>
<form action="./scategoriinsert.kj" method="get">
	소분류 명 : <input type="text" name="name" required><br>
	<input type="submit" value="추가">
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>