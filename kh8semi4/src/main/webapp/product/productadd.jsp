<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIM4PARKJANG</title>
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/layout.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/test.css">  -->
<style>


</style>
<jsp:include page="/template/header.jsp"></jsp:include>
<body>
<form action="./productadd.kj" method=post>
<div>
<h1>상품등록 페이지</h1>
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
	<textarea rows="40" cols="100" name="description" class=form-input>
	
	</textarea>
	</div>

</div>
<div><input type="submit" value="상품등록"></div>
</form>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>