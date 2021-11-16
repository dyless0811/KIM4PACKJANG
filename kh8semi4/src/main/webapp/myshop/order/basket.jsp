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

%>


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
							<th>합계</th>
					</tr>
			</thead>
			<tbody>
					<%for(ProductDto productDto : list){ %>
							<tr>
									<td align="center">없음</td>
									<td align="center"><%=productDto.getName()%></td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center"><%=productDto.getPrice() *0.1 %>p</td>
									<td align="center">기본배송</td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center">주문하기</td>
							</tr>
			</tbody>
			<%} %>
	</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>