<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.ProductImageDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="semi.beans.ProductColorDao"%>
<%@page import="semi.beans.ProductSizeDao"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--입력 --%>
  <!-- 관리자 권한 가져오기  -->
  <%
  String grade=(String)session.getAttribute("grade");
  boolean admin = grade != null && grade.equals("관리자");
  %>

  <%--상품 번호 --%>
  <% int no =Integer.parseInt(request.getParameter("no")); %>
  <%--처리 --%>
  <%
  ProductDao productDao = new ProductDao();
  ProductDto productDto = productDao.get(no);
  %>
  
  <%
  //상품사이즈, 색상 가져오기
  ProductSizeDao productSizeDao =new ProductSizeDao();
  List<SizeDto> sizeList = productSizeDao.sizeListByProductNo(no);
  
  ProductColorDao productColorDao = new ProductColorDao();
  List<ColorDto> colorList = productColorDao.colorListByProductNo(no);
  
  //상품이미지 가져오기
  ProductImageDao productImageDao = new ProductImageDao();
  ProductImageDto productImageDto = productImageDao.get(no);
  %>
  
<%
String memberId = (String)session.getAttribute("loginId");
Set<Integer> productNo = (Set<Integer>)session.getAttribute("productNo");
if(productNo == null){
	productNo = new HashSet<>();
}
if(productNo.add(no)){//처음 읽은 글인 경우
	productDao.readUp(no,memberId);//조회수 증가
}
else{	
}
session.setAttribute("productNo", productNo);
productDto = productDao.get(no);
 %>

 <%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.float-container>.float-item-left:nth-child(1){
	width:30%;
	}
.float-container>.float-item-left:nth-child(2){
	width:70%;
}

</style>
<script>
$(function() {
	$(".delete").click(function(e) {	
		if (!confirm("정말 삭제하시겠습니까?")) {
			e.preventDefault();
		}
	});
	
	$(".edit").click(function(e) {	
		if (!confirm("수정페이지로이동할까요?")) {
			e.preventDefault();
		}
	});
	
	$("#add-cart").click(function(e) {
		if($("#selected-item").is(":empty")) {
			e.preventDefault();
			alert("상품을 선택해주세요");
			return;
		}

		if (!confirm("장바구니로 이동할까요?")) {
			$(this).val("shopping");
		}
	})
	
	$("#buy").click(function(e) {
		if($("#selected-item").is(":empty")) {
			e.preventDefault();
			alert("상품을 선택해주세요");
			return;
		}
	})
});
</script>
<script src="<%=request.getContextPath()%>/resource/js/productdetail.js" ></script>
    
<div class="flex-container ">
	<div class="flex-15 right">
        <!-- 이미지 출력 -->
		<%if(productImageDto != null) {%>
		<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=productDto.getNo()%>" width="320px" height="320px">
		<%} else {%>
		<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg" width="320px" height="320px">
		<%}%>
	</div>
   	<div class="flex-2 ">
		<%if(admin){ %>
		<a href="<%=request.getContextPath()%>/product/delete.kj?no=<%=no%>" class="delete">삭제</a>
		<a href="<%=request.getContextPath()%>/product/productedit.jsp?productno=<%=no%>&smalltypeno=<%=productDto.getSmallTypeNo()%>" class="edit">수정</a>
		<%} %>
		<h2>
			상품명:<span id="product-name"><%=productDto.getName()%></span>
			상품번호:<span id="product-no"><%=productDto.getNo()%></span>
		</h2>
		<h5>
			조회수:<%=productDto.getViews()%>
			</h5>
		<h4>상품가격:<span id="product-price"><%=productDto.getPrice()%></span></h4>

    	<div class="row">
    	    <select id="select-size" required>
    	    	<option value="" selected>---</option>
        		<%for(SizeDto sizeDto : sizeList) {%>
           		<option value="<%=sizeDto.getNo()%>"><%=sizeDto.getSizeName()%></option>
        		<%}%>
        	</select>
        
			<select id="select-color" required>
				<option value="" selected>---</option>
        		<%for(ColorDto colorDto : colorList) {%>
           		<option value="<%=colorDto.getNo()%>"><%=colorDto.getColorName()%></option>
        		<%}%>
        	</select>
			<button id="select-btn">선택</button>
        </div>

       	<div class="row">
	    	<h4> 가격:<span id="price"><%=productDto.getPrice()%></span>원</h4>
    	</div>

		<form action="<%=request.getContextPath()%>/myshop/order/addbasket.kj" method="post">
    	<div class="row">
    		<table style="width: 500px" class="table">
    			<thead>
    				<tr>
    					<th>상품</th>
    					<th>색상</th>
    					<th>사이즈</th>
    					<th>개수</th>
    					<th>가격</th>
    					<th>제거</th>
    				</tr>
            	</thead>
            	<tbody id="selected-item"></tbody>
        	</table>
    	</div>
    	<div class="row">
        	<input id="buy" type="submit" name="addType" value="Buy" class="form-btn form-inline">
        	<input id="add-cart" type="submit" name="addType" value="Add-Cart" class="form-btn form-inline" />
   			<a href="<%=request.getContextPath()%>/product/wishlistadd.kj?productNo=<%=productDto.getNo()%>">내찜콩</a>
		</div>
    	</form>
    	<div class="row">
    		총 상품 금액 : <span id="totalPrice">0</span>원
    	</div>
	</div>
</div>

	<div class="row center clear">
	<h2>설명:<%=productDto.getDescription()%></h2>
	<%if(productImageDto != null) {%>
	<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=productDto.getNo()%>">
	<%} else {%>
	<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg">
	<%}%>

	</div>
	<hr>
	<div class="row center">
	  <h1>리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다</h1>
	  <h1>리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다</h1>
	  <h1>리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다</h1>
	  <h1>리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다리뷰자리입니다</h1>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>