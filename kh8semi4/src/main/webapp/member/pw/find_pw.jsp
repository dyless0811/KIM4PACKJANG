<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=root%>/member/pw/find_pw.kj" method = "post">
	<div class="container-400 container-center">
	<div class="titleArea">
        	<h2>비밀번호 찾기</h2>
	</div>
	<div class="row">
		<input type="text" name="id" class="form-input" placeholder="아이디" autocomplete="off" required>
	</div>
	<div class="row">
		<input type="text" name="email" class="form-input" placeholder="이메일" autocomplete="off" required>
	</div>
	<div class="row">
			<input type="tel" name="phone" class="form-input" placeholder="휴대전화 입력(-포함)" autocomplete="off" required>
	</div>
	<div class="row">
		<button class="snap-sync-btn-submit">비밀번호 찾기</button>
	</div>	
	</div>

</form>

<%if(request.getParameter("error") != null){ %>
	<div class="row center">
		<h4 class="error">존재하지 않는 회원입니다.</h4>
	</div>
<%}%>

<jsp:include page="/template/footer.jsp"></jsp:include>