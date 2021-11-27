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

<%-- 입력--%>
<%
	//페이지네이션
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
	List<BuyDto> buyDtoList = replyDao.CanWriteReplyBuyList(id);
	%>

<%
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list4  = boardDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>

.reply-button button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.reply-button button{
  background:pink;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.reply-button button:hover{
  background:#fff;
  color:pink;
}
.reply-button button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background:pink;
  transition:400ms ease all;
}
.reply-button button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.reply-button button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
<script>
	//작성가능한 리뷰와 작성한 리뷰 닫고 보여주기
	$(function(){
	 $(".reply-hide").hide();
		
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

<!-- 게시물 관리 -->
<div class="container-1000 container-center">
	<div class="titleArea">
        <h2>게시물 관리</h2>
	</div>
	<br>
<div id="board-list">
    
        <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">분류</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-title">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">조회수</th>
                  </tr>
                </thead>
               <tbody>
            <%if(list4 !=null) {%>
             <%for(BoardDto boardDto : mpg.getList()) {%>
                <tr>
                    <td><%=boardDto.getNo()%></td>
                    <td><%=boardDto.getBoardTypeNo()%></td>
                   <td><a href="<%=request.getContextPath()%>/board/detail.jsp?no=<%=boardDto.getNo()%>"><%=boardDto.getBoardTitle()%></a></td>
                    <td><%=boardDto.getMemberId()%></td>
                    <td><%=boardDto.getBoardDate()%></td>
                    <td><%=boardDto.getBoardHit()%></td>
                 </tr>
            	</tbody>
			   <%}%>    
			   <%}%>
	</table>
  </div>

     	
<!-- 페이지네이션 -->		
<div class="row center">
	<div class="pagination">
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
</div>

<!-- 검색창 -->
<div id="board-search">

	<div class="search-window">
		<div class="search-wrap">
		<form action="myboard.jsp" method="get">
        <select style="font-size : 18px;" name="column" class="form-input form-inline">
          	<option value="board_title">제목</option>
            <option value="board_content">내용</option>
         </select>
         	<input type="hidden" name="memberId" value="<%=id%>">
         	<input type="search" name="keyword" required placeholder="검색어 입력" class="form-input form-inline">
          	<input type="submit" value="찾기" class="btn btn-dark">
        </form>
     	</div>
	</div>
</div>
	

<!-- 리뷰 선택칸 -->
<div class="row reply-button">
        <ul class="slide-menu">
          <li style="width: 100%">
          		<button class="can-write" style ="width:100%">작성가능한 리뷰</button>
          </li>
          <li style="width: 100%">
          		<button class="not-write" style ="width:100%">작성한 리뷰</button>
         </li>
        </ul>
      </div>
 	
<!-- 작성가능한 리뷰-->
<div class="row target2">
        <table class="table table-noborder table-hover reply-hide">
				<thead>
					<tr>
						<td><span>상품명</span></td>
						<td><span>가격</span></td>
						<td><span>상품정보</span></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="8">
							<hr>
						</td>
					</tr>
				</thead>
				<tbody>
					<%for(BuyDto buyDto : buyDtoList) {
          				ProductDto productDto = productDao.get(buyDto.getProductNo());
          			%>
					<tr>
						<td><%=productDto.getName() %></td>
          			  	<td><%=productDto.getPrice()%>원</td>
         				 <td><%=productDto.getDescription() %></td>
         				 <td><a href="<%=request.getContextPath()%>/reply/write.jsp?no=<%= buyDto.getNo()%>">리뷰작성 이동</a></td>
					</tr>
					<tr height="20px">
						<td colspan="8">
							<hr>
						</td>
					</tr>
					<%}%>
				</tbody>
		</table>
</div>

<!-- 작성한리뷰-->
<div class="row target1">
        <table class="table table-noborder table-hover reply-hide">
				<thead>
					<tr>
						<td><span>번호</span></td>
						<td><span>내용</span></td>
						<td><span>작성일</span></td>
					</tr>
					<tr>
						<td colspan="8">
							<hr>
						</td>
					</tr>
				</thead>
				<tbody>
					 <%for(ReplyDto replyDto : list) {%>
					<tr>
						<td><%=replyDto.getNo()%></td>
						<td><a href="<%=request.getContextPath()%>/board/review_detail.jsp?no=<%=replyDto.getNo()%>"><%=replyDto.getContent()%></a></td>
            			<td><%=replyDto.getTime()%></td>
					</tr>
					<tr height="20px">
						<td colspan="8">
							<hr>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
</div>

</div>
    
<jsp:include page="/template/footer.jsp"></jsp:include>