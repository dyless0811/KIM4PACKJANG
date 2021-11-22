<%@page import="semi.beans.productPagination"%>
<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.ProductImageDto"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--입력 --%>
<%
int no=1;
if(request.getParameter("no")!=null){
no =Integer.parseInt(request.getParameter("no"));
}


String isType = request.getParameter("bigtypeno");
String isNo = request.getParameter("no");

ProductImageDao productImageDao =new ProductImageDao();


%>
<%--처리 --%>
<%
	productPagination pPagi = new productPagination(request);
	pPagi.calculate();
	int i = 0;
%>

<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1400 container-center">
	<div class="row right ">
	 <%if(isType != null){ 
	 	int bigTypeNo= Integer.parseInt(isType);
	 %>
	  <a href="<%=request.getContextPath()%>/product/productadd.jsp?bigtypeno=<%=bigTypeNo%>" class="link-btn link-btn:hover">상품등록</a> 
	 <%}else if(isNo != null){
		  int sno= Integer.parseInt(isNo); 
		 %>
	  <a href="<%=request.getContextPath()%>/product/productadd.jsp?no=<%=sno%>" class="link-btn link-btn:hover">상품등록</a> 
	 <%} %>
	</div>

   	<div class="row flex-container">
	    <%
	    	for(ProductDto product : pPagi.getList()){
	    	if(i != 0 && i % 4 == 0){
	    %>    			
		</div>
		<div class="row flex-container">
		<%}%>
			<div class="row flex-gro">
	    		<table class="table table-border table-hover">
		    		<tbody>
		    			<tr height="400px">
					   	 	<!-- 상품 이미지 -->
							<td>
							<%ProductImageDto productImageDto =productImageDao.get(product.getNo());%>
							<%if(productImageDto == null){ %>
							<%System.out.print(productImageDto); %>
							<img src="https://via.placeholder.com/300x350?text=ProductImage" width="100%" class="image  image-border">
							<%}else{ %>
							<img src="https://bymono.com/web/product/medium/202108/6f9f9933b1ac7791996620ddfe99b993.jpg" width="350px" height="350px"class="image image-border"> 
<!-- 							<iframe src="https://bymono.com/web/product/medium/202108/6f9f9933b1ac7791996620ddfe99b993.jpg" width="100%" height="100%"></iframe> -->
							<%} %>
							</td>
			    		</tr>
			    		<tr>
			    			<td>색상 / <%=product.getViews()%></td>
			    		</tr>
			    		<tr>
			    			<td><a href="./productdetail.jsp?no=<%=product.getNo()%>"><%=product.getName()%></a>(사이즈)</td>
			    		</tr>
			    		<tr>
			    			<td><%=product.getPrice()%></td>
			    		</tr>
			    		<tr>
			    			<td>------------<%=i%></td>
			    		</tr>
			    		<tr>
			    			<td><%=product.getDescription()%></td>
			    		</tr>
					</tbody>
				</table>
			</div>
	    <%i++;} %>
	</div>

<!-- 페이지네이션 -->
<div class="row center">
<%if(pPagi.getStartBlock() > 1){ %>
	<%if(pPagi.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="productlist.jsp?column=<%=pPagi.getColumn()%>&keyword=<%=pPagi.getKeyword()%>&p=<%=pPagi.getFinishBlock()+1%>%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="productlist.jsp?p=<%=pPagi.getStartBlock()-1%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int t = pPagi.getStartBlock(); t <= Math.min(pPagi.getFinishBlock(),pPagi.getLastBlock()); t++){ %>
	<%if(pPagi.isSearch()){ %>
	<!-- 검색용 버튼 -->
	<a href="productlist.jsp?column=<%=pPagi.getColumn()%>&keyword=<%=pPagi.getKeyword()%>&p=<%=t%>"><%=t%></a>
	<%}else{ %>
	<!-- 목록용 버튼 -->
		<%if(isType != null){ %>
		<a href="productlist.jsp?bigtypeno=<%=isType%>&p=<%=t%>"><%=t%></a>
		<%} else { %>
		<a href="productlist.jsp?no=<%=isNo%>&p=<%=t%>"><%=t%></a>
		<%} %>
	<%} %>
<%} %>

<%if(pPagi.getFinishBlock() < pPagi.getLastBlock()){ %>
	<%if(pPagi.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="productlist.jsp?column=<%=pPagi.getColumn()%>&keyword=<%=pPagi.getKeyword()%>&p=<%=pPagi.getFinishBlock()+1%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="productlist.jsp?p=<%=pPagi.getFinishBlock()+1%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>
</div>
	<!-- 검색창 -->
	<div class="row center">
		<form action="productlist.jsp" method="get">
	
	<select name="column" class="form-input form-inline">
				<%if(pPagi.columnIs("name")){ %>
				<option value="name" selected>상품명</option>
				<%}else{ %>
				<option value="name">상품명</option>
				<%}%>
				
				<%if(pPagi.columnIs("price")){ %>
				<option value="price" selected>가격</option>
				<%}else{ %>
				<option value="price">가격</option>
				<%}%>	
				
				<%if(pPagi.columnIs("no")){ %>
				<option value="no" selected>상품번호</option>
				<%}else{ %>
				<option value="no">상품번호</option>
				<%}%>
			</select>
			
			<input type="search" name="keyword" placeholder="검색어 입력" required 
					value="<%=pPagi.getKeywordString()%>" class="form-input form-inline">
			
			<% if(isType != null) { %>
			<input type="hidden" name="bigtypeno" value=<%=isType%>>
			<%}else{ %>
			<input type="hidden" name="no" value=<%=isNo%>>
			<%} %>
			
			
			<input type="submit" value="검색" class="form-btn form-inline">
			
		</form>
	</div>
</div>
	

<jsp:include page="/template/footer.jsp"></jsp:include>