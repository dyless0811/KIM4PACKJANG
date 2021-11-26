<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = (String) request.getSession().getAttribute("loginId");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
	
	String[] basketList = request.getParameterValues("basketNo");
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="<%=request.getContextPath()%>/product/buy.kj" method="post">

	<div class="row center" style= 'line-height:350%;'>
		<h2>주문서작성</h2>
		<div class="row">
			<h4>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다</h4>
		</div>
	</div>
	<div class="row" style= 'line-height:200%;'>
	국내상품 주문내역
	</div>

		<div>
			<div class="row">
			<input type="checkbox">
			<span>이미지</span>
			<span>상품정보</span>
			<span>판매가</span>
			<span>수량</span>
			<span>적립금</span>
			<span>배송구분</span>
			<span>배송비</span>
			<span>합계</span>
			<%for(String basketNo : basketList) {%>
				<input type="hidden" name="basketNo" value="<%=basketNo%>">
			<%}%>
		</div>

		<hr>
		<div class="row"; style= 'font-size:150%; line-height:250%;'>
		<strong>주문정보</strong>
		</div>

		<div class="row">
		 <div style='line-height:350%'>받으시는분*<input type="text" name="memberId" value="<%=memberDto.getId()%>" class="form-input"></div>
		 <div style='line-height:350%'>주소*<input type="text" value="<%=memberDto.getAddress()%>" class="form-input" ></div>
		 <div style='line-height:350%'>전화번호*<input type="tel" value="<%=memberDto.getPhone()%>" class="form-input"></div>
		 <div style='line-height:350%'>이메일*<input type="email" value="<%=memberDto.getEmail()%>" class="form-input"></div>
		</div>


		<div class="row">
		 <div>
		 	결제방식*
		 	<select name="type">
		 		<option value="1">무통장입금</option>
		 		<option value="2">신용카드</option>
		 	</select>
		 </div>
		</div>

		<hr>

		<div class="row" style='font-size:150%; line-height:300%;'>
		
		<strong>결제하는곳</strong>
		</div>
	</div>
	 <button>구매하기</button>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>