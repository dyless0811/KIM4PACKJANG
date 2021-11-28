<%@page import="semi.beans.BoardTypeDao"%>
<%@page import="semi.beans.BoardTypeDto"%>
<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardPagenation"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--입력--%>

<%--처리--%>
<%
//주문서 목록을 가져오는 코드
BuyDao buyDao =new BuyDao();
List<BuyDto> list=buyDao.todayBuyList();
%>

<%--출력--%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="center">
	<h1>전일 주문내역</h1>
</div>
<div>
<%if(!list.isEmpty()){ %>
<table class="table-border table">
	<thead>
		<tr>
			<th>구매번호</th>
			<th>구매자</th>
			<th>상품번호</th>
			<th>사이즈번호</th>
			<th>색상번호</th>
			<th>개수</th>
			<th>결제방식</th>
			<th>구매날짜</th>
			<th>현재상태</th>
			<th>상태변경</th>
		</tr>
	</thead>
	<tbody>
		<%for(BuyDto buy : list){ %>
		<tr>
			<td class="buyno"><%=buy.getNo()%></td>
			<td><a href="<%=request.getContextPath()%>/admin/ordermanagement.jsp?memberId=<%=buy.getMemberId()%>"><%=buy.getMemberId()%></a></td>
			<td><%=buy.getProductNo()%></td>
			<td><%=buy.getSizeNo()%></td>
			<td><%=buy.getColorNo()%></td>
			<td><%=buy.getCount()%></td>
			<td><%=buy.getType()%></td>
			<td><%=buy.getBuyDate()%></td>
			<td><%=buy.getStatus()%></td>
			<td>
				<form action="statuschange.kj" method="post">
					<input type="hidden" name="buyNo" value="<%=buy.getNo()%>">
					<input type="submit" value="변경">
				</form>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>
<%} else { %>
<h2>주문 내역이 없습니다.</h2>
<%} %>
</div>

<!-- 페이지네이션자리 -->


<jsp:include page="/template/footer.jsp"></jsp:include>