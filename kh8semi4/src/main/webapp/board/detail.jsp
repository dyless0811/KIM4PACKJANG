<%@page import="semi.beans.BoardTypeDto"%>
<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BoardDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("loginId");
	int boardNo = Integer.parseInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardTypeDao boardTypeDao = new BoardTypeDao();
	Set<Integer> boardViewedNo = (Set<Integer>)session.getAttribute("boardViewedNo");
	
	if(boardViewedNo == null) {
		boardViewedNo = new HashSet<>();
	}
	
	if(boardViewedNo.add(boardNo)) {
		boardDao.view(boardNo, memberId);
	}
	session.setAttribute("boardViewedNo", boardViewedNo);
	BoardDto boardDto = boardDao.get(boardNo);
	BoardTypeDto boardTypeDto = boardTypeDao.get(boardDto.getBoardTypeNo());
	String boardTypeName = boardTypeDto.getName();

	//보드이미지 추가해야함
%>
<jsp:include page="/template/header.jsp"></jsp:include>

    
    <div class="container-1400 container-center">
      <div class="row right">
        <span><a href="#">홈</a></span>
        <span><a href="#">게시판</a></span>
        <span><a href="#"><%=boardTypeName%></a></span>
      </div>
      <div class="row center">
        <h2><%=boardTypeName%></h2>
      </div>
      <div class="row">
        <h3><%=boardDto.getBoardTitle()%></h3>
      </div>
      <div class="row">
      	<span><%=boardDto.getMemberId()%></span><span><%=boardDto.getBoardHit()%></span>
      </div>
      <div class="row">
        <hr />
      </div>
      <div class="row">
        <%=boardDto.getBoardContent()%>
      </div>
      <div class="row left">
        <br /><br /><br />
        <hr />
        <a href="#">목록</a>
      </div>
    </div>
<jsp:include page="/template/footer.jsp"></jsp:include>