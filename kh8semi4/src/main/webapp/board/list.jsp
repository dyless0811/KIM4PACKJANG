<%@page import="semi.beans.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : 검색분류(column), 검색어(keyword) --%>
<%
	String column = request.getParameter("column");
	String keyword = request.getParameter("keyword");
	int boardType = Integer.parseInt(request.getParameter("no"));
%>

<%-- 처리 --%>
<%
	boolean search = column != null && !column.isEmpty() && keyword != null && !keyword.isEmpty();
	
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list = null;
	if(search){ 
		//list = boardDao.search(column, keyword);
	}
	else{
		list = boardDao.list();
	}
%>


<%-- 처리 --%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action=#>
	<div class="container-1400 container-center">
		<div class="row center">
			<h1>KIM4PARKJANG 그냥 고객센터</h1>
			<hr>
			<h3>이렇게 귀한곳에 누추한 고객님께서 편안하게 쇼핑하실 수 있도록 최선을 다하겠습니다.</h3>
			<br>
			<br>
			<br>
			<h1>1 2 3 4 . 1 2 3 4</h1>
			<br>
			<h3>OPEN : 10:00 - 17:00 / LUNCH : 12:30 - 13:30</h3>
			<br>
			<br>
			<a href = "<%=request.getContextPath()%>/board/list.jsp?no=1">공지사항</a>
			<a href = "<%=request.getContextPath()%>/board/list.jsp?no=2">상품/사이즈 문의</a>
			<a href = "<%=request.getContextPath()%>/board/list.jsp?no=3">지연 상품</a>
			<a href = "<%=request.getContextPath()%>/board/list.jsp?no=4">구매 후기</a>
			
		</div>
	</div>
	
	<div>
	<div class="row center">
		<h2>상품 문의</h2>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link-btn">글쓰기</a>
	</div>
	<div class="row center">
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th width="55%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
			<%for(BoardDto board : list){ %>
				<tr>
					<td><%=board.getNo()%></td>
					<td><%=board.getBoardTitle()%></td>
					<td><%=board.getMemberId() %></td>
					<td><%=board.getBoardDate() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
		
	</div>

<!-- 검색창  -->
	<div class="row right">
		<form action="list.jsp" method="get">
		
			<select name="column" class="form-input form-inline">
				<option value="board_title" selected>제목</option>
				<option value="board_content" selected>내용</option>
				<option value="board_wirter" selected>작성자</option>
				</select>
				
			<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input form-inline">
			<input type="submit" value="검색" class="form-btn form-inline">
			
		</form>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>