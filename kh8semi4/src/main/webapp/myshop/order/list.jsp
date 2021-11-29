<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
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
	Format d = new DecimalFormat("#,##0");
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
	<div class="titleArea">
        <h2>주문조회</h2>
	</div>
	<div class="row">
			<table class="table table-noborder table-hover reply-hide">
						<thead>		
					<tr>
						<td><span>주문일자</span></td>
						<td><span>이미지</span></td>
						<td><span>상품명</span></td>
						<td><span>수량</span></td>
						<td><span>상품구매금액</span></td>
						<td><span>주문처리상태</span></td>
					</tr>
					<tr>
						<td colspan="10">
							<hr>
						</td>
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
									<td align="center"><%=buyDto.getCount()%>개</td>
									<td align="center"><%=d.format(buyDto.getCount() * productDto.getPrice())%>원</td>
									<td align="center"><%=buyDto.getStatus() %></td>
							</tr>
			</tbody>
			<%} %>
			
			</table>
	</div>
</div>			

<jsp:include page="/template/footer.jsp"></jsp:include>