<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<h1>회원가입</h1>

	<form action="join.kj" method="post">
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
		<tr>
			<th>이름</th>
			<td>
					<input type="text" name="name" required>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
					<input type="text" name="address" required>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
					<input type="tel" name="phone" required>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
					<input type="text" name="email" required>
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
					<input type="date" name="birth" required>
			</td>
		</tr>
		
	</tbody>
	</table>
		성별 : 
		<select name="gender">
			<option value="남" selected>남자</option>
			<option value="여" >여자</option>
		</select>	
			<input type="submit" value="가입">
			
	</form>
	
<jsp:include page="/template/footer.jsp"></jsp:include>