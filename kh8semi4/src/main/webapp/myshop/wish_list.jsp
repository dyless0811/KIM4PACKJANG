<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.WishlistDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
    
<%-- 입력 --%>
<%
	String id = (String)session.getAttribute("loginId");
%>    

<%-- 처리 --%>
<%
	WishlistDao wishlistDao = new WishlistDao();
	List<WishlistDto> wishlistList = wishlistDao.WishProductMember(id);
%>
<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();
%>


<%-- 출력 --%>
<table border="1" width="500">
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
					<%for(ProductDto productDto : list){ %>
							<tr>
									<td align="center">없음</td>
									<td align="center"><%=productDto.getName()%></td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center">1300p</td>
									<td align="center">기본배송</td>
									<td align="center"><%=productDto.getPrice() %></td>
									<td align="center">주문하기</td>
							</tr>
			</tbody>
			<%} %>
</table>
    
<jsp:include page="/template/footer.jsp"></jsp:include>    