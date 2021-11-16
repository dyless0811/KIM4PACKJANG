<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="semi.beans.SmallTypeDao"%>
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
	<ol class="contents">
	<%for(BigTypeDto bigType : bigTypeList){ %>
        <li>
            <a href="#" class="toggle"><%=bigType.getName()%></a>
            <ol>
            <%
            	SmallTypeDao small = new SmallTypeDao();
            	List<SmallTypeDto> smallList = small.searchSmallType(bigType.getNo());
            	for(SmallTypeDto smallType : smallList){
            %>
                <li><a><%=smallType.getName()%></a> / <a href="./scategoridelete.kj?no=<%=smallType.getNo()%>">삭제</a></li>
            <%} %>
            	<li><a href="./cgedit.jsp?no=<%=bigType.getNo()%>"><%=bigType.getName()%>에 소분류 추가</a></li>
            </ol>
        </li>
    <%} %>
    </ol>
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