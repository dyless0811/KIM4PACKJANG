<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="./productadd.kj" method=post enctype="multipart/form-data"> 
	<div>
	<h1>상품등록 페이지</h1>
	</div>
	<div class="row">
	 상품명 <input type="text"  name="name" required class=form-input>
	</div>
	<div  class="row">
	 소분류번호 <input type="number" name="smallTypeNo" class=form-input>
	</div>
	<div  class="row">
	 가격 <input type="number" name="price" class=form-input>
	</div>
	<div  class="row">
	상품설명
	<textarea rows="40" cols="100" name="description" class=form-input></textarea>
	</div>
	
	<div class="row">
	상품이미지
	<input type="file" name="attach" accept="image/*" class="form-input">
	</div>

	<div class="row">
	<input type="submit" value="상품등록">
	</div>
</form>




<jsp:include page="/template/footer.jsp"></jsp:include>