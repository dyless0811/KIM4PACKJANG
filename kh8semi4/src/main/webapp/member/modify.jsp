<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- 입력 : id (session) --%>
<%
String id = (String) session.getAttribute("loginId");
%>

<%-- 처리 --%>
<%
MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.get(id);
%>



<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js%22%3E"></script>

<form action="<%=request.getContextPath()%>/member/edit.kj"
	method="post">

	<div class="container-800 container-center">
		<div class="row center">
			<h2>회원 정보 수정</h2>
		</div>
		<div class="row">
			<label>아이디</label> <input type="text" name="id" required
				class="form-input" autocapitalize="off"
				value="<%=memberDto.getId()%>" readonly>
		</div>
		<div class="row">
			<label>비밀번호</label> <input type="password" name="pw" required
				class="form-input">
		</div>
		<div class="row">
			<label>비밀번호 확인</label> <input type="text" value="임시방편 입력x" required
				class="form-input">
		</div>
		<div class="row">
			<label>이름</label> <input type="text" name="name" required
				class="form-input" value="<%=memberDto.getName()%>" readonly>
		</div>
		<div class="row">
			<label>주소</label> <input type="text" name="address" required
				class="form-input" value="<%=memberDto.getAddress()%>">
		</div>
		<div class="row">
			<label>휴대전화</label> <input type="tel" name="phone" required
				class="form-input" value="<%=memberDto.getPhone()%>">
		</div>
		<div class="row">
			<label>이메일</label> <input type="text" name="email" required
				class="form-input" value="<%=memberDto.getEmail()%>">
		</div>
		<div class="row">
			<label>생년월일</label> <input type="date" name="birth" required
				class="form-input" value="<%=memberDto.getBirth()%>">
		</div>
		<div class="row">
			<label>성별</label> <select name="gender">
				<option value="남" selected>남자</option>
				<option value="여">여자</option>
			</select>
		</div>
		<div class="row">
			<input type="submit" value="수정" class="form-btn">
		</div>

		<%
		if (request.getParameter("error") != null) {
		%>
		<div class="row center">
			<h4 class="error">비밀번호가 일치하지 않습니다</h4>
		</div>
		<%
		}
		%>
		
		<script>
       $(function(){
            $(".confirm-link").click(function(e){
                if(!confirm("정말 탈퇴하시겠습니까?")){
                   
                	e.preventDefault();
                }
            });
        });
    </script>
     <a href="<%=request.getContextPath()%>/member/quit.kj?id=&pw=<%=memberDto.getPw()%>" class="confirm-link">회원 탈퇴</a>
	</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>
