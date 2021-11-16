<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%--입력 --%>

<%--처리 --%>
<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();
int i = 0;
%>

<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ProductDto product : list){ if(i == 4)break; i++;%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		    			<td>이미지영역</td>
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
		    			<td>이미지영역</td>
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
		    			<td>이미지영역</td>
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

<jsp:include page="/template/footer.jsp"></jsp:include>