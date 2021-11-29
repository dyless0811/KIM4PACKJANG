<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@page import="semi.beans.WishlistVo"%>
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
	Format d = new DecimalFormat("#,##0");
%>    
<%-- 처리 --%>
<%
	WishlistDao wishlistDao = new WishlistDao();
	List<ProductDto> list2 = wishlistDao.WishProductMember(id);
	
	List<WishlistVo> list = wishlistDao.WishProductMember2(id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
	<div class="titleArea">
        <h2>관심상품</h2>
	</div>
	<div class="row">
			<table class="table table-noborder table-hover reply-hide">
			<thead>		
					<tr>
							<td><span>이미지</span></td>
							<td><span>상품정보</span></td>
							<td><span>판매가</span></td>
							<td><span>배송구분</span></td>
							<td><span>배송비</span></td>
							<td><span>선택</span></td>
					</tr>
					<tr>
						<td colspan="10">
							<hr>
						</td>
					</tr>
			</thead>
			<tbody>
					<%for(WishlistVo wishlistVo : list){ %>
							<tr>
									<td align="center">
										<%if(wishlistVo.getProductFileSavename() != null) {%>
										<img src="<%=root%>/product/productImage.kj?no=<%=wishlistVo.getProductNo()%>" width="100px" height="100px">
										<%} else {%>
										<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg" width="320px" height="320px">
										<%}%>
									</td>
									<td align="center"><a href="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=wishlistVo.getProductNo()%>"><%=wishlistVo.getProductName()%></a></td>
									<td align="center"><%=d.format(wishlistVo.getPrice())%>원</td>
									<td align="center">기본배송</td>
									<td align="center">무료배송</td>
									<td align="center">
									<a href="<%=request.getContextPath()%>/product/wishlistdelete.kj?wishlistNo=<%=wishlistVo.getWishlistNo()%>" class="btnNormal">삭제하기</a>
									</td>
							</tr>
			</tbody>
					<%} %>
			</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include> 