<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트 제에스피~!</title>
</head>
<body>
<%-- header --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div>
	<div class="row center">
		<h2>상품/사이즈 문의</h2>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link-btn">글쓰기</a>
	</div>
	<div calss="row center">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
		</table>
		
	</div>
	
	<div class="row center">
		<h2>지연 상품</h2>
	</div>
	
	<div class="row center">
		<h2>구매 후기</h2>
	</div>
	
	<div class="row center">
		<h2>공지 사항</h2>
	</div>
</div>

<!-- 검색창  -->


<%--footer --%>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>