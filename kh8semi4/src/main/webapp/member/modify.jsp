<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>	
<%-- 입력 : id (session) --%>
<%
	String id = (String) session.getAttribute("loginId");
%>
<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(id);
%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.notice {
	color: red;
}
</style>
<script>
	//탈퇴 메세지
	$(function() {
		$(".confirm-link").click(function(e) {
			if (!confirm("정말 탈퇴하시겠습니까?")) {
				e.preventDefault();
			}
		});
	});
	//비밀번호 확인
	$(function(){
		$("input[name=pw2]").on("input",function(){
			var pwInput = $("input[name=pw]").val();
			var pw2Input = $("input[name=pw2]").val();
			var span = $(this).next();
			if (pwInput.length > 0 && pwInput == pw2Input) {
				span.text("");
			} else {
				span.text("비밀번호가 일치하지 않습니다");
			}
		});
	});
	//비밀번호 정규표현식
	$(function() {
		$("input[name=pw]").on("input", function() {
			var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
			var pw = $(this).val();
			var span = $(this).next();
			if (regex.test(pw)) {
				span.text("");
			} else {
				span.text("비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요");
			}
		});
	});
	$(function(){
		$(".find-address-btn").click(function(){
		    findAddress();
			});
	function findAddress(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ""; // 주소 변수
		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
		                    addr = data.roadAddress + " (" + data.bname + ")";
		                }
		                else{
		                    addr = data.roadAddress;
		                }
		            } 
		            else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            
		            //$("input[name=postcode]").val(data.zonecode);
		            document.querySelector("input[name=address]").value = addr;
		            //$("input[name=address]").val(addr);
		            // 커서를 상세주소 필드로 이동한다.
		            
		            //$("input[name=detailAddress]").focus();
		        }
		    }).open();
		};
		});
</script>

<%-- 출력 --%>


<form action="<%=root%>/member/edit.kj" method="post">

	<div class="container-800 container-center">
		<div class="row center">
			<h2>회원 정보 수정</h2>
		</div>
		<div class="row">
			<label>아이디</label> 
			<input type="text" name="id" required class="form-input" autocapitalize="off" value="<%=memberDto.getId()%>" readonly>
		</div>
		<div class="row">
			<label>비밀번호</label>
			<input type="password" name="pw" required class="form-input">
			<span class="notice"></span>
		</div>
		<div class="row">
			<label>비밀번호 확인</label> 
			<input type="password"  name="pw2" required class="form-input">
			<span class="notice"></span>
		</div>
		<div class="row">
			<label>이름</label>
			<input type="text" name="name" required class="form-input" value="<%=memberDto.getName()%>" readonly>
		</div>
		<div class="row">
			<label>주소</label>
			<input type="text" name="address" required class="form-input" value="<%=memberDto.getAddress()%>" readonly>
			<button type="button" class="find-address-btn form-btn form-inline">주소찾기</button>
		</div>
		<div class="row">
			<label>휴대전화</label>
			<input type="tel" name="phone" required class="form-input" value="<%=memberDto.getPhone()%>">
		</div>
		<div class="row">
			<label>이메일</label>
			<input type="text" name="email" required class="form-input" value="<%=memberDto.getEmail()%>">
		</div>
		<div class="row">
			<label>생년월일</label>
			<input type="date" name="birth" required class="form-input" value="<%=memberDto.getBirth()%>">
		</div>
		<div class="row">
			<label>성별</label>
			<select name="gender">
				<option value="남" selected>남자</option>
				<option value="여">여자</option>
			</select>
		</div>
		<div class="row">
			<input type="submit" value="수정" class="form-btn">
		</div>

		<%if (request.getParameter("error") != null) {%>
		<div class="row center">
			<h4 class="error">비밀번호가 일치하지 않습니다</h4>
		</div>
		<%}%>
		
		<a href="<%=root%>/member/quit.kj?pw=<%=memberDto.getPw()%>"class="confirm-link">회원 탈퇴</a>
	
	</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>