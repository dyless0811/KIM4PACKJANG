<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardTypeDto"%>
<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@page import="semi.beans.ReplyDto"%>
<%@page import="semi.beans.ReplyListVo"%>
<%@page import="semi.beans.ReplyDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 입력 --%>

<%-- 처리 --%>
<%
	ReplyDao replyDao = new ReplyDao();
	List<ReplyListVo> volist = replyDao.listByReplyCount();
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.item {
   display: flex;
   flex-direction: column;
   flex: 1 1 1 1 25%;
   flex-basis :auto;
}

a:link { 
color: black; text-decoration: none;
}

a:visited { 
color: black; text-decoration: none;
}

</style>



<div class="notice" style="padding-bottom : 0px">
  <div class="page-title">
        <div class=" container-1200 container-center">
        <div class="row center">
            <h3>Community</h3>
            <br>
            <h4>OPEN : 10:00 - 17:00 / LUNCH : 12:30 - 13:30</h4>
            <br>
            </div>
            <div class="row center">
            	<h2>상품 후기</h2>
            </div>
        </div>
    </div>
 </div>   
 
<div class="container-1400 container-center">
	<div class="row center">
		<h1>★BEST REVIEW★</h1>
		</div>
		
		<!-- for문에서, container가 큰 한개. flex-gro을 4개가 되면 큰 container를 추가한다. -->
		<div class="row flex-container">
		<%
		int i =0;
		for(ReplyListVo replyListVo : volist){%>
			<%if(i %4==0){ %>
			</div>
				<div class="row flex-container" style="margin: 50px">
			<%} %>
			<div class="row">
	    		<table class="table table-border table-hover">
		    		<tbody>
					   	 	<!-- 상품 이미지 자리-->
					   	 <tr height="350px">
							<td width="25%">
							<img src="C:/upload/kh84/product/ <%=replyListVo.getProductImageSavename()%>"  width="330px" height="350px" >
							</td>
						</tr>
			    		<tr>
			    			<td>
			    			<a href ="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=replyListVo.getProductNo()%>"><%=replyListVo.getName()%></a>
			    			</td>
			    		</tr>
			    		<!-- 별점, 리뷰개수-->
			    		<tr>
			    			<td><%=replyListVo.getStarpoint()%>점/ 총 리뷰수:<%=replyListVo.getReplyCount()%>개</td>
			    		</tr>
			    		<!--리뷰 top 3 자리(detail.jsp 연결하기)-->
			    		<%
			    		List<ReplyDto> replyList = replyDao.list3(replyListVo.getProductNo());
			    		%>
			    		<%
			    		for(ReplyDto replyDto : replyList){
			    			BuyDao buyDao = new BuyDao();
			    			BuyDto buyDto = buyDao.get(replyDto.getBuyNo());
			    		%>
			    			<tr>
			    			<td>
			    			<a href="<%=request.getContextPath()%>/board/review_detail.jsp?no=<%=replyDto.getNo()%>"><%=buyDto.getMemberId()%><%=replyDto.getContent()%></a>
			    			</td>
			    			</tr>
			    		<%} %>
					</tbody>
				</table>
			</div>
			<% i++; }%>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>