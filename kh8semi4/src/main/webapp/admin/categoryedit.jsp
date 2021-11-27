<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@page import="semi.beans.BigTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%-- 처리 --%>
<%
	//대분류 목록 출력
	BigTypeDao bigTypeDao = new BigTypeDao();
	List<BigTypeDto> bigTypeList = bigTypeDao.list();
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
	<%if(bigTypeDao.list10()){ %>
	<div>
		<label>대분류명</label>
		<input type="text" name="name" class="form-input">
		<input type="submit" value="등록하기" class="form-btn">
	</div>
	<%}else{ %>
	<div>
		<h4>큰 카테고리는 10개만 등록할수 있습니다</h4>
		<h4>추가 등록하고싶으시면 기존 카테고리 삭제하세요</h4>
	</div>
	<%} %>
</form>
	
<hr>
<div class="row container-500">
	<ol class="contents mylist" type="1">
		<%for(BigTypeDto bigType : bigTypeList){ %>
    	<li>
        	<a class="toggle"><%=bigType.getName()%></a> →
        	[<a href="./bcategoridelete.kj?no=<%=bigType.getNo()%>" class="delete">삭제</a>
        	/<a href="./bigcategori_eidt.jsp?no=<%=bigType.getNo()%>&name=<%=bigType.getName()%>" class="edit">수정</a>]
        	<ol>
        		<%
        		SmallTypeDao small = new SmallTypeDao();
        		List<SmallTypeDto> smallList = small.searchSmallType(bigType.getNo());
        		%>
        		<%for(SmallTypeDto smallType : smallList){%>
            	<li>
            		<a><%=smallType.getName()%></a> →
            		[<a href="./scategoridelete.kj?no=<%=smallType.getNo()%>" class="delete">삭제</a>
            		/<a href="./smallcategori_edit.jsp?no=<%=smallType.getNo()%>&name=<%=smallType.getName()%>" class="edit">수정</a>]
            	</li>
        		<%}%>
        		<li ><a href="./cgedit.jsp?no=<%=bigType.getNo()%>"><%=bigType.getName()%>에 소분류 추가</a></li>
        	</ol>
        </li>
		<%}%>
	</ol>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>