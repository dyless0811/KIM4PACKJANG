<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
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
	
	//토탈 금액을 구하기 위한 변수
	int totalSaveMoney = 0;
	int totalPriceMoney = 0;
	
	//숫자에 콤마를 찍어줄 DateFormat
	Format d = new DecimalFormat("#,##0");
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=request.getContextPath()%>/product/buy.kj" method="post">
<div class="container-1400 container-center">
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
			<table class="table table-noborder">
				<thead>
					<tr>
						<td><span>상품정보</span></td>
						<td><span>수량</span></td>
						<td><span>가격</span></td>
						<td><span>적립금</span></td>
						<td><span>배송구분</span></td>
						<td><span>배송비</span></td>
						<td><span>결제액</span></td>
					</tr>
					<tr>
						<td colspan="8">
							<hr>
						</td>
					</tr>
				</thead>
				<tbody>
					<%for(int i = 0; i < basketList.length; i++){ %>
					<tr>
						<%BuyProductVo buyProduct = productDao.productInfo(memberId, Integer.parseInt(basketList[i]));%>
						<%
						totalSaveMoney += buyProduct.getSaveMoney();
						totalPriceMoney += buyProduct.getPrice();
						%>
						<td align="center">
							<input type="hidden" name="basketNo" value=<%=basketList[i]%>>
							<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=buyProduct.getProductNo()%>" width="100px" height="100px">
							<br>
							<a href = "<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=buyProduct.getProductNo()%>"><%=buyProduct.getProductName()%></a>
							<br>
							[옵션 : 
							<%=buyProduct.getColorName()%> /
							<%=buyProduct.getSizeName() %>]
						</td>
						<td><span><%=d.format(buyProduct.getCount())%>개</span></td>
						<td><span><%=d.format(buyProduct.getPrice())%>원</span></td>
						<td><span><%=d.format(buyProduct.getSaveMoney())%>P</span></td>
						<td>기본배송</td>
						<td>무료배송</td>
						<td><span><%=d.format(buyProduct.getTotalPrice())%>원</span></td>
					</tr>
					<tr height="20px">
						<td colspan="8">
							<hr>
						</td>
					</tr>
					<%}%>
					<tr>
						<td colspan="4"><span>총 적립금 : <%=d.format(totalSaveMoney)%>원</span></td>
						<td colspan="4"><span>총 결제금액 : <%=d.format(totalPriceMoney)%>원</span></td>
					</tr>
				</tbody>
			</table>
		</div>
	<hr>
	<div class="row">
		<span>주문정보</span>
	</div>
	<div class="row">
		<table class="table table-boder">
			<tbody>
				<tr>
					<td style="width:15%"><span>주문인*</span></td>
					<td style="text-align:left"><input type="text" value="<%=memberDto.getId()%>"></td>
				</tr>
				<tr>
					<td style="width:15%"><span>받을주소*</span></td>
					<td style="text-align:left"><input type="text" value="<%=memberDto.getAddress()%>" width="300px"></td>
				</tr>
				<tr>
					<td style="width:15%"><span>전화번호*</span></td>
					<td style="text-align:left"><input type="text" value="<%=memberDto.getPhone()%>"></td>
				</tr>
				<tr>
					<td style="width:15%"><span>이메일*</span></td>
					<td style="text-align:left"><input type="text" value="<%=memberDto.getEmail()%>"></td>
				</tr>
				<tr>
					<td><span>결제방식*</span></td>
					<td style="text-align:left">
						<input type="radio"  name="type" value="1" required>무통장입금
						<input type="radio"  name="type" value="2" required>신용카드
					</td>
				</tr>
			</tbody>
		</table>
<%-- 		 <div>받으시는분*<input type="text" name="memberId" value="<%=memberDto.getId()%>"></div> --%>
<%-- 		 <div>주소*<input type="text" value="<%=memberDto.getAddress()%>" ></div> --%>
<%-- 		 <div>전화번호*<input type="tel" value="<%=memberDto.getPhone()%>"></div> --%>
<%-- 		 <div>이메일*<input type="email" value="<%=memberDto.getEmail()%>"></div> --%>
	</div>
	<hr>
	<div class="row">
		<input type="submit" class="form-btn" value="구매하기">
	</div>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>