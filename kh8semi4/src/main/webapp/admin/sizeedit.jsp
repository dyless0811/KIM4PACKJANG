<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SizeDao sizeDao = new SizeDao();
	List<SizeDto> sizeList = sizeDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<ol class="contents">
	<%for(SizeDto sizeDto : sizeList){ %>
        <li>
            <a href="#"><%=sizeDto.getSizeName()%></a> / <a href="./sizedelete.kj?no=<%=sizeDto.getNo()%>">삭제</a>
        </li>
    <%} %>
    </ol>
<br>
<form action="./sizeinsert.kj" method="post">
	<table>
		<tbody>
			<tr>
				<td>사이즈 : <input type="text" name="name"></td>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</tbody>
	</table>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>