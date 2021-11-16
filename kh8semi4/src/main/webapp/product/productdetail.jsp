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

  %>
 <%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>


<table > <%--class="table table-stripe" --%>
	<tbody>
		<tr>
			<th width="25%">상품번호</th>
			<td><%=productDto.getNo()%></td>
		</tr>
		<tr>
			<th>소분류번호</th>
			<td><%=productDto.getSmallTypeNo()%></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><%=productDto.getName()%></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><%=productDto.getPrice()%></td>
		</tr>
		<tr>
			<th>설명</th>
			<td><%=productDto.getDescription()%></td>
		</tr>

	</tbody>
</table>

<jsp:include page="/template/footer.jsp"></jsp:include>