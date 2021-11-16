<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 --%>


<%-- 처리 --%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action=#>
	<div class="container-1400 container-center">
		<div class="row center">
			<h1>KIM4PARKJANG 그냥 고객센터</h1>
			<hr>
			<h3>이렇게 귀한곳에 누추한 고객님께서 편안하게 쇼핑하실 수 있도록 최선을 다하겠습니다.</h3>
			<br>
			<br>
			<br>
			<h1>1 2 3 4 . 1 2 3 4</h1>
			<br>
			<h3>OPEN : 10:00 - 17:00 / LUNCH : 12:30 - 13:30</h3>
			<br>
			<br>
			<button>상품/사이즈 문의</button>
			<button>지연 상품</button>
			<button>구매 후기</button>
			<button>공지사항</button>
		</div>
	</div>
	
	<div>
	<div class="row center">
		<h2>상품 문의</h2>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link-btn">글쓰기</a>
	</div>
	<div class="row center">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th width="55%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>11251</td>
					<td>[색상&사이즈]문의요</td>
					<td>아이유</td>
					<td>15:25:41</td>
				</tr>
				
				<tr>
					<td>11252</td>
					<td>[상품 관련]문의드려요^^</td>
					<td>루비똥</td>
					<td>14:25:17</td>
				</tr>
				
				<tr>
					<td>11253</td>
					<td>[상품 관련]문의에유.</td>
					<td>정연만세</td>
					<td>12:35:11</td>
				</tr>
				
				<tr>
					<td>11254</td>
					<td>[상품 관련]여기 좀 봐주세요. 문의입니다.</td>
					<td>장동현</td>
					<td>16:28:21</td>
				</tr>
				
				<tr>
					<td>11255</td>
					<td>[상품 관련]상품 문의.</td>
					<td>강아지</td>
					<td>19:25:45</td>
				</tr>
				
				<tr>
					<td>11256</td>
					<td>[색상&사이즈]사이즈 문의드려요.</td>
					<td>시계는와치와치</td>
					<td>14:25:41</td>
				</tr>
			</tbody>
		</table>
		
	</div>

<!-- 검색창  -->
	<div class="row right">
		<form action="list.jsp" method="get">
		
			<select name="column" class="form-input form-inline">
				<option value="board_title" selected>제목</option>
				<option value="board_content" selected>내용</option>
				<option value="board_wirter" selected>작성자</option>
				</select>
				
			<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input form-inline">
			<input type="submit" value="검색" class="form-btn form-inline">
			
		</form>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>