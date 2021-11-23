<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ReplyDao"%>
<%@page import="semi.beans.ReplyListVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- productname>productdto>productdao>product get 메소드를 써야함. 
	쓸라면 productNo가 있어야되는데, 리뷰에 해당하는 productNO 이게 replyDto에 있다.>replyDao>get replyNo를 써야되는데 no가 파라미터로온다.  -->

<!-- 처리 review, product 있는거 쓸 수 있음. -->
<%
	ReplyDao replyDao = new ReplyDao();
	int replyNo = Integer.parseInt(request.getParameter("no"));
	
	ReplyDto replyDto = replyDao.get(replyNo);
	
	ProductDao productDao = new ProductDao();
	
	ProductDto productDto = productDao.get(replyDto.getProductNo());
	
%>

<!-- 출력 -->
<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="container-1000 container-center">
		<div class="row center">
			<h2><%=productDto.getName()%></h2>
			<hr>
		</div>
		<div class= "row right">
			<h3><%=replyDto.getMemberId()%></h3>
			<br>
		</div>
		
		<!-- 반반으로 보이게 -->
		<div class="row">
			<div class="row float-container">
				<div class="float-item-left" style="width : 50%">
					<img src="https://i.pinimg.com/originals/33/8f/92/338f92828ddcc3ff6b78a4847ded8b2e.jpg" style="width: 500px"  >
				</div>
				
				<div class="float-item-right" style="width : 50%">
					<%=replyDto.getContent()%>
				</div>
				
			</div>
		</div>
	</div>



<jsp:include page="/template/footer.jsp"></jsp:include>