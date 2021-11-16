<%@page import="semi.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	//회원 목록을 출력하는 코드
	MemberDao memberDao = new MemberDao();
	List<MemberDto> memberList = memberDao.list();
%>

<div class="container-900 container-center">
	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>가입일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
			<%for(MemberDto member : memberList){ %>
				<tr>
					<td><%=member.getId()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getJoin()%></td>
					<td>
						<a href="./customerdetail.jsp?memberId=<%=member.getId()%>">수정</a>
						<a href="#">탈퇴</a>
					</td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</div>








<jsp:include page="/template/footer.jsp"></jsp:include>
