<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-400 container-center">
	<div class="titleArea">
        	<h2>회원가입 완료</h2>
	</div>
	<hr>
	<div class="row center">
		<a href="<%=request.getContextPath()%>/index.jsp">
			<button class="snap-sync-btn-submit">쇼핑하러 가기</button>
		</a>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>