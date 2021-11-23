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
    width: 15%;
    font-size: 20px;
    padding: 10px;
}
</style>
<script>
	$(function() {
		
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
	
	<ol class="contents">
	<%for(BigTypeDto bigType : bigTypeList){ %>
        <li>
            <a href="#" class="toggle"><%=bigType.getName()%></a> 
            [<a href="./bcategoridelete.kj?no=<%=bigType.getNo()%>">삭제</a>
            /<a href="./bigcategori_eidt.jsp?no=<%=bigType.getNo()%>&name=<%=bigType.getName()%>">수정]</a>
            <ol>
            <%
            	SmallTypeDao small = new SmallTypeDao();
            	List<SmallTypeDto> smallList = small.searchSmallType(bigType.getNo());
            	for(SmallTypeDto smallType : smallList){
            %>
                <li>
                <a><%=smallType.getName()%></a> / 
                [<a href="./scategoridelete.kj?no=<%=smallType.getNo()%>">삭제</a>
                /<a href="./smallcategori_edit.jsp?no=<%=smallType.getNo()%>&name=<%=smallType.getName()%>">수정 ]</a>
                </li>
            <%} %>
            	<li><a href="./cgedit.jsp?no=<%=bigType.getNo()%>"><%=bigType.getName()%>에 소분류 추가</a></li>
            </ol>
        </li>
    <%} %>
    </ol>


<jsp:include page="/template/footer.jsp"></jsp:include>