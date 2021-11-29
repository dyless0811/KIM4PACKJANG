<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="<%=request.getContextPath()%>/member/id/find_id.kj" method = "post">
	<div class="container-400 container-center">
	<div class="titleArea">
        	<h2>아이디 찾기</h2>
	</div>
	<div class="row">
		<input type="text" name="name" class="form-input"  placeholder="이름" required autocomplete="off">
	</div>
	<div class="row">
		<input type="tel" name="phone" class="form-input" placeholder="휴대전화 입력(-포함)" required autocomplete="off">
	</div>
	<div class ="row">
		<button class="snap-sync-btn-submit">아이디 찾기</button>
	</div>
</div>
</form>

<%if(request.getParameter("error") != null){ %>
	<div class="row center">
		<h4 class="error">존재하지 않는 회원입니다.</h4>
	</div>
<%}%>	

<jsp:include page="/template/footer.jsp"></jsp:include>