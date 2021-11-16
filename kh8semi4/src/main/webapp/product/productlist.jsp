<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--입력 --%>

<%--처리 --%>
<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();
%>

<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
    <div class="row">
        <table class="table table-border">
            <thead>
                <tr>
                    <th>소분류번호</th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            <%for(ProductDto productDto : list){ %>
                <tr>
                    <td><%=productDto.getSmallTypeNo()%></td>
                    <td><%=productDto.getNo()%></td>
                    <td><a href="productdetail.jsp?no=<%=productDto.getNo()%>"><%=productDto.getName()%></a></td>
                    <td><%=productDto.getName()%></td>
                    <td><%=productDto.getPrice()%></td>
                    <td><%=productDto.getViews()%></td>
                    
                    <td>
                        <a href="productedit.jsp?no=<%=productDto.getNo()%>">수정</a>
                        <a href="delete.kj?no=<%=productDto.getNo()%>">삭제</a>
                    </td>
                </tr>
            <%} %>
            </tbody>
        </table>
        <!-- 페이지 네이션-->
        <!-- 검색창 -->
        <div class="row right">
        <select name="column" class="form-input form-inline">
        	<option value="no" selected>상품번호</option>
        	<option value="SmallTypeNo" selected>소분류번호</option>
        	<option value="Name" selected>상품명</option>
        </select>
        <input type="text" name="keyowrd" placeholder="검색어입력"  required class="form-input form-inline">
        <input type="submit" value="검색" class="form-btn form-inline">
        </div>
    </div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>