<%@page import="semi.beans.BigTypeDto"%>
<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
String isType=request.getParameter("bigtypeno");
String isNo = request.getParameter("no");

SmallTypeDao smallTypeDao = new SmallTypeDao();
List<SmallTypeDto> list;

if(isType == null){
  int bigTypeNo=smallTypeDao.searchBigTypeNo(Integer.parseInt(request.getParameter("no")));
  list=smallTypeDao.searchSmallType(bigTypeNo);
}else{
	int bigTypeNo=Integer.parseInt(isType);
	list=smallTypeDao.searchSmallType(bigTypeNo);
}




BigTypeDto bigtypeDto = new BigTypeDto();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="./productadd.kj" method=post enctype="multipart/form-data"> 
	<div>
	<h1>상품등록 페이지</h1>
	</div>
	<div  class="row">	 
	
	 <select name=smallTypeNo class="form-input form-inline">
	 <%for(SmallTypeDto smallTypeDto : list){ %>
		<%if(smallTypeDto.getNo()==Integer.parseInt(isNo)){ %>	 
	 	<option selected value=<%=smallTypeDto.getNo()%>><%=smallTypeDto.getName()%></option>
	 	<%}else{ %>
	 		<option value=<%=smallTypeDto.getNo()%>><%=smallTypeDto.getName()%></option>
	    <%} %>
	 <%} %>
	 </select>

	</div>
	<div class="row">
	 상품명 <input type="text"  name="name" required class=form-input>
	</div>

	<div  class="row">
	 가격 <input type="number" name="price" class=form-input>
	</div>
	<div class="row">
	사이즈
	</div>
	<div class="row">
	색상
	</div>
	<div  class="row">
	상품설명
	<textarea rows="40" cols="100" name="description" class=form-input></textarea>
	</div>
	
	<div class="row">
	상품이미지
	<input type="file" name="attach" accept="image/*" class="form-input">
	</div>
		
			

	<div class="row">
	<input type="submit" value="상품등록">
	</div>
</form>




<jsp:include page="/template/footer.jsp"></jsp:include>