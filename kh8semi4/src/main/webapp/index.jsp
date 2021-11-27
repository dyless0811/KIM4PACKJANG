<%@page import="semi.beans.TopVo"%>
<%@page import="java.text.Format"%>
<%@page import="semi.beans.ProductImageDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ProductImageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--입력 --%>
 
 <%--처리 --%>

<%
ProductImageDao productImageDao =new ProductImageDao();
ProductDao productDao = new ProductDao();
System.out.println("어디까지왓니");
List<TopVo> list = productDao.BEST20();
System.out.println("어디까지왓니1");
Format d = new DecimalFormat("#,##0");
%>
 
 <%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
  <style>
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 16s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:300px;}

    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
    .item {
   display: flex;
   flex-direction: column;
   flex: 1 1 1 1 25%;
   flex-basis :auto;
}
table{
margin-left: auto; 
margin-right: auto;
</style>
<div class="container-1500 container-center">

	<div class="slide">
	    <ul>
	      <li><img src="/kh8semi4/image/freedeilvery.png" width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/banner1.jpg"  width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/center-1.jpg" width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/2.png" width="100%" height="100%"></li>
	    </ul>
	  </div>
</div>
  
  <div class="container-1500 container-center">
   <div class="center">
   	<img src="/kh8semi4/image/BEST.png">
   </div>	
  </div>
 <hr style="color:navy;">
 <div class="contianer-1500 container-center">
    <div class="row flex-container">
     <%
     int i=0;
          for(TopVo topvolist : list){
     		if(i != 0 && i % 4 == 0){
     %> 
  			
		</div>
		<div class="row flex-container" style="margin-left: auto; 
margin-right: auto;">
		<%}%>
			<div class="row">
	    		<table class="table table-hover item" >
		    		<tbody>
		    			<tr height="350px" >
					   	 	<!-- 상품 이미지 -->
							<td width="25%" colspan="2">
							<%ProductImageDto productImageDto =productImageDao.get(topvolist.getNo());%>
							<%if(productImageDto != null) {%>
							<a href="./productdetail.jsp?no=<%=topvolist.getNo()%>"><img src="<%=request.getContextPath()%>/product/productImage.kj?no=<%=topvolist.getNo()%>" width="330px" height="350px"></a>
							<%} else {%>
							<a href="./productdetail.jsp?no=<%=topvolist.getNo()%>"><img src="http://www.bsang.co.kr/images/datasheet/SAM/2.jpg"   width="330px" height="350px"></a>
								<%}%>
							</td>
			    		</tr>
			    		<tr>
			    			<td class="right">조회수:<%=topvolist.getViews()%></td>
			    			<td class="legt"><%=i+1%>번상품</td>
			    		</tr>
			    		<tr >
			    			<td colspan="2"><a href="./productdetail.jsp?no=<%=topvolist.getNo()%>"><%=topvolist.getName()%></a></td>
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
			