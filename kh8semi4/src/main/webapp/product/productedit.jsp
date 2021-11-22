<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductImageDto"%>
<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="semi.beans.BigTypeDto"%>
<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SizeDao sizeDao = new SizeDao();
List<SizeDto> sizeList = sizeDao.list();
ColorDao colorDao = new ColorDao();
List<ColorDto> colorList = colorDao.list();
%>
<%
SmallTypeDao smallTypeDao = new SmallTypeDao();
int bigTypeNo = smallTypeDao.searchBigTypeNo(Integer.parseInt(request.getParameter("smalltypeno")));
List<SmallTypeDto> list = smallTypeDao.searchSmallType(bigTypeNo);
ProductDao productDao =new ProductDao();
ProductDto productDto =productDao.get(Integer.parseInt(request.getParameter("productno")));
%>
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
		
		$(".color-btn").click(function (e) {
        	e.preventDefault();
        	var template = $("#color-content-template").html();
        	$(".color-contents").append(template);
        	
    	  	$(".del-btn").click(function (e) {
    	  		e.preventDefault();
    	    	$(this).parent().remove();
    	  	}); 
    	});

	})
</script>
<form action="./productedit.kj" method=post enctype="multipart/form-data">
<input type="hidden" name="productNo" value="<%=productDto.getNo()%>">
    <template id="size-content-template">
        <div class="row">
        	<select name="size">
        	<%for(SizeDto sizeDto : sizeList) {%>
           		<option value="<%=sizeDto.getNo()%>"><%=sizeDto.getSizeName()%></option>
        	<%}%>
        	</select>
        	<button class="del-btn">삭제</button>
        </div>
    </template>
    <template id="color-content-template">
    	<div class="row">
			<select name="color">
        	<%for(ColorDto colorDto : colorList) {%>
           		<option value="<%=colorDto.getNo()%>"><%=colorDto.getColorName()%></option>
        	<%}%>
        	</select>
        	<button class="del-btn">삭제</button>
        </div>
    </template>
	
	<div>
		<h1>상품수정페이지 페이지</h1>
	</div>
	<div  class="row">	 
	
	 <select name="smallTypeNo" class="form-input form-inline">
	 <%for(SmallTypeDto smallTypeDto : list){ %>
		<%if(smallTypeDto.getNo()==Integer.parseInt(request.getParameter("smalltypeno"))){ %>	 
	 	<option selected value=<%=smallTypeDto.getNo()%>><%=smallTypeDto.getName()%></option>
	 	<%}else{ %>
	 	<option value=<%=smallTypeDto.getNo()%>><%=smallTypeDto.getName()%></option>
	    <%} %>
	 <%} %>
	 </select>

	</div>
	<div class="row">
	 상품명 <input type="text"  name="name" value=<%=productDto.getName()%> required class=form-input>
	</div>

	<div  class="row">
	 가격 <input type="number" name="price" value=<%=productDto.getPrice()%>  required class=form-input>
	</div>
	
	<div class="row">
		<div class="flex-container">
			<div class="flex-gro center">
   				<button style="width:30%" class="size-btn form-btn">사이즈 추가</button>
   				<div class="size-contents"></div>
			</div>
			<div class="flex-gro center">
				<button style="width:30%" class="color-btn form-btn">색상 추가</button>
				<div class="color-contents"></div>
			</div>
		</div>
	</div>
	
	<div  class="row">
	상품설명
	<textarea rows="40" cols="100"  name="description" class=form-input><%=productDto.getDescription()%></textarea>
	</div>
	<%	
		ProductImageDao productImageDao = new ProductImageDao();
		ProductImageDto productImageDto = productImageDao.get(productDto.getNo());
	%>
	<div class="row">
	상품이미지
	<input type="file" name="attach" accept="image/*" class="form-input" value=<%=productImageDto.getProductFileSaveName()%>>
	</div>
	<div class="row">
       	<input type="radio" name="selectImage" value="existing" checked="checked"> 기존 파일 <%=productImageDto!=null ? productImageDto.getProductFileUploadName() : ""%>
        <input type="radio" name="selectImage" value="new"> 신규 파일
        <input type="radio" name="selectImage" value="delete"> 파일 삭제
    </div>
			

	<div class="row">
	<input type="submit" value="수정">
	</div>
</form>




<jsp:include page="/template/footer.jsp"></jsp:include>