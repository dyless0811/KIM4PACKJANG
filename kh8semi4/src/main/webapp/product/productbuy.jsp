<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.vo.BuyProductVo"%>
<%@page import="java.util.Arrays"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = (String) request.getSession().getAttribute("loginId");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
	
	String[] basketList = request.getParameterValues("basketNo");
	
	//장바구니 페이지에서 넘어온 basketNo를 이용해 상품 정보 조회하는 코드
	ProductDao productDao = new ProductDao();
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="<%=request.getContextPath()%>/product/buy.kj" method="post">

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
			<%for(String basketNo : basketList) {%>
				<input type="hidden" name="basketNo" value="<%=basketNo%>">
			<%}%>
		</div>
		<div>
			<table>
				<tbody>
			<%for(int i = 0; i < basketList.length; i++){ %>
				<tr>
					<td><input type="hidden" name="basketNo" value=<%=basketList[i]%>></td>
					<%BuyProductVo buyProduct = productDao.productInfo(memberId, Integer.parseInt(basketList[i])); %>
					<td><img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=buyProduct.getProductNo()%>" width="100px" height="100px"></td>
					<td><%=buyProduct.getPrice()%></td>
					<td><%=buyProduct.getCount()%></td>
					<td><%=buyProduct.getSaveMoney()%></td>
					<td>기본배송</td>
					<td>무료배송</td>
					<td><%=buyProduct.getTotalPrice()%></td>
				</tr>
			<%} %>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row">
		주문정보
		</div>

		<div class="row">
		 <div>받으시는분*<input type="text" name="memberId" value="<%=memberDto.getId()%>"></div>
		 <div>주소*<input type="text" value="<%=memberDto.getAddress()%>" ></div>
		 <div>전화번호*<input type="tel" value="<%=memberDto.getPhone()%>"></div>
		 <div>이메일*<input type="email" value="<%=memberDto.getEmail()%>"></div>
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

		<div class="row">
		
		결제하는곳
		</div>
	</div>
	 <button>구매하기</button>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>