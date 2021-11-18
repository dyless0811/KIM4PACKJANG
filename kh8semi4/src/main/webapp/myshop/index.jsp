<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : id (session) --%>
<%
	String id = (String)session.getAttribute("loginId");
%>

<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(id);

	ProductDao productDao =new ProductDao();
	List<ProductDto> list = productDao.list();
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1000 container-center">
		<div class="row center">
			<h2>마이 쇼핑</h2>
			</div>		
		<div class="form-input left">
		<pre >
		저희 쇼핑몰을 이용해 주셔서 감사합니다.  
		<%=memberDto.getName() %>님은 <%=memberDto.getGrade() %>이십니다.
		</pre>
		</div>			
		<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>가용적립금</th>
					<th>총적립금</th>
					<th>사용적립금</th>
					<th>적립금내역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=memberDto.getPoint()%></td>
					<td><%=memberDto.getPoint()%></td>
					<td><%=memberDto.getPoint()%></td>
				</tr>
			</tbody>
		</table>
	</div>
	
		<div class="row">
					<a href="<%=request.getContextPath()%>/myshop/order/list.jsp?">주문내역 조회</a>
		</div>
		<div class="row">
					<a href="<%=request.getContextPath() %>/member/modify.jsp">회원 정보</a>
		</div>
		<div class="row">
					<a href="<%=request.getContextPath() %>/myshop/wish_list.jsp">관심상품</a>
		</div>
		<div class="row">
					<a href="<%=request.getContextPath() %>/myshop/board/myboard.jsp">게시물 관리</a>
		</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>