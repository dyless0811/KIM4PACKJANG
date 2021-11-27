<%@page import="semi.beans.AdminProductPagination"%>
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
<%-- 입력 --%>
<%-- 처리 --%>
<%
	//상품을 일단 출력한다.->페이지네이션으로 변경
	AdminProductPagination aPP = new AdminProductPagination(request);
	aPP.calculate();
	
	//일단 필터에 출력할 대분류목록을 가져온다.
	BigTypeDao bigTypeDao = new BigTypeDao();
	List<BigTypeDto> bigTypeList = bigTypeDao.list();
	
	//smalltypeDao
	SmallTypeDao smallTypeDao = new SmallTypeDao();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	
<h1>재고 관리 페이지</h1>
<div class="container-1000 container-center">
	<div class="row">
		<table class="table table-hover table-border">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>카테고리[대]</th>
					<th>카테고리[소]</th>
					<th>상품가격</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<%for(ProductDto product : aPP.getList()){ %>
					<%  //해당 상품의 smalltypeno를 이용해서 bigtype가져오기
						SmallTypeDto smallTypeDto = smallTypeDao.get(product.getSmallTypeNo());
						//SmallType객체에 담긴 bigtypeNo를 이용해서 검색한 뒤 이름을 가져온다
						BigTypeDto bigTypeDto = bigTypeDao.get(smallTypeDto.getBigTypeNo());
						
						//해당 상품번호를 이용해서 재고의 개수를 계산하는 메소드를 불러온다
						StockDao stockDao = new StockDao();
						int stockCount = stockDao.stockCount(product.getNo());		
					%>
				<tr>
					<td><%=product.getNo()%></td>
					<td><%=product.getName()%></td>
					<td>[<%=bigTypeDto.getName()%>]</td>
					<td>[<%=smallTypeDto.getName()%>]</td>
					<td><%=product.getPrice()%></td>
					<td><a href="stockadd.jsp?productno=<%=product.getNo()%>">입고</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div class="row center">
		<%if(aPP.getStartBlock() > 1){ %>
			<%if(aPP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="stock.jsp?column=<%=aPP.getColumn()%>&keyword=<%=aPP.getKeyword()%>&p=<%=aPP.getStartBlock()-1%>">&lt;</a>
			<%} else { %>
			<!-- 목록용 링크 -->
			<a href="stock.jsp?p=<%=aPP.getStartBlock()-1%>">&lt;</a>
			<%} %>
		<%} else { %>
		<a>&lt;</a>
		<%} %> 
		
		<%for(int i = aPP.getStartBlock(); i <= Math.min(aPP.getFinishBlock(),aPP.getLastBlock()); i++){ %>
			<%if(aPP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="stock.jsp?column=<%=aPP.getColumn()%>&keyword=<%=aPP.getKeyword()%>&p=<%=i%>"><%=i%></a>
			<%}else{ %>
			<!-- 목록용 링크 -->
			<a href="stock.jsp?p=<%=i%>"><%=i%></a>
			<%} %>
		<%} %>
		
		<%if(aPP.getFinishBlock() < aPP.getLastBlock()){ %>
			<%if(aPP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="stock.jsp?column=<%=aPP.getColumn()%>&keyword=<%=aPP.getKeyword()%>&p=<%=aPP.getFinishBlock()+1%>">&gt;</a>
			<%} else { %>
			<!-- 목록용 링크 -->
			<a href="stock.jsp?p=<%=aPP.getFinishBlock()+1%>">&gt;</a>
			<%} %> 
		<%} else {%>
		<a>&gt;</a>
		<%} %>
	</div>
	
	<div class="row center">
		<%-- 검색세션 --%>
		<form action="stock.jsp" method="post">
			<select name="column" class="form-input form-inline">
				<option value="name">상품명</option>
			</select>
			<input type="search" placeholder="검색어" name="keyword" class="form-input form-inline">
			<input type="submit" value="찾기" class="form-btn form-inline">
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
	
<%-- 페이지네이션 자리 --%>

