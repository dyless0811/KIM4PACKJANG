<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 입력 : id (session) --%>
<%
	String id = (String)session.getAttribute("loginId");
%>

<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
    
<form action="edit.kj" method="post">
	
	<table border="0">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
					<input  readonly type="text" name="id" required value="<%=memberDto.getId()%>">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pw" required>
				</td>
			</tr>
			<tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pw" required>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input readonly type="text" name="name" required value="<%=memberDto.getName()%>">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="address" required value="<%=memberDto.getAddress()%>">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel" name="phone" value="<%=memberDto.getPhone()%>">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" value="<%=memberDto.getEmail()%>">
				</td>
			</tr>
			<tr>
			<th>생일<th>
				<td>
					<input type="date" name="birth" value="<%=memberDto.getBirth()%>">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
				</td>
			</tr>
		</tbody>
	</table>
	
</form>
    
    
    
    
<jsp:include page="/template/footer.jsp"></jsp:include>