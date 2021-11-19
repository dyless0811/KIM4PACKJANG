<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ColorDao colorDao = new ColorDao();
	List<ColorDto> colorList = colorDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<ol class="contents">
	<%for(ColorDto colorDto : colorList){ %>
        <li>
            <a href="#"><%=colorDto.getColorName()%></a> / <a href="./colordelete.kj?no=<%=colorDto.getNo()%>">삭제</a>
        </li>
    <%} %>
    </ol>
<br>
<form action="./colorinsert.kj" method="post">
	<table>
		<tbody>
			<tr>
				<td>색상 : <input type="text" name="name"></td>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</tbody>
	</table>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>