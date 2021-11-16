<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--입력 --%>

<%--처리 --%>
<% 
ProductDao productDao =new ProductDao();

int no =Integer.parseInt(request.getParameter("no"));
ProductDto productDto =productDao.get(no);
%>

<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="edit.kj" method="post">


<div class="container-700 container-center">
	
	<div class="row center">
		<h2>상품 수정</h2>
	</div>
	<div class="row">
		<label>상품번호</label>
		<input type="number" name="no" value=<%=productDto.getNo() %> class="form-input" readonly>
	</div>
	
	<div class="row">
		<label>소분류번호</label>
		<input type="number" name="SmallTypeNo" value=<%=productDto.getSmallTypeNo()%> class="form-input">
	</div>
	
	<div class="row">
		<label>상품이름</label>
		<input type="text" name="name" value=<%=productDto.getName()%> class="form-input">
	</div>
	
	<div class="row">
		<label>상품금액</label>
		<input type="number" name="price"  value=<%=productDto.getPrice()%> class="form-input">
	</div>
	
	<div class="row">
		<label>설명</label>
		<textarea name="description" rows="50" cols="100" ><%=productDto.getDescription()%></textarea>
		
	</div>
	
	<div class="row right">
		<a href="productlist.jsp" class="form-btn">목록</a>
		<input type="submit" value="수정" class="form-btn form-inline">	
	</div>
</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>