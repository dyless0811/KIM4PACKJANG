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
  //조회수증가
  // productDao.readUp(no);
  %>
  
  <%
  //상품사이즈, 색상 가져오기
  ProductSizeDao productSizeDao =new ProductSizeDao();
  List<SizeDto> sizeList = productSizeDao.sizeListByProductNo(no);
  
  ProductColorDao productColorDao = new ProductColorDao();
  List<ColorDto> colorList = productColorDao.colorListByProductNo(no);
  %>
  
<%
//1. productNo 라는 이름의 저장소를 세션에서 꺼내어 본다.
String memberId = (String)session.getAttribute("loginId");
Set<Integer> productNo = (Set<Integer>)session.getAttribute("productNo");

//2. productNo 가 null 이면 "처음 글을 읽는 상태"임을 말하므로 저장소를 신규로 생성
if(productNo == null){
	productNo = new HashSet<>();
	//System.out.println("처음으로 글을 읽기 시작했습니다(저장소 생성)");
}

//3. 현재 글 번호를 저장소에 추가해본다
//3-1. 추가가 된다면 이 글은 처음 읽는 글
//3-2. 추가가 안된다면 이 글은 두 번 이상 읽은 글
if(productNo.add(no)){//처음 읽은 글인 경우
	productDao.readUp(no,memberId);//조회수 증가
	//System.out.println("이 글은 처음 읽는 글입니다");
}
else{
	//System.out.println("이 글은 읽은 적이 있습니다");
}

//4. 저장소 갱신
session.setAttribute("productNo", productNo);

productDto = productDao.get(no);//단일조회

// for(int i : productNo){
// 	System.out.println(i);
// }
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
          
    <div class="row">
	    <h4> 가격:<span id="price"><%=productDto.getPrice()%></span>원</h4>
    </div>

<%--    <form action="<%=request.getContextPath()%>/myshop/order/addbasket.kj" method="post"> --%>
    <form action="#" method="get">
        <div class="row">
        	<table style="width:500px" class="table order-content">
        		<thead>
        			<tr>
        				<th>상품</th>
        				<th>색상</th>
        				<th>사이즈</th>
        				<th>개수</th>
        				<th>가격</th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td data-product-index="1">
        					<%=productDto.getName()%>
        					<input type="hidden" name="productNo" value="<%=productDto.getNo()%>">
        				</td>
        				<td>
        					베이지
        					<input type="hidden" name="color" value="22">
        				</td>
        				<td>
        					M
        					<input type="hidden" name="size" value="102">
        				</td>
        				<td>
        					<input type="number" name="count" value="2">
        				</td>
        				<td>
        					<span>200000</span>
        					<input type="hidden" name="price" value="<%=productDto.getPrice()%>">
        				</td>
        			</tr>
        			<tr data-product-index="2">
        				<td>
        					<%=productDto.getName()%>
        					<input type="hidden" name="productNo" value="<%=productDto.getNo()%>">
        				</td>
        				<td>
        					레드
        					<input type="hidden" name="color" value="24">
        				</td>
        				<td>
        					S
        					<input type="hidden" name="size" value="1">
        				</td>
        				<td>
        					<input type="number" name="count" value="1">
        				</td>
        				<td>
        					<span>100000</span>
        					<input type="hidden" name="price" value="<%=productDto.getPrice()%>">
        				</td>
        			</tr>
        			
        		</tbody>
        	</table>
            	<%--만들어야됨
            	색상 사이즈를 고르면 인풋타입 히든으로 여기에 넘겨줌
            		jquery로 가격 계산해서 보여줌
            		
            		addType이 buy면 addbasket 서블릿에서 해당 basket no들을 가지고 구매 서블릿으로 forward
            		addType이 Add-Cart면 addbasket 서블릿에서 장바구니 페이지로 redirect
            	 --%>
        </div> 
        <div class="row">
        	<h5>총 상품금액 = 300000</h5>
        </div>
        <div class="row">
            <input type="submit" name="addType" value="Buy" class="form-btn form-inline">
            <input type="submit" name="addType" value="Add-Cart" class="form-btn form-inline" />
		</div>
	</form>
	</div>
	<div class="row center">
		<h2>
			설명:<%=productDto.getDescription()%></h2>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>