<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BasketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>

<%
	String id = (String)session.getAttribute("loginId");
%>    

<%

BasketDao basketDao = new BasketDao();
List<ProductDto> list = basketDao.BasketProductMember(id);
BuyDao buyDao = new BuyDao();
List<BuyDto> list2 = buyDao.BuyProductMember(id);
%>
<script>
$(function(){
	$(".confirm-link").click(function(e){
		e.preventDefault();
		
	}); 
	
});
</script>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
	<div class="row center">
		<h2>장바구니</h2>
	</div>
	<div class="row">
			<table class="table table-border">
			<thead>		
					<tr>
							<th>이미지</th>
							<th>상품정보</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>선택</th>
							
					</tr>
			</thead>
			<tbody>
					<%for(ProductDto productDto : list){ %>
							<tr>
									<td align="center">없음</td>
									<td align="center">
									<a href = "<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=productDto.getNo()%>"><%=productDto.getName() %></a>
									</td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center"><%=productDto.getPrice() *0.01 %>p</td>
									<td align="center">배송 전</td>
									<td align="center"><%=productDto.getPrice() %>원</td>
									<td align="center">주문하기</td>
									<td align="center">
									<a href = "bakset.jsp"class = "confirm-link">삭제</a>
									</td>
									
							</tr>
			</tbody>
			<%} %>
	</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>