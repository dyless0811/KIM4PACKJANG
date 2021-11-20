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

    
<script type="text/javascript">
	$(function(){
		$(".size-btn").click(function (e) {
        	e.preventDefault();
        	var template = $("#size-content-template").html();
        	$(".size-contents").append(template);
        	
    	  	$(".del-btn").click(function (e) {
    	  		e.preventDefault();
    	  		$(this).parent().remove();
    	  	}); 
    	});
		
		$("#count").on("input", function () {
			var price = $("#price").get();
	        var count = $("#count").get();
	        var result = $("#result").get();
	        for(i = 0;)
	        if(count.value!="" && parseInt(count.value)>0){
	        	result.value = parseInt(price.innerText) * parseInt(count.value);
	        }else{
	            result.value=0;
	        }
		});

	})
</script>
    

    <h1>상품구매</h1>
    <div class="float-container list-card">
        <div class="float-item-left list-card-image">
            <img src="https://via.placeholder.com/400x350?text=ProductImage">
         </div>
    	<div class="float-item-left list-card-content">
    	<a href="<%=request.getContextPath()%>/product/delete.kj?no=<%=no%>">삭제</a>
    	<a href="<%=request.getContextPath()%>/product/productedit.jsp?productno=<%=no%>&smalltypeno=<%=productDto.getSmallTypeNo()%>">수정</a>
        <h2> 상품명:<%=productDto.getName()%></h2><h5>조회수:<%=productDto.getViews()%></h5>
        <h4>소분류번호:<%=productDto.getSmallTypeNo()%>
            상품번호:<%=productDto.getNo()%>
        </h4>
        </div>
       <div>
  
        <select id="size">
        <%for(SizeDto sizeDto : sizeList) {%>
           <option value="<%=sizeDto.getNo()%>"><%=sizeDto.getSizeName()%></option>
        <%}%>
        </select>
        
		<select id="size">
        <%for(ColorDto colorDto : colorList) {%>
           <option value="<%=colorDto.getNo()%>"><%=colorDto.getColorName()%></option>
        <%}%>
        </select>
       </div>
       
       
        <h4> 가격:<span id="price"><%=productDto.getPrice()%></span>원</h4>
        <div>
        구매수량
        <input type="number"  value="1" id="count" oninput="calculate();" min="1">개
        </div>
        <div class="row">
          결제금액
          <input type="number" placeholder=0 id="result" >원     
        <div>  

        <form action="<%=request.getContextPath()%>/myshop/order/addbasket.kj" method="post">
        <div class="row order-content">
            <input type="submit" name="addType" value="Buy" class="form-btn form-inline">
            <input type="submit" name="addType" value="Add-Cart" class="form-btn form-inline" />
            <span form-index="1">
            	<input type="hidden" name="price" value="<%=productDto.getPrice()%>">
            	<input type="number" name="count" value="1">
            	
            	<%--만들어야됨
            		
            	색상 사이즈를 고르면 인풋타입 히든으로 여기에 넘겨줌
            		jquery로 가격 계산해서 보여줌
            		
            		addType이 buy면 addbasket 서블릿에서 해당 basket no들을 가지고 구매 서블릿으로 forward
            		addType이 Add-Cart면 addbasket 서블릿에서 장바구니 페이지로 redirect
            	 --%>
            </span>
        </div>  
		</form>
			</div>
		</div>
		<div class="row center">
			<h2>
				설명:<%=productDto.getDescription()%></h2>
		</div>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>