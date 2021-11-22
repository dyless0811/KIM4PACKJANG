<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.StockDto"%>
<%@page import="semi.beans.StockDao"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//stock페이지에서 받아온 productNo
	int productNo = Integer.parseInt(request.getParameter("productno"));

	//productNo를 이용해서 상품 정보를 출력한다.
	ProductDao productDao = new ProductDao();
	ProductDto productDto = productDao.get(productNo);
	
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
<table>
	<thead>
		<tr>
			<th>상품명</th>
			<th>수량</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><%=productDto.getName()%></td>
			<td>[<%=stock%> 개]</td>
		</tr>
	</tbody>
</table>
<form action="stockadd.kj" method="post">
	<input type="hidden" name="productNo" value="<%=productDto.getNo()%>">
	<input type="number"  name="stockChange" min="-100000000" max="100000000" placeholder="개수입력">
	<input type="submit" value="추가하기">
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>