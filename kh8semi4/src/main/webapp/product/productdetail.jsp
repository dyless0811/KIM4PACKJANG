<<<<<<< HEAD
<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
=======
<%@page import="javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardResizeToggleHandler"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
>>>>>>> refs/remotes/origin/main
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
  // productDao.readUp(no);
  %>
  
  <%
  //상품사이즈, 색상 가져오기
  SizeDao sizeDao =new SizeDao();
  List<SizeDto> sizeList = sizeDao.list();
  
  ColorDao colorDao = new ColorDao();
  List<ColorDto> colorList = colorDao.list();
  %>
  
<%
//1. boardViewedNo 라는 이름의 저장소를 세션에서 꺼내어 본다.
String memberId = (String)session.getAttribute("loginId");
Set<Integer> productNo = (Set<Integer>)session.getAttribute("productNo");

//2. boardViewedNo 가 null 이면 "처음 글을 읽는 상태"임을 말하므로 저장소를 신규로 생성
if(productNo == null){
	productNo = new HashSet<>();
	//System.out.println("처음으로 글을 읽기 시작했습니다(저장소 생성)");
}

//3. 현재 글 번호를 저장소에 추가해본다
//3-1. 추가가 된다면 이 글은 처음 읽는 글
//3-2. 추가가 안된다면 이 글은 두 번 이상 읽은 글
if(productNo.add(no)){//처음 읽은 글인 경우
	productDao.readUp(no,memberId);//조회수 증가(남에 글일때만)
	System.out.println("이 글은 처음 읽는 글입니다");
}
else{
	System.out.println("이 글은 읽은 적이 있습니다");
}

//System.out.println("저장소 : "+boardViewedNo);

//4. 저장소 갱신
session.setAttribute("productNo", productNo);

productDto = productDao.get(no);//단일조회

for(int i : productNo){
	System.out.println(i);
}
  %>
 <%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
    <script>

    function calculate(){
            var price = document.querySelector("#price");
            var count = document.querySelector("#count");
            var result = document.querySelector("#result");
            if(count.value!="" && parseInt(count.value)>0){
             result.value = parseInt(price.innerText) * parseInt(count.value);
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
  
        <select id="size">
<%--        <%for(SizeDto sizeDto : sizeList) {%>
           <option value="<%=sizeDto.getNo()%>"><%=sizeDao.get(sizeno)%></option> 
           <option value="<%=productDto.getPrice()%>"><%=sizeDao.get(sizeno)%></option>  
           <option value="<%=productDto.getPrice()%>"><%=sizeDao.get(sizeno)%></option>
        <%}%>  --%> 
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
        <div class="row">
            <input type="button" value="구매하기" class="form-btn form-inline">
        </div>  

			</div>
		</div>
		<div class="row center">
			<h2>
				설명:<%=productDto.getDescription()%></h2>
		</div>
	</div>


</body>

<jsp:include page="/template/footer.jsp"></jsp:include>