<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("loginId");
%>    

<%
	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto>list = 	replyDao.ProductReplyMember2(id);
	List<ProductDto>list2 = replyDao.CanWriteReply(id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<!--멀티페이지 스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$(".page").hide();
		$(".page").eq(0).show();
		
		var p  = 0;
		
		$(".a-next").click(function(e) {
			e.preventDefault();
			
			p++;
			if(p > 2) {
				p=1;
			};
			$(".page").hide();
			$(".page").eq(p).show();
		});
		$(".a-prev").click(function(e) {
			e.preventDefault();
			p--;
			if(p < 2) {
				p=0;
			};
			$(".page").hide();
			$(".page").eq(p).show();
		});
	});
</script>

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
            <tr>
              <td>1</td>
              <td>문의</td>
              <td>난문의를!했다</td>
              <td>오늘</td>
            </tr>
            <tr>
              <td>2</td>
              <td>문의</td>
              <td>난!문의를!했다</td>
              <td>오늘</td>
            </tr>
          </tbody>
        </table>
      </div>
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
      
      
      
      <div class="row">
        <ul class="slide-menu">
          <li style="width: 50%">
            
            <a class="center a-next" style="margin: 0 auto; width: auto" href="#">
              작성가능한 리뷰(1)
           
            </a>
          </li>
          <li style="width: 50%">
            <a class="center a-prev" style="margin: 0 auto; width: auto" href="#">
              작성한 리뷰(11)
            </a>
          </li>
        </ul>
      </div>
    
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