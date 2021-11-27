<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=root%>/member/pw/find_pw.kj" method = "post">
	<div class="container-800 container-center">
	<div class = "row center">
			<h3>비밀번호 찾기</h3>
	</div>
	<div class="row">
		<label>아이디</label>
		<input type="text" name="id" class="form-input">
	</div>
	<div class="row">
		<label>이메일</label>
		<input type="text" name="email" class="form-input">
	</div>
	<div class="row">
		<label>번호</label>	
		<input type="text" name="phone" class="form-input">
	</div>
	<div class="row">
		<input type="submit" value="찾기" class="form-btn">
	</div>	
	</div>

</form>

<%if(request.getParameter("error") != null){ %>
	<div class="row center">
		<h4 class="error">존재하지 않는 회원입니다.</h4>
	</div>
<%}%>	

<jsp:include page="/template/footer.jsp"></jsp:include>