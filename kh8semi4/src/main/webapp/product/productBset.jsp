<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.beans.TopVo"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductImageDao"%>
<%@page import="semi.beans.ProductImageDto"%>
 <%--입력 --%>
 
 <%--처리 --%>
<%
ProductImageDao productImageDao =new ProductImageDao();
ProductDao productDao = new ProductDao();
List<TopVo> list = productDao.BEST20();
Format d = new DecimalFormat("#,##0");
%>
 
 <%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
  <style>
  
.item {
   display: flex;
   flex-direction: column;
   flex: 1 1 1 1 25%;
   flex-basis :auto;
}

table{
padding:  0 0 21px 21px
}

</style>

 <div class="contianer-1500 container-center">
    <div class="row flex-container">
     <%
     int i=0;
          for(TopVo topvolist : list){
     		if(i != 0 && i % 4 == 0){
     %> 
  			
		</div>
		<div class="row flex-container ">
		<%}%>
			<div class="row">
	    		<table class="table table-hover item  admin-main" >
		    		<tbody>
		    			<tr height="350px" >
					   	 	<!-- 상품 이미지 -->
							<td colspan="2">
							<%ProductImageDto productImageDto =productImageDao.get(topvolist.getNo());%>
							<%if(productImageDto != null) {%>
							<a href="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=topvolist.getNo()%>"><img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=topvolist.getNo()%>" width="330px" height="350px"></a>
							<%} else {%>
							<a href="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=topvolist.getNo()%>"><img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg"   width="330px" height="350px"></a>
								<%}%>
							</td>
			    		</tr>
			    		<tr>
			    			<td class="right">조회수:<%=topvolist.getViews()%></td>
			    			<td class="legt"><%=i+1%>번상품</td>
			    		</tr>
			    		<tr >
			    			<td colspan="2"><a href="<%=request.getContextPath()%>/product/productdetail.jsp?no=<%=topvolist.getNo()%>"><%=topvolist.getName()%></a></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2"><%=d.format(topvolist.getPrice())%>원</td>
			    		</tr>
			    		<tr>
			    			<td colspan="2"><hr></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2"><%=topvolist.getDescription()%></td>
			    		</tr>
					</tbody>
				</table>
			</div>
	    <%i++;} %>
	</div>
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>