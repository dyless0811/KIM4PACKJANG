<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.WishlistDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<%-- 입력 --%>
<%
	String id = (String)session.getAttribute("loginId");
%>    

<%-- 처리 --%>
<%
	WishlistDao wishlistDao = new WishlistDao();
	List<ProductDto> list2 = wishlistDao.WishProductMember(id);
%>
<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();

%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
	<div class="row center">
		<h2>관심상품</h2>
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
							<th>합계</th>
							<th>선택</th>
					</tr>
			</thead>
			<tbody>
					<%for(ProductDto productDto : list2){ %>
							<tr>
									<td align="center">없음</td>
									<td align="center"><%=productDto.getName()%></td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center"><%=productDto.getPrice() *0.1 %>p</td>
									<td align="center">기본배송</td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center">
									<a href="<%=request.getContextPath()%>/product/wishlistdelete.kj?<%=productDto%>">삭제하기</a>
									
									</td>
							</tr>
			</tbody>
			<%} %>
	</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include> 