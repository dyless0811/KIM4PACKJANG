<%@page import="java.text.Format"%>
<%@page import="java.text.DecimalFormat"%>
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
Format d = new DecimalFormat("#,##0");

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
	[class^='btnSubmit'], a[class^='btnSubmit'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid transparent;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #fff;
    background-color: #4a5164;
}
[class^='btnNormal'], a[class^='btnNormal'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid #d1d1d1;
    border-radius: 2px;
    font-family: "굴림",Gulim;
    font-size: 12px;
    line-height: 18px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    word-spacing: -0.5px;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #222;
    background-color: #fff;
}

</style>
<script>
//체크박스 전체선택
/*         window.addEventListener("load",function(){
           document.querySelector(".check-all").addEventListener("input",function(){
                //this == .check-all
                var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
                for(var i=0; i < checkboxList.length; i++){
                    checkboxList[i].checked = this.checked;
                }
        });
});	 */
        function checkToggle2(){
            var checkbox = document.querySelector(".check-all");
            var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");

            for(var i=0; i < checkboxList.length; i++){
                checkboxList[i].checked = checkbox.checked;
            }
        }
function check2(){
    var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
    var checkboxList2 = document.querySelectorAll("input[type=checkbox]:not(.check-all):checked");
    
    var checkbox = document.querySelector(".check-all");
    checkbox.checked = (checkboxList.length == checkboxList2.length);
}
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
	$(function(){
   	 	$(".total-btn").on("input",function(){
   	 		var total = 0;
   	 		$.each($(".total-btn:checked"), function(index, element){
   	 			var price = $(this).parent().parent().find(".number-input2 > span").text();
   	 			total += Number(price);
   	 		});
   	 		$("#Reserves").text(total);	
   	 		
   	 	});
	});
	$(function(){
   	 	$(".check-all").on("input",function(){
   	 		var total = 0;
   	 		$.each($(".total-btn:checked"), function(index, element){
   	 			var price = $(this).parent().parent().find(".number-input > span").text();
   	 			total += Number(price);
   	 		});
   	 		$("#total").text(total);	
	 		$("#total-price").text(total);	
   	 	});
	});
	$(function(){
   	 	$(".check-all").on("input",function(){
   	 		var total = 0;
   	 		$.each($(".total-btn:checked"), function(index, element){
   	 			var price = $(this).parent().parent().find(".number-input2 > span").text();
   	 			total += Number(price);
   	 		});
   	 		$("#Reserves").text(total);	
   	 	});
	});
   
	$(function(){
	$(".selected-buy").click(function(e) {
		var pChecked = false;
		$.each($(".total-btn:checked"), function(index, element){
			pChecked = true;
		}); 
		if(!pChecked) {
			alert("상품을 선택해주세요");
			e.preventDefault();
		}
	});
});
	
</script>
<form action="<%=root%>/product/productbuy.jsp" method="get">
<div class="container-1200 container-center">
	<div class="titleArea">
        <h2>장바구니</h2>
	</div>
	<br>
	<div class="row">
	<div class="row target2">
        <table class="table table-noborder table-hover reply-hide">
				<thead>
					<tr>
						<td>
							<input type="checkbox" class="check-all" oninput="checkToggle2();"> 
						</td>
						<td><span>이미지</span></td>
						<td><span>상품정보</span></td>
						<td><span>수량</span></td>
						<td><span>판매가</span></td>
						<td><span>적립금</span></td>
						<td><span>배송구분</span></td>
						<td><span>배송비</span></td>
						<td><span>합계</span></td>
						<td><span>선택</span></td>
					</tr>
					<tr>
						<td colspan="10">
							<hr>
						</td>
					</tr>
				</thead>
				<tbody>
				<%for(BasketVo basketVo : list){ %>
							<tr> 
									<td align="center">
										<input type="checkbox" name="basketNo" value="<%=basketVo.getBasketNo()%>" class="total-btn number-input" oninput="check2();">
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
										<%=d.format(basketVo.getPrice())%>원
									</td>
									<td align="center" class="number-input2">
										<span><%=d.format(basketVo.getReserves())%></span>P
									d
									</td>
									<td align="center">기본배송</td>
									<td align="center">무료배송</td>
									<td align="center" class="number-input">
										<span><%=d.format(basketVo.getTotalPrice())%></span>원
									</td>
									<td align="center">
										<a href="<%=root%>/product/productbuy.jsp?basketNo=<%=basketVo.getBasketNo()%>" class="btnSubmit">주문하기</a>
										<br>
										<a href="<%=root%>/myshop/order/deletebasket.kj?basketNo=<%=basketVo.getBasketNo()%>" class="btnNormal delete">삭제하기</a>
									</td>
						</tr>
				</tbody>
				<%} %>
		</table>
		</div>		
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
							무료배송
						</td>
						<td>
							<span id="Reserves">0</span>원
						</td>
						<td>
							<span id="total-price">0</span>원
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row right">
			<a href = "<%=root%>/myshop/order/Iddeletebasket.kj?id=<%=id%>" class="btnNormal all-delete ">장바구니 비우기</a>
		</div>
		<div class="row right">
			<a href ="<%=root%>/index.jsp"  class="btnNormal">쇼핑 계속하기</a>
		</div>
		
		
		<div class="row reply-button" style="width:50%">
				<button class="snap-sync-btn-submit selected-buy">선택상품 주문</button>
		</div>
</div>	
</form>
<form action="<%=root%>/product/productbuy.jsp" method="get">
		<%for(BasketVo basketVo : list){ %>
		<input type="hidden" name="basketNo" value="<%=basketVo.getBasketNo()%>">
		<%} %>
		<div class="row reply-button" style="width:50%">
			<button class="snap-sync-btn-submit">전체상품 주문</button>
		</div>
		
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>