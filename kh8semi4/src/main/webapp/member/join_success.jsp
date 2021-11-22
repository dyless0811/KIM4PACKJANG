<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-500 container-center">
	<div class="row center">
		<h2>회원 가입 완료</h2>
	</div>
	<div class="row center">
		<h2>회원가입이 완료 되었습니다.</h2>
	</div>
	<hr>
	<div class="row center">
		<a href="<%=root%>/index.jsp">완료</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>