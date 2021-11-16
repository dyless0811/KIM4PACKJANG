<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>


<%
	//회원 아이디를 저장한다
	String memberId = request.getParameter("memberId");
	//회원 상세정보를 가져오기 위한 코드
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>
<form action="memberedit.kj" method="post">
<div class="container-500 container-center">
	<div class="row center">
		<h2><%=memberDto.getId()%>님의 개인정보</h2>
	</div>
	<div class="row">
		<label>아이디</label>
		<input type="hidden" value="<%=memberDto.getPw()%>" name="pw">
		<input type="text" readonly value="<%=memberDto.getId()%>" class="form-input" name="id">
	</div>
	<div class="row">
		<label>닉네임</label>
		<input type="text" value="<%=memberDto.getName()%>" class="form-input" name="name">
	</div>
	<div class="row">
		<label>주소</label>
		<input type="text" value="<%=memberDto.getAddress()%>" class="form-input" name="addr">
	</div>
	<div class="row">
		<label>전화번호</label>
		<input type="text" value="<%=memberDto.getPhone()%>" class="form-input" name="phone">
	</div>
	<div class="row">
		<label>이메일</label>
		<input type="email" value="<%=memberDto.getEmail()%>" class="form-input" name="email">
	</div>
	<div class="row">
		<label>생년월일</label>
		<input type="date" value="<%=memberDto.getBirth()%>" class="form-input form-inline" name="birth">
	</div>
	<div class="row">
		<label>가입일</label>
		<input type="text" readonly value="<%=memberDto.getJoin()%>" class="form-input">
	</div>
	<div class="row">
		<label>포인트 현황(point)</label>
		<input type="text" readonly value="<%=memberDto.getPoint()%>" class="form-input">
	</div>
	<div class="row">
		<label>등급</label>
		<input type="text" value="<%=memberDto.getGrade()%>" class="form-input" name="grade">
	</div>
	<div class="row">
		<label>성별</label>
		<input type="text" value="<%=memberDto.getGender()%>" class="form-input" name="gender">
	</div>
	<div class="row right">
		<input type="submit" value="수정하기" class="form-btn form-inline">
	</div>
</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>