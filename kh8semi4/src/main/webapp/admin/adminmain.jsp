<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.title-font{
font-size: 100px;
}
.content-font{
font-size:30px;
}
</style>
<script>
	$(function() {
		$(function() {
			$(this).click(function(e) {	
				if (!confirm("해당 페이지로 이동하시겠습니까?")) {
					e.preventDefault();
				}
			});
		});
	});
</script>
<h1 class="title-font center">관리자 페이지</h1>
<ol class="content-font center">
 <li><a href="./categoryedit.jsp">카테고리 수정하러 가기</a></li> 
 <li><a href="./coloredit.jsp">색상 수정하러 가기</a></li>
 <li><a href="./sizeedit.jsp">사이즈 수정하러 가기</a></li>
 <li><a href="./customerlist.jsp">회원 목록 보러가기</a></li>
</ol>

<jsp:include page="/template/footer.jsp"></jsp:include>