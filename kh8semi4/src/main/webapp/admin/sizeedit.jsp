<%@page import="semi.beans.SizeDto"%>
<%@page import="semi.beans.SizeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	SizeDao sizeDao = new SizeDao();
	List<SizeDto> sizeList = sizeDao.list();
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
	<%for(SizeDto sizeDto : sizeList){ %>
        <li class="mylist">
            <a href="#"><%=sizeDto.getSizeName()%></a> → <a href="./sizedelete.kj?no=<%=sizeDto.getNo()%>" class="delete">삭제</a>
        </li>
    <%} %>
    </ol>
 </div>


<jsp:include page="/template/footer.jsp"></jsp:include>