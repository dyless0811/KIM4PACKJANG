<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h1>마이페이지</h1>

<a href="<%=request.getContextPath() %>/order/list.jsp">주문내역 조회</a>
<br>
<a href="<%=request.getContextPath() %>/member/modify.jsp">회원 정보</a>
<br>
<a href="<%=request.getContextPath() %>/myshop/wish_list.jsp">관심 상품</a>
<br>
<a href="">적립금</a>
<br>
<a href="">게시물 관리</a>



<jsp:include page="/template/footer.jsp"></jsp:include>