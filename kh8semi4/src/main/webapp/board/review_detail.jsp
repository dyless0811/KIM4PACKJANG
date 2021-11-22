<%@page import="java.util.List"%>
<%@page import="semi.beans.ReplyDao"%>
<%@page import="semi.beans.ReplyListVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- productname>productdto>productdao>product get 메소드를 써야함. 
	쓸라면 productNo가 있어야되는데, 리뷰에 해당하는 productNO 이게 replyDto에 있다.>replyDao>get replyNo를 써야되는데 no가 파라미터로온다.  -->

<!-- 출력 -->
<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="container-1000 container-center">
		<div class="row center">
			<h2>상품이름</h2>
			<hr>
		</div>
		<div class= "row right">
			<h3>작성자/멤버아이디</h3>
		</div>
	</div>



<jsp:include page="/template/footer.jsp"></jsp:include>