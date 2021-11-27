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
      
      <div class="container-1000 container-center">
      <form action="write.kj" method="post" enctype="multipart/form-data">
        <%if(isAnswer) {%>
        <input type="hidden" name="boardSuperno" value="<%=boardSuperno%>" />
        <%}%>
        <div class="row left" >
          <select name="boardTypeNo" style="font-size: 17px;">
          
          
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
		 
		  <div class="row center">
          <input type="text" name="boardTitle" placeholder="제목을 입력해주세요." style="width:1000px;" required >
        </div>
        
        </div>
       
        <div class="row center">
          
          <textarea
            style="width: 1000px; height: 400px"
            name="boardContent"
            placeholder="내용을 입력해주세요."
            required
          ></textarea>
        </div>
        <div style="display: flex; justify-content:space-between">
          <input type="file" name="attach" />
          <input type="submit" value="등록" />
        </div>
        
        
      </form>
      </div>
      </div>

<jsp:include page="/template/footer.jsp"></jsp:include>