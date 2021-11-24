<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  사용자 => 리뷰 작성 준비물: 별점 등록, 내용 작성, 사진 파일 업로드, -->
<!-- 페이지 => 상품 번호 -->

<!-- 처리 -->
<%
	
	int buyNo = Integer.parseInt(request.getParameter("no"));
	BuyDao buyDao = new BuyDao();
	BuyDto buyDto = buyDao.get(buyNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.get(buyDto.getProductNo());
%>

<!-- 출력 -->
<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="container-1000 container-center" >
		<div class="row center">
		<h2><%=productDto.getName()%></h2>
		</div>
		
		<form action="<%=request.getContextPath()%>/reply/add.kj" method="post" enctype="multipart/form-data">
		<input type="hidden" name="buyNo" value="<%=buyNo%>">
		<div class="row right">
			<select name="starPoint">
				<option value= "5">★★★★★</option>
				<option value= "4">★★★★☆</option>
				<option value= "3">★★★☆☆</option>
				<option value= "2">★★☆☆☆</option>
				<option value= "1">★☆☆☆☆</option>
			</select>
		</div>
		
		<div class="row center">
			<textarea
				style="width : 1000px; height : 400px"
				name= "content"
				required>
			</textarea>
		</div>
		<div class="row">
		<input type="file" name="attach">
		</div>
		<div class="row right">
		<input type="submit" value="등록">
		</div>
		
		</form>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>