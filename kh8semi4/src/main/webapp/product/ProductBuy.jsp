<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--입력 --%>
 <%--처리 --%>
 <%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="./buy.kj" method="post">
	
	<div class="row center">
		<h2>주문서작성</h2>
		<div class="row">
			<h4>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다</h4>
		</div>
	</div>
	<div class="row">
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
		
		</div>
		
		<hr>
		<div class="row">
		주문정보
		</div>
		
		<div class="row">
		 <div>주문하시는분*<input type="text" name="memberId" ></div>
		 <div>주소*<input type="text"  ></div>
		 <div>전화번호*<input type="tel"></div>
		 <div>이메일*<input type="email"></div>
		</div>
		
		<hr>
		<div class="row">
		배송정보
		</div>
		
		<div class="row">
		 <div>받으시는분*<input type="text" ></div>
		 <div>주소*<input type="text" ></div>
		 <div>전화번호*<input type="tel"></div>
		 <div>이메일*<input type="email"></div>
		 <div>배송메세지
		 <textarea rows="5" cols="50"></textarea></div>
		</div>
		
		<hr>
		
		<div class="row">
		결제하는곳
		</div>
	</div>
	 <button>구매하기</button>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>