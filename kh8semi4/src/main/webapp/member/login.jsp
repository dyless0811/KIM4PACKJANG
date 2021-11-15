<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h1>회원 로그인</h1>

<form action="<%=request.getContextPath()%>/member/login.kj" method="post">
	<table border="0">
		<tbody>
				<tr>
					<th>아이디</th>
					<td>
							<input type="text" name="id" required>
					</td>
				</tr>
				<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pw" required>
				</td>
			</tr>
		</tbody>	
		<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
<%if(request.getParameter("error") != null){ %>
	<h5>
		<font color="red">로그인 정보가 일치하지 않습니다</font>
	</h5>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>