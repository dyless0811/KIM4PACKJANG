<%@page import="semi.beans.ColorDto"%>
<%@page import="semi.beans.ColorDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ColorDao colorDao = new ColorDao();
	List<ColorDto> colorList = colorDao.list();
%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<style>
.form-input,
.form-btn {
    width: 14%;
    font-size: 10px;
    padding: 10px;
}



ul.mylist li, ol.mylist li {
    padding: 5px 0px 5px 5px;
    margin-bottom: 5px;
    border-bottom: 1px solid black;
    font-size: 30px;
    text-decoration : none;
}

a {
text-decoration: none red 5px ;
}
a:link { 
color: black; text-decoration: none;
}

a:visited { 
color: gray; text-decoration: none;
}
a:hover { 
color: black; text-decoration: underline;
}
</style>
	
	<form action="./colorinsert.kj" method="post">
		<label>색상:</label>
		<input type="text" name="name" class="form-input">
		<input type="submit" value="등록하기" class="form-btn">
	</form>
	
	
<div class="container-500">	
	<ol class="contents mylist">
	<%for(ColorDto colorDto : colorList){ %>
        <li class="mylist">
            <a href="#"><%=colorDto.getColorName()%></a> / <a href="./colordelete.kj?no=<%=colorDto.getNo()%>">삭제</a>
        </li>
    <%} %>
    </ol>


</div>
<jsp:include page="/template/footer.jsp"></jsp:include>