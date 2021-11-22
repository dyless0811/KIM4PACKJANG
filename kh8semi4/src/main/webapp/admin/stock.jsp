<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="semi.beans.ProductColorDto"%>
<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="semi.beans.ProductSizeDto"%>
<%@page import="semi.beans.StockDto"%>
<%@page import="semi.beans.StockDao"%>
<%@page import="semi.beans.ProductColorDao"%>
<%@page import="semi.beans.ProductSizeDao"%>
<%@page import="semi.beans.BigTypeDto"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//상품을 일단 출력한다.
	ProductDao productDao = new ProductDao();
	List<ProductDto> productList = productDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<h1>재고 관리 페이지</h1>
	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>카테고리[대]</th>
				<th>카테고리[소]</th>
				<th>상품가격</th>
				<th>상품사이즈</th>
				<th>상품색상</th>
				<th>수량</th>
				<th>상태</th>
			</tr>
		</thead>
			<%for(ProductDto product : productList){ %>
				<tr>
					<td><%=product.getNo()%></td>
					<td><%=product.getName()%></td>
						<%//해당 상품의 smalltypeno를 이용해서 bigtype가져오기
							SmallTypeDao smallTypeDao = new SmallTypeDao();
							SmallTypeDto smallTypeDto = smallTypeDao.get(product.getSmallTypeNo());
							//SmallType객체에 담긴 bigtypeNo를 이용해서 검색한 뒤 이름을 가져온다
							BigTypeDao bigTypeDao = new BigTypeDao();
							BigTypeDto bigTypeDto = bigTypeDao.get(smallTypeDto.getBigTypeNo());
							
							//해당 상품번호를 이용해서 사이즈이름을 가져오는 코드
							ProductSizeDao pSDao = new ProductSizeDao();
							ProductSizeDto pSDto = pSDao.getProductSizeData(product.getNo());
							String sizeName;
							if(pSDto != null){
								SizeDao SizeDao = new SizeDao();
								SizeDto sizeDto = SizeDao.get(pSDto.getSizeNo());
								sizeName = sizeDto.getSizeName();
							} else {
								sizeName = "없음";
							}
							
							
							//해당 상품번호를 이용해서 색상이름을 가져오는 코드
							ProductColorDao pCDao = new ProductColorDao();
							ProductColorDto productColorDto = pCDao.getProductColorData(product.getNo());
							String colorName;
							if(productColorDto != null){
								ColorDao colorDao = new ColorDao();
								ColorDto colorDto = colorDao.get(productColorDto.getColorNo());
								colorName = colorDto.getColorName();
							}else{
								colorName = "없음";
							}
							
							//해당 상품번호를 이용해서 재고의 개수를 계산하는 메소드를 불러온다
							StockDao stockDao = new StockDao();
							int stockCount = stockDao.stockCount(product.getNo());
							
						%>
					<td>[<%=bigTypeDto.getName()%>]</td>
					<td>[<%=smallTypeDto.getName()%>]</td>
					<td><%=product.getPrice()%></td>
					<td>[<%=sizeName%>]</td>
					<td>[<%=colorName%>]</td>
					<td>[<%=stockCount%> 개]</td>
					<td><a href="stockadd.jsp?productno=<%=product.getNo()%>">추가</a></td>
				</tr>
			<%} %>
		<tbody>
		</tbody>
	</table>
<jsp:include page="/template/footer.jsp"></jsp:include>