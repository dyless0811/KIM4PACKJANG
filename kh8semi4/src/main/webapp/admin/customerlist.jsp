<%@page import="semi.beans.MPagination"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%-- 출력 --%>
<%
	//회원 목록을 출력하는 코드(페이지네이션 적용)
	MPagination mP = new MPagination(request);
	mP.calculate();
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1200 container-center">
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>상태</th>
					<th>주문서관리</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto member : mP.getList()){ %>
				<tr>
					<td><%=member.getId()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getJoin()%></td>
					<td>
						<a href="./customerdetail.jsp?memberId=<%=member.getId()%>">수정</a>
						<a href="<%=request.getContextPath()%>/admin/quit.kj?memberId=<%=member.getId()%>">탈퇴</a>
					</td>
					<td><a href="./ordermanagement.jsp?memberId=<%=member.getId()%>">주문서확인</a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<!-- 페이지네이션 -->
	<div class="row center">
		<%if(mP.getStartBlock() > 1){ %>
			<%if(mP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="customerlist.jsp?column=<%=mP.getColumn()%>&keyword=<%=mP.getKeyword()%>&p=<%=mP.getStartBlock()-1%>">&lt;</a>
			<%} else { %>
			<!-- 목록용 링크 -->
			<a href="customerlist.jsp?p=<%=mP.getStartBlock()-1%>">&lt;</a>
			<%} %>
		<%} else { %>
		<a>&lt;</a>
		<%} %> 
	
		<%for(int i = mP.getStartBlock(); i <= Math.min(mP.getFinishBlock(),mP.getLastBlock()); i++){ %>
			<%if(mP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="customerlist.jsp?column=<%=mP.getColumn()%>&keyword=<%=mP.getKeyword()%>&p=<%=i%>"><%=i%></a>
			<%}else{ %>
			<!-- 목록용 링크 -->
			<a href="customerlist.jsp?p=<%=i%>"><%=i%></a>
			<%} %>
		<%} %>
	
		<%if(mP.getFinishBlock() < mP.getLastBlock()){ %>
			<%if(mP.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="customerlist.jsp?column=<%=mP.getColumn()%>&keyword=<%=mP.getKeyword()%>&p=<%=mP.getFinishBlock()+1%>">&gt;</a>
			<%} else { %>
			<!-- 목록용 링크 -->
			<a href="customerlist.jsp?p=<%=mP.getFinishBlock()+1%>">&gt;</a>
			<%} %> 
		<%} else {%>
		<a>&gt;</a>
		<%} %>
	</div>
	
	<div class="row center">
		<form action="customerlist.jsp" method="get">
		
			<select name="column" class="form-input form-inline">
				<%if(mP.columnIs("id")){ %>
				<option value="id" selected>아이디</option>
				<%}else{ %>
				<option value="id">아이디</option>
				<%} %>
				
				<%if(mP.columnIs("name")){ %>
				<option value="name" selected>닉네임</option>
				<%}else{ %>
				<option value="name">닉네임</option>
				<%} %>
				
				<%if(mP.columnIs("address")){ %>
				<option value="address" selected>주소</option>
				<%}else{ %>
				<option value="address">주소</option>
				<%} %>
			</select>
				
			<input type="search" name="keyword" placeholder="검색어 입력" required class="form-input form-inline">
			<input type="submit" value="검색" class="form-btn form-inline">
		</form>
	</div>
</div>








<jsp:include page="/template/footer.jsp"></jsp:include>
