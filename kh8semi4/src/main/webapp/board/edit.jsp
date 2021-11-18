<%@page import="semi.beans.BoardImageDto"%>
<%@page import="semi.beans.BoardImageDao"%>
<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BoardTypeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardTypeDao boardTypeDao = new BoardTypeDao();
	List<BoardTypeDto> list = boardTypeDao.list();
	
	int boardNo = Integer.parseInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.get(boardNo);
	BoardTypeDto boardTypeDto = boardTypeDao.get(boardDto.getBoardTypeNo());
	BoardImageDao boardImageDao = new BoardImageDao();
	BoardImageDto boardImageDto = boardImageDao.getByBoardNo(boardNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

    <div class="container-1400 container-center">
      <div class="row center">
        <h2>게시글 수정</h2>
      </div>
      <form action="edit.kj" method="post" enctype="multipart/form-data">
        <input type="hidden" name="boardNo" value="<%=boardDto.getNo()%>" />
        <input type="hidden" name="boardSuperno" value="<%=boardDto.getBoardSuperno()%>" />
        <div>
          <select name="boardTypeNo">
          	<%for(BoardTypeDto typeDto : list) {%>
          	<option value="<%=typeDto.getNo()%>" <%=boardDto.getBoardTypeNo() == typeDto.getNo() ? "selected" : "" %>><%=typeDto.getName()%></option>
          	<%}%>
		 </select>
        </div>
        <div class="row center">
          제목<br />
          <input type="text" name="boardTitle" value="<%=boardDto.getBoardTitle() %>" required />
        </div>
        <div class="row center">
          내용<br />
          <textarea
            style="width: 1000px; height: 400px"
            name="boardContent"
            required
          ><%=boardDto.getBoardContent() %></textarea>
        </div>
        <div class="row">
          <input type="file" name="attach"/>
        </div>
        <div class="row">
          <input type="submit" value="등록" />
        </div>
        <div class="row">
        	<input type="radio" name="selectImage" value="existing" checked="checked"> 기존 파일 <%=boardImageDto!=null ? boardImageDto.getBoardUploadName() : ""%>
        	<input type="radio" name="selectImage" value="new"> 신규 파일
        	<input type="radio" name="selectImage" value="delete"> 파일 삭제
        </div>
      </form>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>