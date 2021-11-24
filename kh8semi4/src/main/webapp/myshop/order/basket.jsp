<%@page import="semi.beans.BasketVo"%>
<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BasketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>

<%
	String root = request.getContextPath();
%>

<%
	String id = (String)session.getAttribute("loginId");
%>    

<%
BasketDao basketDao = new BasketDao();
List<ProductDto> list = basketDao.BasketProductMember(id);
/* BuyDao buyDao = new BuyDao();
List<BuyDto> list2 = buyDao.BuyProductMember(id);
*/
List<BasketVo> list3 = basketDao.voListByMemberId(id); 
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<script>
$(function() {
	$(".confirm-link").click(function(e) {
		if (!confirm("정말 삭제하시겠습니까?")) {
			e.preventDefault();
		}
	});
});

//장바구니 전체 비우기


$(function(){
	$(".empty-btn").click(function(){
		$.ajax({
			url : "<%=root%>/member/ajax_basket_empty.kj",
			type : "get",
			data : {//전송 시 첨부할 파라미터 정보
				id : id;
				success : function(resp) {
					if (resp == "YESICAN") {//사용가능
					} else if (resp == "NONONO") {//사용불가능
						}
				},
				error : function(err) {//통신이 실패했다.
				}
			};
		});
	});
});
</script>
<script>
$(function(){
	$(".check-all").on("input",function(){
		var isChecked = $(this.).prop("checked");
		$("input[type=checkbox]").prop("checked",isChecked);
	});
});
</script>
	
	<form action="<%=request.getContextPath()%>/product/productbuy.jsp" method="get">
<div class="container-1200 container-center">
	<div class="row center">
		<h2>장바구니</h2>
	</div>
	<div class="row">
			<table class="table table-border">
			<thead>		
					<tr>
							<th>선택</th>  
							<th>이미지</th>
							<th>상품정보,깔라,싸이즈</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>선택</th>
							
					</tr>
			</thead>
			<tbody>
				
					<%for(BasketVo basketVo : list3){ %>
							<tr> 
									
									<td align="center">
									<input type="checkbox" name="basketNo" value="<%=basketVo.getBasketNo()%>">
									
									</td>
									<td align="center">
									<%if(basketVo.getProductFileSavename() != null) {%>
									<img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=basketVo.getProductNo()%>" width="150px" height="150px">
									<%} else {%>
									<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg" width="320px" height="320px">
									<%}%> 
									</td>
									<td align="center">
									<a href = "<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=basketVo.getProductNo()%>"><%=basketVo.getProductName()%></a>
									<%=basketVo.getColorName()%>
									<%=basketVo.getSizeName() %>
									</td>
									<td align="center"><%=basketVo.getPrice()%></td>
									<td align="center"><%=basketVo.getPrice() *0.0001 %>p</td>
									<td align="center">배송 전</td>
									<td align="center">3000원</td>
									<td align="center">
									<a href="<%=request.getContextPath()%>/product/productbuy.jsp?basketNo=<%=basketVo.getBasketNo()%>">구매하기</a>
									<a href = "<%=request.getContextPath()%>/myshop/order/deletebasket.kj?basketNo=<%=basketVo.getBasketNo()%>"   class = "confirm-link">삭제하기</a>
									</td>
								</tr>
					</tbody>
					<%} %>
							
							<input type="submit" value="선택 구매하기" class="form-btn form- inline">
							<label>
       					 			<input type="checkbox" class="check-all"> 
      							 	<span>전체 선택</span>
   						 </label>
		
	
	
	
	</table>
	
	</div>

</div>
	</form>
	<form action="<%=request.getContextPath()%>/product/productbuy.jsp" method="get">
		<%for(BasketVo basketVo : list3){ %>
			<input type="hidden" name="basketNo" value="<%=basketVo.getBasketNo()%>">
			
		<%} %>
			<input type="submit" value="전체구매하기" class="form-btn form- inline">
	</form>
	
	
	
	<a href = "<%=root%>/myshop/order/Iddeletebasket.kj?id=<%=id%>" class="confirm-link">장바구니 비우기</a>
	
	
<jsp:include page="/template/footer.jsp"></jsp:include>