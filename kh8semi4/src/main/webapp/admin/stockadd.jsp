<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.ColorDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductColorDao"%>
<%@page import="semi.beans.ProductSizeDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.StockDto"%>
<%@page import="semi.beans.StockDao"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 입력 --%>
<%
	int productNo = Integer.parseInt(request.getParameter("productno"));
%>
<%-- 처리 --%>
<%
	//stock페이지에서 받아온 productNo

	//productNo를 이용해서 상품 정보를 출력한다.
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.get(productNo);
	
	//productNo로 색상 가져오기
	ProductSizeDao productSizeDao =new ProductSizeDao();
  	List<SizeDto> sizeList = productSizeDao.sizeListByProductNo(productNo);
  
	//productNo로 사이즈 가져오기
	ProductColorDao productColorDao = new ProductColorDao();
  	List<ColorDto> colorList = productColorDao.colorListByProductNo(productNo);
	
	//해당 상품의 재고정보를 가져온다
	StockDao stockDao = new StockDao();
	StockDto stockDto = stockDao.get(productNo);
	int stock;
	if(stockDto != null){
		stock = stockDto.getStockChange();
	}else{
		stock = 0;
	}
%>    
<jsp:include page="/template/header.jsp"></jsp:include>
<script>
    $(function(){
    	$("#select-btn").on("click", function (e) {
			e.preventDefault();
			var productNo = $("#productNo").val();
    	    var sizeNo = $("#select-size option:selected").val();
    	    var sizeName = $("#select-size option:selected").text();
    	    var colorNo = $("#select-color option:selected").val();
    	    var colorName = $("#select-color option:selected").text();
    	      
    	 	if (sizeNo == "" || colorNo == "") {
    	        alert("색상과 사이즈를 선택해주세요!");
    	        return;
    	    }
    	 	
    		$.ajax({
    			url : "<%=request.getContextPath()%>/admin/stock-colorsize.kj",
				type : "post",
				data : {//전송 시 첨부할 파라미터 정보
					productNo : productNo,
					colorNo : colorNo,
					sizeNo : sizeNo
				},
				success : function(resp) {
					$("#stock").text(resp);
				},
				error : function(err) {//통신이 실패했다.
				}
			});

		});
	});
</script>

<form action="stockadd.kj" method="post">
<table>
	<thead>
		<tr>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>수량</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input id="productNo" type="hidden" name="productNo" value="<%=productNo%>"><%=productDto.getName()%></td>
			<td>
				<select name="sizeNo" id="select-size" required>
					<option value="" selected>---</option>
					<%for(SizeDto sizeDto : sizeList) {%>
					<option value="<%=sizeDto.getNo()%>"><%=sizeDto.getSizeName()%></option>
					<%}%>
				</select>
			</td>
			<td>
				<select name="colorNo" id="select-color" required>
					<option value="" selected>---</option>
					<%for(ColorDto colorDto : colorList) {%>
					<option value="<%=colorDto.getNo()%>"><%=colorDto.getColorName()%></option>
					<%}%>
				</select>
			</td>
			<td>[<span id="stock"></span> 개]</td>
			<td><button id="select-btn">조회</button></td>
		</tr>
	</tbody>
</table>
	<input type="hidden" name="productNo" value="<%=productDto.getNo()%>">
	<input type="number"  name="stockChange" min="-100000000" max="100000000" placeholder="개수입력">
	<input type="submit" value="추가하기">
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>