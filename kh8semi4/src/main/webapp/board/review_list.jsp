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

<div class="container-1400 container center">
	<div class="row center">
		<h1>★BEST REVIEW★</h1>
		</div>
		
		<!-- for문에서, container가 큰 한개. flex-gro을 4개가 되면 큰 container를 추가한다. -->
		<div class="row flex-container" style="margin: 50px">
		<%
		int i =0;
		for(ReplyListVo replyListVo : volist){%>
			<%if(i %4==0){ %>
			</div>
				<div class="row flex-container" style="margin: 50px">
			<%} %>
			<div class="row flex-gro">
	    		<table class="table table-border table-hover">
		    		<tbody>
					   	 	<!-- 상품 이미지 자리-->
							<td>
							
							<img src="C:/upload/kh84/product/ <%=replyListVo.getProductImageSavename()%>" width="100%" class="image  image-border">
							</td>
			    		<tr>
			    			<td>
			    			<a href ="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=replyListVo.getProductNo()%>"><%=replyListVo.getName()%></a>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td><%=replyListVo.getStarpoint()%>점/ 총 리뷰수:<%=replyListVo.getReplyCount()%>개</td>
			    		</tr>
			    		<%
			    		List<ReplyDto> replyList = replyDao.list3(replyListVo.getProductNo());
			    		%>
			    		<%
			    		for(ReplyDto replydto : replyList){
			    		%>
			    			<tr>
			    			<td><%=replydto.getMemberId()%><%=replydto.getContent()%></td>
			    			</tr>
			    		<%} %>
					</tbody>
				</table>
			</div>
			<% i++; }%>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>