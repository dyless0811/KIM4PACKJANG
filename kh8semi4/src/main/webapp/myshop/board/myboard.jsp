<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : 현재 로그인한 회원ID - String id --%>
<%
	String id = (String)session.getAttribute("loginId");
%>    

<%
	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto>list = 	replyDao.ProductReplyMember2(id);
	List<ProductDto>list2 = replyDao.CanWriteReply(id);
	BoardDao boardDao = new BoardDao();
	List<BoardDto>list3 = boardDao.list(id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<!-- jquery cdn 또는 보유한 파일을 불러오는 코드를 작성 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		//[1]다 숨김
		$(".page").hide();
		
		//[2] 페이지 번호 관리 변수 생성
		var p  = 0;
		
		//[3] 다음 단계로 버튼에 대한 이벤트 처리
		//= p를 1 증가시키고 해당하는 페이지를 표시
		//a태그 이동방지 -> e.preventDefault();
		$(".a-next").click(function(e) {
			e.preventDefault();
			p++;
			if(p > 2) {
				p=1;
			};
			$(".page").hide();
			$(".page").eq(p).show();
			console.log(p);
		});
		$(".a-prev").click(function(e) {
			e.preventDefault();
			console.log(p);
			p++;
			if(p > 1) {
				p=0;
				$(".page").eq(p).show();
				
			} else{				
			$(".page").hide();
			
			};
		});
	});
</script>

<!-- 문의 테이블 -->
<div class="container-1400 container-center">
      <div class="row center">
        	<h2>게시물 관리</h2>
      </div>
      <div class="row">
        <table class="table table-border table-hover">
          <thead>
            <tr>
              <th>번호</th>
              <th>분류</th>
              <th>제목</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          <%for(BoardDto boardDto : list3) {%>
            <tr>
              <td><%=boardDto.getNo() %></td>
              <td>문의</td>
              <td><%=boardDto.getBoardTitle() %></td>
              <td><%=boardDto.getBoardDate() %></td>
            </tr>
          
          <%} %>
        </table>
	</div>
    <!-- 검색창 -->
    <div class="row center">
        <form action="myboard.html" method="get">
          <select name="boardTypeNo">
            <option value="1">공지</option>
            <option value="2">문의</option>
          </select>
          <input type="search" name="keyword" required />
          <input type="submit" value="찾기" />
        </form>
        <br><br><br>
      </div>
      
      <!-- 분류 -->
     <div class="row">
        <ul class="slide-menu">
          <li style="width: 50%">
            <a class="center a-next" style="margin: 0 auto; width: auto">
              작성가능한 리뷰
           </a>
          </li>
          <li style="width: 50%">
            <a class="center a-prev" style="margin: 0 auto; width: auto">
              작성한 리뷰
            </a>
          </li>
        </ul>
      </div>
    	
    <!-- 테이블 -->
      <div class="row page">
        <table class="table table-border table-hover">
          <thead>
            <tr>
              <th>번호</th>
              <th>분류</th>
              <th>내용</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          <%for(ReplyDto replyDto : list) {%>
       	 <tr>
            <td><%=replyDto.getNo() %></td>
            <td>리뷰</td>
            <td><%=replyDto.getContent()%></td>
            <td><%=replyDto.getTime()%></td>
          </tr>
          
          </tbody>
          <%} %>
        </table>
      </div>
      
      	<!-- 작성가능한 리뷰 -->

         <div class="row page">
        <table class="table table-border table-hover">
          <thead>
            <tr>
              <th>상품명</th>
              <th>가격</th>
              <th>내용</th>
              
            </tr>
          </thead>
          <tbody>
          <%for(ProductDto productDto : list2) {%>
       	 <tr>
            <td><%=productDto.getName() %></td>
            <td><%=productDto.getPrice()%></td>
            <td><%=productDto.getDescription()%></td>
          </tr>
          
          </tbody>
          <%} %>
        </table>
      </div>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>