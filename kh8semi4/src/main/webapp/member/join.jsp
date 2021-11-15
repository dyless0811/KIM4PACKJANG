<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=request.getContextPath()%>/member/join.kj" method="post">

<div class="container-400 container-center">
			<div class="row">
				<label>아이디</label>
				<input type="text" name="id" required class="form-input" autocapitalize="off">
	</div>
	<div class="row">
				<label>비밀번호</label>
				<input type="password" name="pw" required class="form-input">
	</div>	
	<div class="row">
				<label>이름</label>
				<input type="text" name="name" required class="form-input">
	</div>
	<div class="row">
				<label>주소</label>
				<input type="text" name="address" required class="form-input">
	</div>	
	<div class="row">
				<label>휴대전화</label>
				<input type="tel" name="phone" required class="form-input">
	</div>
	<div class="row">
				<label>이메일</label>
				<input type="text" name="email" required class="form-input">
	</div>
	<div class="row">
				<label>생년월일</label>
				<input type="date" name="birth" required class="form-input">
	</div>
	<div class="row">
			<label>성별</label>
			<select name="gender">
					<option value="남" selected>남자</option>
					<option value="여" >여자</option>
			</select>	
	</div>			
	<div class="row">
			<input type="submit" value="가입" class="form-btn">
	</div>

</div>
		
</form>
	
<jsp:include page="/template/footer.jsp"></jsp:include>