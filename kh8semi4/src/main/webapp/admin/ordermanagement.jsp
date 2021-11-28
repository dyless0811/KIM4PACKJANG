<%@page import="java.util.List"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%
	String memberId = request.getParameter("memberId");	
%>
<%-- 처리 --%>
<%
	//주문서 목록을 가져오는 코드
	BuyDao buyDao = new BuyDao();
	List<BuyDto> buyList;
	if(memberId == null){
		buyList = buyDao.buyList();
	} else {
		buyList = buyDao.BuyProductMember(memberId);		
	}
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="center">
	<h1>주문서 관리 페이지</h1>
</div>
<div>
<h2>주문서 내역</h2>
<%if(!buyList.isEmpty()){ %>
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
		<%for(BuyDto buy : buyList){ %>
		<tr>
			<td class="buyno"><%=buy.getNo()%></td>
			<td><%=buy.getMemberId()%></td>
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
<<<<<<< HEAD

<h3><a href="customerlist.jsp">목록으로</a></h3>
=======
</div>
>>>>>>> refs/remotes/origin/main
<jsp:include page="/template/footer.jsp"></jsp:include>