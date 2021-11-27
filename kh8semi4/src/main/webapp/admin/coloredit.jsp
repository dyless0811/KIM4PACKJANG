<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%-- 처리 --%>
<%
	ColorDao colorDao = new ColorDao();
	List<ColorDto> colorList = colorDao.list();
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
	
<form action="./colorinsert.kj" method="post">
	<label>색상:</label>
	<input type="text" name="name" class="form-input">
	<input type="submit" value="등록하기" class="form-btn">
</form>
	
<div class="container-500">	
	<ol class="contents mylist">
		<%for(ColorDto colorDto : colorList){ %>
        <li>
            <a href="#"><%=colorDto.getColorName()%></a> → <a href="./colordelete.kj?no=<%=colorDto.getNo()%>" class="delete">삭제</a>
        </li>
		<%} %>
    </ol>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>