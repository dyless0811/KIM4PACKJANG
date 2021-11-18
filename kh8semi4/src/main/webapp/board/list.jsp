<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardPagenation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : 검색분류(column), 검색어(keyword) --%>



<%-- 처리 --%>
<%
BoardPagenation boardPagenation = new BoardPagenation(request);
boardPagenation.calculate();
BoardDto boardDto = new BoardDto();
int boardTypeNo = Integer.parseInt(request.getParameter("no"));
%>
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1200 container-center">
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
		

			
		</div>
	</div>
	
	<div>
	<div class="row center">
		<h2>상품 문의</h2>
	</div>
	
	<div class="row right">
		<a href="write.jsp?no=<%=boardTypeNo %>" class="link-btn">글쓰기</a>
	</div>
	<div class="row center">
	<%if(boardPagenation.getList().isEmpty()) {%>
		<h3>데이터가 존재하지 않습니다</h3>
	<%}else {%>
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
		  	<td style="text-align:left;<%="padding-left:"+(10+40*boardDtolist.getBoardDepth())+"px"%>">
		  		<a href="<%=request.getContextPath()%>/board/detail.jsp?no=<%=boardDtolist.getNo()%>"><%=boardDtolist.getBoardTitle()%></a>
		  	</td>
		  	<td><%=boardDtolist.getMemberId()%></td>
		  	<td><%=boardDtolist.getBoardDate()%></td>
		  	<td><%=boardDtolist.getBoardHit()%></td>
		  </tr>
		  <%} %>
		</tbody>
	</table>
	<%}%>
	</div>
<!-- 페이지네이션 -->
<div class="row center">
<%if(boardPagenation.getStartBlock() > 1){ %>
	<%if(boardPagenation.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=boardPagenation.getColumn()%>&keyword=<%=boardPagenation.getKeyword()%>&p=<%=boardPagenation.getStartBlock()-1%>&no=<%=boardTypeNo%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=boardPagenation.getStartBlock()-1%>&no=<%=boardTypeNo%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int i = boardPagenation.getStartBlock(); i <= Math.min(boardPagenation.getFinishBlock(),boardPagenation.getLastBlock()); i++){ %>
	<%if(boardPagenation.isSearch()){ %>
	<!-- 검색용 링크 -->
	<a href="list.jsp?column=<%=boardPagenation.getColumn()%>&keyword=<%=boardPagenation.getKeyword()%>&p=<%=i%>&no=<%=boardTypeNo%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="list.jsp?p=<%=i%>&no=<%=boardTypeNo%>"><%=i%></a>
	<%} %>
<%} %>

<%if(boardPagenation.getFinishBlock() < boardPagenation.getLastBlock()){ %>
	<%if(boardPagenation.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=boardPagenation.getColumn()%>&keyword=<%=boardPagenation.getKeyword()%>&p=<%=boardPagenation.getFinishBlock()+1%>&no=<%=boardTypeNo%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=boardPagenation.getFinishBlock()+1%>&no=<%=boardTypeNo%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>
</div>

<!-- 검색창  -->

	<div class="row right">
		<form action="list.jsp" method="get">
			<input type="hidden" name="no" value="<%=boardTypeNo%>">
			<select name="column" class="form-input form-inline">
				<%if(boardPagenation.columnIs("board_title")){ %>
				<option value="board_title" selected>제목</option>
				<%}else{ %>
				<option value="board_title">제목</option>
				<%} %>
				
				<%if(boardPagenation.columnIs("board_content")){ %>
				<option value="board_content" selected>내용</option>
				<%}else{ %>
				<option value="board_content">내용</option>
				<%} %>
				
				<%if(boardPagenation.columnIs("member_id")){ %>
				<option value="member_id" selected>작성자</option>
				<%}else{ %>
				<option value="member_id">작성자</option>
				<%} %>
				</select>
				
			<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input form-inline">
			<input type="submit" value="검색" class="form-btn form-inline">
			</form>
	</div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>