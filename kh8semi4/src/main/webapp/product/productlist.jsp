<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--�Է� --%>

<%--ó�� --%>
<% 
ProductDao productDao =new ProductDao();
List<ProductDto> list = productDao.list();
%>

<%--��� --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1200 container-center">
    <div class="row">
        <table class="table table-border">
            <thead>
                <tr>
                    <th>�Һз���ȣ</th>
                    <th>��ǰ��ȣ</th>
                    <th>��ǰ��</th>
                    <th>����</th>
                    <th>��ȸ��</th>
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
                        <a href="productedit.jsp?no=<%=productDto.getNo()%>">����</a>
                        <a href="delete.kj?no=<%=productDto.getNo()%>">����</a>
                    </td>
                </tr>
            <%} %>
            </tbody>
        </table>
        <!-- ������ ���̼�-->
        <!-- �˻�â -->
        <div class="row right">
        <select name="column" class="form-input form-inline">
        	<option value="no" selected>��ǰ��ȣ</option>
        	<option value="SmallTypeNo" selected>�Һз���ȣ</option>
        	<option value="Name" selected>��ǰ��</option>
        </select>
        <input type="text" name="keyowrd" placeholder="�˻����Է�"  required class="form-input form-inline">
        <input type="submit" value="�˻�" class="form-btn form-inline">
        </div>
    </div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>