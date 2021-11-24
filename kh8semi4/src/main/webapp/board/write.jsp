<%@page import="java.util.List"%>
<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BoardTypeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 입력 -->
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
<!-- 처리 -->
<%
	String boardSuperno = request.getParameter("boardSuperno");

	boolean isAnswer = boardSuperno != null;
	String title = isAnswer ? "답글작성" : "게시글 작성";
	int boardTypeNo = Integer.parseInt(request.getParameter("no"));
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
          <!-- 관리자면 전부선택  -->
          <%if(admin){ %>
          	<%for(BoardTypeDto boardTypeDto : list) {%>
          	<option value="<%=boardTypeDto.getNo()%>"<%=boardTypeNo == boardTypeDto.getNo() ? "selected" : "" %>><%=boardTypeDto.getName()%></option>
          	<%}%>
          <%}else{ %>
          <!-- 회원이면 고객센터만 선택  -->
          <option value="2">고객센터</option>
          <%} %>
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