<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardPagenation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 --%>


<%-- 처리 --%>
<%
BoardPagenation boardPagenation = new BoardPagenation(request);
boardPagenation.calculate();
BoardDto boardDto = new BoardDto();

%>
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
	<table class="table table-border table-hover">
		<thead>
		 	<tr>
		 		<th width="8%">글번호</th>
		 		<th>제목</th>
		 		<th  width="15%">작성자</th>
		 		<th  width="15%">작성일</th>
		 		<th  width="7%">조회수</th>
		 	</tr>
		</thead>
		
		<tbody>
		 <%for(BoardDto boardDtolist : boardPagenation.getList()) {%>
		  <tr>
		  	<td><%=boardDtolist.getNo()%></td>
		  	<td><a href="<%=request.getContextPath()%>/board/list.jsp?no=<%=boardDtolist.getNo()%>"><%=boardDtolist.getBoardTitle()%></a></td>
		  	<td><%=boardDtolist.getMemberId()%></td>
		  	<td><%=boardDtolist.getBoardDate()%></td>
		  	<td><%=boardDtolist.getBoardHit()%></td>
		  </tr>
		  <%} %>
		</tbody>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>