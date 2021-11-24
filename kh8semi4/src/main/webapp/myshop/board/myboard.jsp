<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.MpgPagination"%>
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
String isType = request.getParameter("bigtypeno");
String isNo = request.getParameter("no");
	String id = (String)session.getAttribute("loginId");
	String column = request.getParameter("column");
	String keyword = request.getParameter("keyword");
	MpgPagination mpg = new MpgPagination(request);
	mpg.calculate();
%>    

<%
	ReplyDao replyDao = new ReplyDao();
	ProductDao productDao = new ProductDao();
	List<ReplyDto>list = 	replyDao.ProductReplyMember2(id);
	List<ProductDto>list2 = replyDao.CanWriteReply(id);
	List<BuyDto> buyDtoList = replyDao.CanWriteReplyBuyList(id);
	%>

<%
BoardDao boardDao = new BoardDao();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<script>
	$(function(){
	 $(".test1").hide();
		
	 	$(".can-write").click(function(){
			$(".target1 > table").hide();
			$(".target2 > table").fadeToggle();
		});
		$(".not-write").click(function(){
				$(".target2 > table").hide();
				$(".target1 > table").fadeToggle();
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
           <%for(BoardDto boardDto : mpg.getList()) {%>
            <tr>
              <td><%=boardDto.getNo() %></td>
              <td>문의</td>
              <td><a href="<%=request.getContextPath()%>/board/detail.jsp?no=<%=boardDto.getNo()%>"><%=boardDto.getBoardTitle()%></a></td>
              <td><%=boardDto.getBoardDate() %></td>
            </tr>
           <%} %>
        </table>
    </div>
	
	<div>
		<select name="boardTypeNo">
		<option value="1" selected>작성일자별</option>
		<option value="2">분류별</option>
		</select>
	</div>
	
<!-- 검색창 -->
    <div class="row center">
        <form action="myboard.jsp" method="get">
          <select name="column">
          	<option value="board_title">제목</option>
            <option value="board_content">내용</option>
         </select>
         <input type="hidden" name="memberId" value="<%=id%>">
         <input type="search" name="keyword" required placeholder="검색어 입력">
          <input type="submit" value="찾기">
        </form>
        <br><br><br>
		</div>

<!-- 페이지네이션 -->		
	<div class="row center">
<%if(mpg.getStartBlock() > 1){ %>
	<%if(mpg.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="myboard.jsp?memberId=<%=id%>&column=<%=mpg.getColumn()%>&keyword=<%=mpg.getKeyword()%>&p=<%=mpg.getFinishBlock()+1%>%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="myboard.jsp?memberId=<%=id%>&p=<%=mpg.getStartBlock()-1%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int t = mpg.getStartBlock(); t <= Math.min(mpg.getFinishBlock(),mpg.getLastBlock()); t++){ %>
	<%if(mpg.isSearch()){ %>
	<!-- 검색용 버튼 -->
	<a href="myboard.jsp?memberId=<%=id%>&column=<%=mpg.getColumn()%>&keyword=<%=mpg.getKeyword()%>&p=<%=t%>"><%=t%></a>
	<%}else{ %>
	<!-- 목록용 버튼 -->
		
		<a href="myboard.jsp?memberId=<%=id%>&p=<%=t%>"><%=t%></a>
		
		
		<%} %>
	<%} %>


<%if(mpg.getFinishBlock() < mpg.getLastBlock()){ %>
	<%if(mpg.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="myboard.jsp?memberId=<%=id%>&column=<%=mpg.getColumn()%>&keyword=<%=mpg.getKeyword()%>&p=<%=mpg.getFinishBlock()+1%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="myboard.jsp?memberId=<%=id%>&p=<%=mpg.getFinishBlock()+1%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>
</div>
		
      <div class="row">
        <ul class="slide-menu">
          <li style="width: 50%">
          		<button class="can-write form-btn ">작성가능한 리뷰</button>
          </li>
          <li style="width: 50%">
          		<button class="not-write form-btn ">작성한 리뷰</button>
         </li>
        </ul>
      </div>
    	
    <!-- 작성한리뷰-->
      <div class="row target1">
        <table class="table table-border table-hover test1">
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
      
      	<!-- 작성가능한 리뷰-->
		<div class="row target2">
        <table class="table table-border table-hover test1">
          <thead>
            <tr>
              <th>상품명</th>
              <th>가격</th>
              <th>내용</th>
             </tr>
          </thead>
          <tbody>
          	<%for(BuyDto buyDto : buyDtoList) {
          		ProductDto productDto = productDao.get(buyDto.getProductNo());
          	%>
       	 <tr>
            <td><a href="<%=request.getContextPath()%>/reply/write.jsp?no=<%= buyDto.getNo()%>"><%=productDto.getName() %></a></td>
            <td><%=productDto.getPrice()%></td>
            <td><%=productDto.getDescription()%></td>
          </tr>
         </tbody>
          <%} %>
        </table>
      </div>
    
</div>
    
<jsp:include page="/template/footer.jsp"></jsp:include>