<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=request.getContextPath()%>/member/login.kj" method="post">
	
<div class="container-400 container-center">
	<div class="row center">
					<h1>회원 로그인</h1>
	</div>
	<div class="row">
				<label>아이디</label>
				<input type="text" name="id" required class="form-input" autocapitalize="off">
	</div>
	<div class="row">
				<label>비밀번호</label>
				<input type="password" name="pw" required class="form-input">
	</div>
	<div class="row">
				<input type="submit" value="로그인" class="form-btn form-inline">
	</div>		
		
	<%if(request.getParameter("error") != null){ %>
	<div class="row center">
		<h4 class="error">로그인 정보가 일치하지 않습니다</h4>
	</div>
	<%}%>	
		
</div>	

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>