<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%-- 처리 --%>
<%
	SizeDao sizeDao = new SizeDao();
	List<SizeDto> sizeList = sizeDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/categoryedit.css">

<script>
$(function() {
	$(function() {
		$(".delete").click(function(e) {	
			if (!confirm("정말 삭제하시겠습니까?")) {
				e.preventDefault();
			}
		});
	});
});
</script>

<form action="./sizeinsert.kj" method="post">	
	<label>사이즈:</label>
	<input type="text" name="name" class="form-input">
	<input type="submit" value="등록하기" class="form-btn">	
</form>
<br>

<div class="container-300">	
	<ol class="contents mylist">
		<%for(SizeDto sizeDto : sizeList){%>
    	<li>
    		<%=sizeDto.getSizeName()%> → <a href="./sizedelete.kj?no=<%=sizeDto.getNo()%>" class="delete">삭제</a>
    	</li>
    	<%}%>
   	</ol>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>