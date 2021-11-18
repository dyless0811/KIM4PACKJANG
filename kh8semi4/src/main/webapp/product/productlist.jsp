<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.ProductImageDto"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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

ProductImageDto productImageDto =productImageDao.get(no);
%>
<%--처리 --%>

<% 
int p;
int psize=12;

try{
	p=Integer.parseInt(request.getParameter("p"));
	//강제예외
	if(p<0){
		throw new Exception();
	}
}catch(Exception e){
	p=1;
}

int end =p * psize;
int begin = end-(psize-1);
%>
p=<%=p%> begin=<%=begin %> end=<%=end%>

<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();
int i = 0;

list = productDao.listByRownum(begin, end); //원하는 구간 목록 

%>
<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1400 container-center"></div>
	<div class="row right ">
	 <%if(isType != null){ 
	 	int bigTypeNo= Integer.parseInt(isType);
	 %>
	  <a href="http://localhost:8080/kh8semi4/product/productadd.jsp?bigtypeno=<%=bigTypeNo%>" class="link-btn link-btn:hover">상품등록</a> 
	 <%}else if(isNo != null){
		  int sno= Integer.parseInt(isNo); 
		 %>
	  <a href="http://localhost:8080/kh8semi4/product/productadd.jsp?no=<%=sno%>" class="link-btn link-btn:hover">상품등록</a> 
	 <%} %>
	</div>
    <div class="row flex-container">
    <%for(ProductDto product : list){ if(i == 4)break; i++;%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		   	 	<!-- 상품 이미지 -->
				<td>

				<%if(productImageDto == null){ %>
				<img src="https://via.placeholder.com/300x350?text=ProductImage" width="100%" class="image  image-border">
				<%}else{ %>
				<img src="/product/productadd.kj?productImageNo=<%=productImageDto.getProductNo()%>" width="100%" class="image image-border">
				<%} %>
				</td>
		    		</tr>
		    		<tr>
		    			<td>색상 / <%=product.getViews()%></td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getName()%>(사이즈)</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getPrice()%></td>
		    		</tr>
		    		<tr>
		    			<td>------------</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getDescription()%></td>
		    		</tr>
		    	</tbody>
		    </table>
    	</div>
    	<%} %>
    </div>
</div>
<%i = 0; %>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ProductDto product : list){ if(i == 4)break; i++;%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		    		<td><img src="https://via.placeholder.com/300x350"></td>
		    		</tr>
		    		<tr>
		    			<td>색상 / <%=product.getViews()%></td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getName()%>(사이즈)</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getPrice()%></td>
		    		</tr>
		    		<tr>
		    			<td>------------</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getDescription()%></td>
		    		</tr>
		    	</tbody>
		    </table>
    	</div>
    	<%} %>
    </div>
</div>
<%i = 0; %>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ProductDto product : list){ if(i == 4)break; i++;%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		    		<td><img src="https://via.placeholder.com/300x350"></td>
		    		</tr>
		    		<tr>
		    			<td>색상 / <%=product.getViews()%></td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getName()%>(사이즈)</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getPrice()%></td>
		    		</tr>
		    		<tr>
		    			<td>------------</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getDescription()%></td>
		    		</tr>
		    	</tbody>
		    </table>
    	</div>
    	<%} %>
    </div>
</div>
<%i = 0; %>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ProductDto product : list){ if(i == 4)break; i++;%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		    			<td><img src="https://via.placeholder.com/300x350"></td>
		    		</tr>
		    		<tr>
		    			<td>색상 / <%=product.getViews()%></td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getName()%>(사이즈)</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getPrice()%></td>
		    		</tr>
		    		<tr>
		    			<td>------------</td>
		    		</tr>
		    		<tr>
		    			<td><%=product.getDescription()%></td>
		    		</tr>
		    	</tbody>
		    </table>
    	</div>
    	<%} %>
    </div>
</div>

<!-- 페이지네이션 모양만잇습니다-->
<div class="row center">
[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>