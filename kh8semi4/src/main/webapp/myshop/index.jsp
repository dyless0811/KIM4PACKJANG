<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-800 container-center">
		<div class="row">
					<a href="">주문내역 조회</a>
		</div>
		<div>
					<a href="<%=request.getContextPath() %>/member/modify.jsp">회원 정보</a>
		</div>
		<div>
					<a href="">관심 상품</a>
		</div>
		<div>
					<a href="">적립금</a>
		</div>
		<div>
					<a href="">게시물 관리</a>
		</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>