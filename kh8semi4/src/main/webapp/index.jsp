<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1400 container-center">
	<div class="row">
		<h1>임시방편</h1>
		
		
		<a href="<%=request.getContextPath()%>/myshop/index.jsp">마이페이지</a>
		<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
		<a href="<%=request.getContextPath()%>/member/logout.kj">로그아웃</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>