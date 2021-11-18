<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=request.getContextPath()%>/member/id/find_id.kj" method = "post">
	<div class="container-800 container-center">
	<div class = "row center">
			<h3>휴대폰 본인확인</h3>
	</div>
	<div class="row">
	<label>이름</label>
	<input type="text" name="name" class="form-input">
	</div>
	<div class="row">
	<label>번호</label>	
	<input type="text" name="phone" class="form-input">
	</div>
	
	<input type="submit" value="찾기" class="form-btn">
	
</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>