<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.title-font{
font-size: 50px;
}
.content-font{
font-size:30px;
float: left;

}

a {
text-decoration: none red 5px ;
}
a:link { 
color: black; text-decoration: none;
}

a:visited { 
color: black; text-decoration: none;
}
a:hover { 
color: gray; text-decoration: underline;
}
</style>

<script>
	$(function() {
		$(function() {
			$(".here").click(function(e) {	
				if (!confirm("해당 페이지로 이동하시겠습니까?")) {
					e.preventDefault();
				}
			});
		});
	});
</script>
<div class="container-500 container-center">
<table class="table table-hover">
 <thead>
  <tr>
   <th class="title-font"><h1>관리자 페이지</h1></th>
  </tr>
 </thead>
 
 <tbody>
  <tr>
  	<td class="content-font"><a href="./categoryedit.jsp" class="here">● 카테고리 수정하러 가기</a></td>
  </tr>
  <tr>
  	<td class="content-font" ><a href="./coloredit.jsp" class="here">● 색상 수정하러 가기</a></td>
  </tr>
  <tr>
  	<td class="content-font"><a href="./sizeedit.jsp" class="here">● 사이즈 수정하러 가기</a></td>
  </tr>
  <tr>
  	<td class="content-font"><a href="./customerlist.jsp" class="here">● 회원 목록 보러가기</a></td>
  </tr>
  <tr>
  	<td class="content-font"><a href="./stock.jsp" class="here">● 재고 관리</a></td>
  </tr>
  <tr>
  	<td class="content-font"><a href="./statistics.jsp" class="here">● 홈페이지 통계 보기</a></td>
  </tr>
 </tbody>
 
</table>
</div>
<!--  잠시백업
<div class="container-400 container-center">
<ol class="content-font center"> 
 <li class="here"><a href="./categoryedit.jsp">카테고리 수정하러 가기</a></li> 
 <li class="here"><a href="./coloredit.jsp">색상 수정하러 가기</a></li>
 <li class="here"><a href="./sizeedit.jsp">사이즈 수정하러 가기</a></li>
 <li class="here"><a href="./customerlist.jsp">회원 목록 보러가기</a></li>
 <li class="here"><a href="./stock.jsp">재고 관리</a></li>
 <li class="here"><a href="./statistics.jsp">홈페이지 통계 보기</a></li>
</ol>
</div>
 -->
<jsp:include page="/template/footer.jsp"></jsp:include>

