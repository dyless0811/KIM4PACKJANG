<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@page import="semi.beans.ReplyVo"%>
<%@page import="semi.beans.ReplyDao"%>
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
  ReplyDao replyDao = new ReplyDao();
  List<ReplyVo> replyVoList = replyDao.replyListbyProductNo(no);
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
a{
text-decoration: none;
}

.font-size{
font-family:sans-serif;
font-size: 18px;
}

/* 테스트용 레이아웃 */
/* div{ */
/* border: 1px dotted black; */
/* } */



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
<script>
$(function() {
	$(".reply-tr").on("click", function() {
		$(this).next().children().children().toggle();
	})
});

$(function() {
	$("#wishlist").click(function(){
		location.href='<%=request.getContextPath()%>/product/wishlistadd.kj?productNo=<%=productDto.getNo()%>';
		});
});




</script>
<script src="<%=request.getContextPath()%>/resource/js/productdetail.js" ></script>

		<div class="flex-container">
		 <div class="flex-1 right">
     		<!-- 이미지 출력 -->
		<%if(productImageDto != null) {%>
		<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=productDto.getNo()%>" width="320px" height="320px">
		<%} else {%>
		<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg" width="320px" height="320px">
		<%}%>
		 </div>
		<!-- 관리자만 수정 삭제가능 -->
		<div class="flex-2">
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
			
			<select id="select-size" required>
				<option value="" selected>---</option>
				<%for(SizeDto sizeDto : sizeList) {%>
				<option value="<%=sizeDto.getNo()%>"><%=sizeDto.getSizeName()%></option>
				<%}%>
			</select> <select id="select-color" required>
				<option value="" selected>---</option>
				<%for(ColorDto colorDto : colorList) {%>
				<option value="<%=colorDto.getNo()%>"><%=colorDto.getColorName()%></option>
				<%}%>
			</select>
			<button id="select-btn">선택</button>
<%-- 		<%if(sizeList !=null && colorList !=null ){ %> --%>
		<form action="<%=request.getContextPath()%>/myshop/order/addbasket.kj" method="post">
    	<div class="row">
    		<table style="width: 700px" class="table">
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
<%--     	<%} %> --%>
    
    	<div class="row">
        	<input id="buy" type="submit" name="addType" value="Buy" class="form-btn form-inline">
        	<input id="add-cart" type="submit" name="addType" value="Add-Cart" class="form-btn form-inline" />
			<button id="wishlist" type="button" class="form-btn form-inline" onclick="<%=request.getContextPath()%>/product/wishlistadd.kj?productNo=<%=productDto.getNo()%>">WishList</button >
		</div>
		
    	</form>
    	<div class="row">
    		<h2>총 상품 금액 : <span id="totalPrice">0</span>원</h2>
    	</div>
	</div>
		
		</div>	 
      
	<hr>

	<div class="row center">
	<h2>설명:<%=productDto.getDescription()%></h2>
	<%if(productImageDto != null) {%>
	<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=productDto.getNo()%>">
	<%} else {%>
	<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg">
	<%}%>

	</div>
    <!-- 리뷰자리  -->
	<hr>
	<div class="row center">
<!-- 	  <table style="width:1400px;margin:auto"> -->
	   <table class="container-1400 table table-border table-hover"  border="1">
	  	<colgroup>
	  		<col width="10%">
	  		<col width="50%">
	  		<col width="20%">
	  		<col width="20%">		
	  	</colgroup>
	  	<thead>
	  		<tr>
	  			<th>번호</th>
	  			<th>리뷰</th>
	  			<th>작성자</th>
	  			<th>평점</th>
	  		</tr>
	  	</thead>
	  	<tbody>
	  		<%for(ReplyVo replyVo : replyVoList) {%>
	  		<tr class="reply-tr">
	  			<td>
	  				<%=replyVo.getNo()%>
	  			</td>
	  			<td>
	  				<pre><%=replyVo.getContent()%></pre>
	  			</td>	  		
	  			<td>
	  				<%=replyVo.getMemberId()%>
				</td>
	  			<td>
	  				<%int starpoint = replyVo.getStarpoint();
	  				  for(int i=0; i<starpoint; i++) {%>
	  				&#9733;
	  				<%}%>
	  			</td>
	  		</tr>
			<tr>
				<td colspan="4">
					<div class="row float-container" style="display: none">
						<div class="float-item-left" style="width: 50%">
							<%if (replyVo.getReplySavename() != null) {%>
							<div class="row">
								<img src="<%=request.getContextPath()%>/board/replyImage.kj?no=<%=replyVo.getNo()%>">
							</div>
							<% } else {%>
							<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg"
								style="width: 30%">
							<%}	%>
						</div>

						<div class="float-item-right" style="width: 50%">
							<div class="row left">
								<span>색상:</span>
								<%=replyVo.getColorName()%>
							</div>
							<div class="row left">
								<span>사이즈:</span>
								<%=replyVo.getSizeName()%>
							</div>
							<div class="row left">
								<pre><%=replyVo.getContent()%></pre>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<%}%>
	  	</tbody>
	  </table>
	</div>
	



<hr>




<jsp:include page="/template/footer.jsp"></jsp:include>