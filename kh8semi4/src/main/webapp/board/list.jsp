
<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardPagenation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : 검색분류(column), 검색어(keyword) --%>
 <!-- 관리자 권한 가져오기  -->
 <%
 String grade=(String)session.getAttribute("grade");
 boolean admin = grade != null && grade.equals("관리자");
 %>
 
 <!-- 회원 아이디 가져오기 -->
<%
String id = (String)session.getAttribute("loginId");
boolean member = grade != null && grade.equals("회원");
%>

<%-- 처리 --%>
<%
BoardPagenation boardPagenation = new BoardPagenation(request);
boardPagenation.calculate();
BoardDto boardDto = new BoardDto();
int boardTypeNo = Integer.parseInt(request.getParameter("no"));
%>


<jsp:include page="/template/header.jsp"></jsp:include>

    <div class="notice">
  <div class="page-title">
        <div class=" container-1200 container-center">
        <div class="row center">
            <h3>NOTICE</h3>
            <br>
            <h4>OPEN : 10:00 - 17:00 / LUNCH : 12:30 - 13:30</h4>
            </div>
        </div>
    </div>
    
<!-- 검색창  -->
<div id="board-search">
<div class="container-1200 container-center">
	<div class="search-window">
		<form action="list.jsp" method="get">
			<div class="search-wrap">
				<input type="hidden" name="no" value="<%=boardTypeNo%>">
				<select style="font-size : 18px;" name="column" class="form-input form-inline">
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
				
				<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input form-inline" value="">
				<input type="submit" value="검색" class="btn btn-dark">
				</form>
		</div>
	</div>
</div>
  
  <!-- board list area -->
    <div id="board-list">
        <div class="container-1200 container-center">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-title">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">조회수</th>
                    
                </tr>
                </thead>
                <tbody>
                <%for(BoardDto boardDtolist : boardPagenation.getList()) {%>
                <tr>
                    <td><%=boardDtolist.getNo()%></td>
                    <th style="text-align:left;<%="padding-left:"+(10+40*boardDtolist.getBoardDepth())+"px"%>">
                      <a href="<%=request.getContextPath()%>/board/detail.jsp?no=<%=boardDtolist.getNo()%>"><%=boardDtolist.getBoardTitle()%></a>
                      <p>테스트</p>
                    </th>
                    <td><%=boardDtolist.getMemberId()%></td>
		  			<td><%=boardDtolist.getBoardDate()%></td>
		  			<td><%=boardDtolist.getBoardHit()%></td>
                </tr>
                <%} %>
                </tbody>
            </table>
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
        </div>
    </div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>