<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/resource/js/join.js" ></script>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
       .form-input.fail {
            border-color: red;
         }
        span.success {
            color:red;
            display: none;
        }
        span.fail {
            color:red;
            display: none;
        }
        .form-input.success ~ span.success { 
            display:block;
        }
        .form-input.fail ~ span.fail {
            display: block;
        }
</style>

<form action="<%=root%>/member/join.kj" method="post">

<div class="container-400 container-center">
	<div class="titleArea">
        <h2>마이 쇼핑</h2>
    </div>
	<hr>
		<div class="row">
			<label for="id">아이디</label> 
			<input type="text" name="id" required class="form-input" autocomplete="off" id="id"> 
			<span class="success"></span>
            <span class="fail">6~20자 이내 영문 소문자 + 숫자로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="pw">비밀번호</label>
			<input type="password" name="pw" required class="form-input" id="pw">
			<span class="success"></span>
            <span class="fail">8~16자 이내 영문,숫자,특수문자로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="pw2">비밀번호 확인</label>
			<input type="password" name="pw2" required class="form-input" id="pw2">
			<span class="success"></span>
            <span class="fail">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="row">
			<label for="name">이름</label>
			<input type="text" name="name" required class="form-input" autocomplete="off" id="name">
			<span class="success"></span>
            <span class="fail">2~17자 이내 한글로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="address">주소</label>
			<input type="text" name="address" required class="form-input " readonly autocomplete="off">
			<button type="button" class="find-address-btn snap-sync-btn-submit" style="width:30%" id="address">주소찾기</button>
		</div>
		<div class="row">
			<label for="phone">휴대전화</label>
			<input type="tel" name="phone" required class="form-input" id="phone" autocomplete="off">
			<span class="success"></span>
            <span class="fail">(-)포함  11자리로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="email">이메일</label> 
			<input type="text" name="email" required class="form-input" id="email" autocomplete="off">
			<span class="success"></span>
            <span class="fail">이메일 형식이 올바르지 않습니다.</span>
		</div>
		<div class="row">
			<label for="birth">생년월일</label>
			<input type="date" name="birth" required class="form-input" id="birth" autocomplete="off">
			<span class="success"></span>
            <span class="fail">생년월일 형식이 올바르지 않습니다.</span>
		</div>
		<div class="row" >
			<label>성별</label>
			<br>
			<select name="gender" style="width:22%">
				<option value="남" selected align="center">남자</option>
				<option value="여" align="center">여자</option>
			</select>
		</div>
		<div class="row">
			<button class="snap-sync-btn-submit">가입하기</button>
		</div>

</div>

</form>
<jsp:include page="/template/footer.jsp"></jsp:include>