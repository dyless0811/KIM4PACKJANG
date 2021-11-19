<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 입력 --%>

<%-- 처리 --%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1400 container center">
	<div class="row center">
		<h1>★BEST REVIEW★</h1>
		</div>
		
		<!-- for문에서, container가 큰 한개. flex-gro을 4개가 되면 큰 container를 추가한다. -->
		<div class="row flex-container" style="margin: 50px">
		<%for(int i = 0; i <12; i++){%>
			<%if(i%4==0){ %>
			</div>
				<div class="row flex-container" style="margin: 50px">
			<%} %>
			<div class="row flex-gro">
	    		<table class="table table-border table-hover">
		    		<tbody>
					   	 	<!-- 상품 이미지 자리-->
							<td>
							<img src="https://via.placeholder.com/300x350?text=ProductImage" width="100%" class="image  image-border">
							</td>
			    		<tr>
			    			<td>
			    			상품 이름,번호 : productName, productNo(vo에서가져와),
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>별점자리 : vo에서starpoint</td>
			    		</tr>
			    		<tr>
			    			<td>리뷰 디테일자리에: reply_detail.jsp로 가야됨. replyCount, productDao listByReplyCount()리뷰순, replydao에 있는게 최신순  </td>
			    		</tr>
					</tbody>
				</table>
			</div>
			<%}%>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>