<%@page import="semi.beans.BuyDto"%>
<%@page import="semi.beans.BuyDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  사용자 => 리뷰 작성 준비물: 별점 등록, 내용 작성, 사진 파일 업로드, -->
<!-- 페이지 => 상품 번호 -->

<!-- 처리 -->
<%
	
	int buyNo = Integer.parseInt(request.getParameter("no"));
	BuyDao buyDao = new BuyDao();
	BuyDto buyDto = buyDao.get(buyNo);
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.get(buyDto.getProductNo());
%>


<!-- 출력 -->
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
        /* component */

.star-rating {
/*   border:solid 1px #ccc; */
  display:flex;
  flex-direction: row-reverse;
  font-size:2.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

    </style>

	<div class="container-1000 container-center" >
		<div class="row center">
		<h2><%=productDto.getName()%></h2>
		</div>
		
		<form action="<%=request.getContextPath()%>/reply/add.kj" method="post" enctype="multipart/form-data">
		<input type="hidden" name="buyNo" value="<%=buyNo%>">
			
		<div style="display: inline-block; float:right">
			<div class="star-rating">
    			<input type="radio" id="5-stars" name="starPoint" value="5" checked/>
    			<label for="5-stars" class="star">&#9733;</label>
    			<input type="radio" id="4-stars" name="starPoint" value="4" />
    			<label for="4-stars" class="star">&#9733;</label>
    			<input type="radio" id="3-stars" name="starPoint" value="3" />
    			<label for="3-stars" class="star">&#9733;</label>
    			<input type="radio" id="2-stars" name="starPoint" value="2" />
    			<label for="2-stars" class="star">&#9733;</label>
    			<input type="radio" id="1-star" name="starPoint" value="1" />
    		<label for="1-star" class="star">&#9733;</label>
  			</div>
 	</div>

		<div class="row center">
			<textarea
				style="width : 1000px; height : 400px"
				name= "content"
				required>
			</textarea>
		</div>
		<div class="row">
			<input type="file" name="attach" style = "font-size:20px;">
			</div>
			<div class="row right">
			<input type="submit" value="등록" style = "font-size:20px;">
			</div>
		
		</form>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>