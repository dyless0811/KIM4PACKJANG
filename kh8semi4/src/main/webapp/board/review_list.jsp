<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 입력 --%>

<%-- 처리 --%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-400 container center">
	<div class="row center">
		<h1>★BEST REVIEW★</h1>
		</div>
		<div class="row flex-container">
		
			<div class="row flex-gro">
	    		<table class="table table-border table-hover">
		    		<tbody>
		    			<tr height="300px">
					   	 	<!-- 상품 이미지 자리-->
							<td>
							<img src="https://via.placeholder.com/300x350?text=ProductImage" width="100%" class="image  image-border">
							</td>
			    		</tr>
			    		<tr>
			    			<td>productName, productNo(vo에서가져와),</td>
			    		</tr>
			    		<tr>
			    			<td>vo에서starpoint</td>
			    		</tr>
			    		<tr>
			    			<td>리뷰 디테일자리에: reply_detail.jsp로 가야됨. replyCount, productDao listByReplyCount()리뷰순, replydao에 있는게 최신순  </td>
			    		</tr>
					</tbody>
				</table>
			</div>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>