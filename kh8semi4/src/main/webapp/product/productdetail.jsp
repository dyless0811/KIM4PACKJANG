<%@page import="semi.beans.SizeDao"%>
<%@page import="semi.beans.SizeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
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
  productDao.readUp(no);
  %>
  <%
  //상품사이즈 가져오기
  int sizeno=Integer.parseInt(request.getParameter("no"));
  SizeDao sizeDao =new SizeDao();
  SizeDto sizeDto = sizeDao.get(sizeno);
  %>
 <%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
    <script>
    function calculate(){
            var price = document.querySelector("#size");
            var count = document.querySelector("#count");
            var result = document.querySelector("#result");
            if(count.value!="" && parseInt(count.value)>0){
             result.value = parseInt(price.value) * parseInt(count.value);
            }else{
                result.value=0;
            }
        }
    </script>

<body onload="calculate();">
    <h1>상품구매</h1>
    <div class="float-container list-card">
        <div class="float-item-left list-card-image">
            <img src="https://via.placeholder.com/400x350?text=ProductImage">
         </div>
    	<div class="float-item-left list-card-content">
        <h2> 상품명:<%=productDto.getName()%></h2><h5>조회수:<%=productDto.getViews()%></h5>
        <h4>소분류번호:<%=productDto.getSmallTypeNo()%>
            상품번호:<%=productDto.getNo()%>
        </h4>
        </div>
       <div>
  
        <select id="size" oninput="calculate();">
           <option value="<%=productDto.getPrice()%>"><%=sizeDao.get(sizeno)%></option> 
           <option value="<%=productDto.getPrice()%>"><%=sizeDao.get(sizeno)%></option>  
           <option value="<%=productDto.getPrice()%>"><%=sizeDao.get(sizeno)%></option>
        </select>
       </div>
       
        <h4> 가격:<%=productDto.getPrice()%>원</h4>
        <div>
        구매수량
        <input type="number"  value="1" id="count" oninput="calculate();" min="1">개
        </div>
        <div class="row">
          결제금액 
          <input type="number" placeholder=0 id="result" >원     
        <div>   
        <div class="row">
            <input type="button" value="구매하기" class="form-btn form-inline">
        </div>  

    </div>
    <div class="row center">
        <h2> 설명:<%=productDto.getDescription()%></h2>
     </div>
     </div>
     </div>
    

</body>

<jsp:include page="/template/footer.jsp"></jsp:include>