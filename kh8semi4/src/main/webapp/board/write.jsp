<%@page import="java.util.List"%>
<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BoardTypeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardSuperno = request.getParameter("boardSuperno");

	boolean isAnswer = boardSuperno != null;
	String title = isAnswer ? "답글작성" : "게시글 작성";

	BoardTypeDao boardTypeDao = new BoardTypeDao();
	List<BoardTypeDto> list = boardTypeDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

    <div class="container-1400 container-center">
      <div class="row center">
        <h2><%=title %></h2>
      </div>
      <form action="write.kj" method="post" enctype="multipart/form-data">
        <%if(isAnswer) {%>
        <input type="hidden" name="boardSuperno" value="<%=boardSuperno%>" />
        <%}%>
        <div>
          <select name="boardTypeNo">
          	<%for(BoardTypeDto boardTypeDto : list) {%>
          	<option value="<%=boardTypeDto.getNo()%>"><%=boardTypeDto.getName()%></option>
          	<%}%>
		 </select>
        </div>
        <div class="row center">
          제목<br />
          <input type="text" name="boardTitle" required />
        </div>
        <div class="row center">
          내용<br />
          <textarea
            style="width: 1000px; height: 400px"
            name="boardContent"
            required
          ></textarea>
        </div>
        <div class="row">
          <input type="file" name="attach" />
        </div>
        <div class="row">
          <input type="submit" value="등록" />
        </div>
      </form>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>