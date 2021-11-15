<%@page import="semi.beans.BigTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//대분류 목록 출력
	BigTypeDao bigTypeDao = new BigTypeDao();
	List<BigTypeDto> bigTypeList = bigTypeDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<table>
	<thead>
		<tr>
			<th>대분류번호</th>
			<th>대분류이름</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<%for(BigTypeDto bigType : bigTypeList){ %>
		<tr>
			<td><%=bigType.getNo()%></td>
			<td><%=bigType.getName()%></td>
			<td>
				<a href="./cgedit.jsp?no=<%=bigType.getNo()%>">수정</a>
				<a href="./bcategoridelete.kj?no=<%=bigType.getNo()%>">삭제</a>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>
<br>
<form action="./bcategoriinsert.kj" method="post">
	<table>
		<tbody>
			<tr>
				<td>대분류 명 : <input type="text" name="name"></td>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</tbody>
	</table>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>