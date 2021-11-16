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
int i = 0;//pagenation begin를 집어넣으면 될 것 같다.
%>

<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ProductDto product : list){ 
    	if(i == 12) break;//pagenation end를 집어넣으면 될 것 같다.
        if(i % 4 == 0) {%>
            </div>
            <div class="row flex-container">
        <%}%>
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
        <%i++; } %>
    </div>
    <div class="row center">
    	<!-- 페이지네이션 자리 -->
    	<h3>[이전] 1 / 2 / 3 / 4 / 5 / 6 / 7 /8 /9 / 10 [다음]</h3>
    </div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>