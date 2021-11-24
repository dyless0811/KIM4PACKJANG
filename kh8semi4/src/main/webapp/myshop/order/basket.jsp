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
List<BasketVo> list = basketDao.voListByMemberId(id);
//시행착오
/*List<ProductDto> list = basketDao.BasketProductMember(id);
BuyDao buyDao = new BuyDao();
List<BuyDto> list2 = buyDao.BuyProductMember(id);
*/
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.form-btn {
  width: 20%;
  font-size: 15px;
  padding: 10px;
}
</style>
<script>
//체크박스 전체선택
        window.addEventListener("load",function(){
           document.querySelector(".check-all").addEventListener("input",function(){
                //this == .check-all
                var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
                for(var i=0; i < checkboxList.length; i++){
                    checkboxList[i].checked = this.checked;
                }
        });
});	
//상품 1개 삭제	
        window.addEventListener("load", function(){
         var confirmLinkList = document.querySelectorAll(".delete");
            for(var i=0; i < confirmLinkList.length; i++){
                confirmLinkList[i].addEventListener("click", function(e){
                    //this == 클릭한 .confirm-link
                    var choice = confirm("선택하신 상품을 삭제하시겠습니까?");
                    if(!choice){
                        e.preventDefault();
                  	 }
             });
       }
});
//장바구니 비우기
        window.addEventListener("load", function(){
            var confirmLinkList = document.querySelectorAll(".all-delete");
               for(var i=0; i < confirmLinkList.length; i++){
                   confirmLinkList[i].addEventListener("click", function(e){
                       //this == 클릭한 .confirm-link
                       var choice = confirm("장바구니를 비우시겠습니까?");
                       if(!choice){
                           e.preventDefault();
                     	 }
                });
          }
   });
       $(function(){
   	 		$(".total-btn").on("input",function(){
   	 			var total = 0;
   	 			$.each($(".total-btn:checked"), function(index, element){
   	 				var price = $(this).parent().parent().find(".number-input > span").text();
   	 				total += Number(price);
   	 			});
   	 		$("#total").text(total);	
   	 		$("#total-price").text(total);	
   	 	});
});    
       
</script>
<form action="<%=root%>/product/productbuy.jsp" method="get">
<div class="container-1200 container-center">
	<div class="row center">
		<h2>장바구니</h2>
	</div>
	<div class="row">
			<table class="table table-border">
			<thead align="center">		
					<tr>
							<th>
								<label>
       					 			<input type="checkbox" class="check-all"> 
      							</label>
   						 	</th>  
								<th>이미지</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>판매가</th>
								<th>적립금</th>
								<th>배송구분</th>
								<th>배송비</th>
								<th>합계</th>
								<th>선택</th>
							</tr>
						
			</thead>
			<tbody>
				<%for(BasketVo basketVo : list){ %>
							<tr> 
									<td align="center">
										<input type="checkbox" name="basketNo" value="<%=basketVo.getBasketNo()%>" class="total-btn number-input">
									</td>
									<%--이미지 시작--%>
									<td align="center">
										<%if(basketVo.getProductFileSavename() != null) {%>
										<img src="<%=root%>/product/productImage.kj?no=<%=basketVo.getProductNo()%>" width="100px" height="100px">
										<%} else {%>
										<img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg" width="320px" height="320px">
										<%}%> 
									</td>
									<%--이미지 끝--%>
									<td align="center">
										<a href = "<%=root%>/product/productdetail.jsp?no=<%=basketVo.getProductNo()%>"><%=basketVo.getProductName()%></a>
										<hr>
										[옵션 : 
										<%=basketVo.getColorName()%> /
										<%=basketVo.getSizeName() %>]
									</td>
									<td align="center">
										<%=basketVo.getCount()%>개
									</td>
									<td align="center">
										<%=basketVo.getPrice()%>원
									</td>
									<td align="center"><%=basketVo.getReserves()%>P</td>
									<td align="center">기본배송</td>
									<td align="center">0원</td>
									<td align="center" class="number-input">
										<span><%=basketVo.getTotalPrice()%></span>원
									</td>
									<td align="center">
										<a href="<%=root%>/product/productbuy.jsp?basketNo=<%=basketVo.getBasketNo()%>">주문하기</a>
										<br>
										<a href="<%=root%>/myshop/order/deletebasket.kj?basketNo=<%=basketVo.getBasketNo()%>" class="delete">삭제하기</a>
									</td>
						</tr>
				</tbody>
				<%} %>
			</table>
			<table class="table table-border">
				<thead align="center">	
					<tr>
						<th>총 상품금액</th>
						<th>총 배송비</th>
						<th>총 적립금</th>
						<th>결제예정금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div>
        						<span id="total">0</span>원
  							</div>
  						</td>
						<td>
							0원
						</td>
						<td>
							3000원
						</td>
						<td>
							<span id="total-price">0</span>원
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row right">
			<a href = "<%=root%>/myshop/order/Iddeletebasket.kj?id=<%=id%>" class="all-delete">장바구니 비우기</a>
		</div>
		<div class="row right">
			<a href ="<%=root%>/index.jsp" >쇼핑 계속하기</a>
		</div>
		<div class="row right">
				<input type="submit" value="선택상품주문" class="form-btn form- inline">
		</div>
</div>
</form>
<div class="container-1200 container-center">
<form action="<%=root%>/product/productbuy.jsp" method="get">
		<%for(BasketVo basketVo : list){ %>
		<input type="hidden" name="basketNo" value="<%=basketVo.getBasketNo()%>">
		<%} %>
		<div class="row right">
			<input type="submit" value="전체상품주문" class="form-btn form- inline">
		</div>
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>