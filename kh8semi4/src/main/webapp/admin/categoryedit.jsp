<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@page import="semi.beans.BigTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//대분류 목록 출력
	BigTypeDao bigTypeDao = new BigTypeDao();
	List<BigTypeDto> bigTypeList = bigTypeDao.list();
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
	
	$(function() {
		$(".edit").click(function(e) {	
			if (!confirm("수정페이지로이동할까요?")) {
				e.preventDefault();
			}
		});
	});

});
</script>
	<form action="./bcategoriinsert.kj" method="post">
		<div>
			<label>대분류명</label>
			<input type="text" name="name" class="form-input">
			<input type="submit" value="등록하기" class="form-btn">
		</div>
	</form>
	
	<hr>
	<div class="row container-500">
	<ol  class="contents mylist" type="1">
	<%for(BigTypeDto bigType : bigTypeList){ %>
        <li class="mylist">
            <a class="toggle"><%=bigType.getName()%></a> →
            [<a href="./bcategoridelete.kj?no=<%=bigType.getNo()%>" class="delete">삭제</a>
            /<a href="./bigcategori_eidt.jsp?no=<%=bigType.getNo()%>&name=<%=bigType.getName()%>" class="edit">수정]</a>
            <ol class="mylist">
           
            <%  SmallTypeDao small = new SmallTypeDao();
            	List<SmallTypeDto> smallList = small.searchSmallType(bigType.getNo());
            	for(SmallTypeDto smallType : smallList){   %>
      
                <li class="mylist">
                <a><%=smallType.getName()%></a> →
                [<a href="./scategoridelete.kj?no=<%=smallType.getNo()%>" class="delete">삭제</a>
                /<a href="./smallcategori_edit.jsp?no=<%=smallType.getNo()%>&name=<%=smallType.getName()%>" class="edit">수정 ]</a>
                </li>
            <%} %>
            	<li ><a href="./cgedit.jsp?no=<%=bigType.getNo()%>"><%=bigType.getName()%>에 소분류 추가</a></li>
            </ol>
      
    <%} %>
    </ol>
    </div>


<jsp:include page="/template/footer.jsp"></jsp:include>