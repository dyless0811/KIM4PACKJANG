<%@page import="semi.beans.ProductImageDto"%>
<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 --%>
<%
	String id = (String)session.getAttribute("loginId");
%>

<%-- 처리 --%>
<%
	BuyDao buyDao = new BuyDao();
	List<BuyDto> buyList = buyDao.BuyProductMember(id);
	
	ProductDao productDao =new ProductDao();
	ProductImageDao productImageDao = new ProductImageDao();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<%-- 출력 --%>
<div class="container-1200 container-center">
	<div class="row center">
	<h2>주문조회</h2>
	</div>

	<div class="row">
			<table class="table table-border">
						<thead>		
					<tr>
							<th>주문일자</th>
							<th>이미지</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>상품구매금액</th>
							<th>주문처리상태</th>
							<th>취소/교환/반품</th>
					</tr>
			</thead>
			<tbody>
					<%for(BuyDto buyDto : buyList) {
						ProductDto productDto = productDao.get(buyDto.getProductNo());
						ProductImageDto productImageDto = productImageDao.get(productDto.getNo());
					%>
							<tr>
									<td align="center"><%=buyDto.getBuyDate() %></td>
									<td align="center"><img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=productDto.getNo()%>" width="150px" height="100px"></td>
									<td align="center"><a href="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=productDto.getNo()%>"><%=productDto.getName()%></a></td>
									<td align="center"><%=buyDto.getCount()%></td>
									<td align="center"><%=buyDto.getCount() * productDto.getPrice()%></td>
									<td align="center"><%=buyDto.getStatus() %></td>
									<td align="center">없음</td>
							</tr>
			</tbody>
			<%} %>
			
			</table>
	</div>
</div>			

<jsp:include page="/template/footer.jsp"></jsp:include>