<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	//아이디 중복확인 Ajax
    $(function(){
    	$("input[name=id]").on("blur", function(){
    		var inputId = $("input[name=id]").val();
    		$.ajax({
    			url : "<%=request.getContextPath()%>/member/ajax_id_check.kj",
				type : "get",
				data : {//전송 시 첨부할 파라미터 정보
					id : inputId
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=id]").next().text("아이디가 이미 사용중입니다");
					}
				},
				error : function(err) {//통신이 실패했다.
				}
			});
		});
	});
	//아이디 검사식
	$(function() {
		$("input[name=id]").on("input", function() {
			var regex = /^[a-z][a-z0-9-_]{7,19}$/;
			var id = $(this).val();

			var span = $(this).next();

			if (regex.test(id)) {
				span.text("");
			} else {
				span.text("아이디는 8~20자 영문+숫자로 작성하세요");
			}
		});
	});
	//비밀번호 검사식
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
	//이름 검사식
	$(function() {
		$("input[name=name]").on("input", function() {
			var regex = /^[가-힣]{2,4}$/;
			var name = $(this).val();

			var span = $(this).next();

			if (regex.test(name)) {
				span.text("올바른 형식의 이름입니다");
			} else {
				span.text("이름은 한글2~4자 이내로 작성하세요");
			}
		});
	});
	//주소 검사식
	$(function() {
		$("input[name=address]").on("input", function() {
			var regex = /^[가-힣\s]+$/;
			var address = $(this).val();

			var span = $(this).next();

			if (regex.test(address)) {

			} else {
				span.text("다시입력바람");
			}
		});
	});
	//전화번호 검사식
	$(function() {
		$("input[name=phone]").on("input", function() {
			var regex = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

			var phone = $(this).val();

			var span = $(this).next();

			if (regex.test(phone)) {

			} else {
				span.text("전화번호는 01x-xxxx-xxxx로 작성하세요");
			}
		});
	});
	//이메일 검사식
	$(function() {
		$("input[name=email]")
				.on(
						"input",
						function() {
							var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

							var email = $(this).val();

							var span = $(this).next();

							if (regex.test(email)) {

							} else {
								span.text("이메일 형식이 올바르지 않습니다");
							}
						});
	});
	//생년월일 검사식
	$(function() {
		$("input[name=birth]")
				.on(
						"input",
						function() {
							var regex = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;

							var birth = $(this).val();

							var span = $(this).next();

							if (regex.test(birth)) {

							} else {
								span.text("생년월일을 선택하세요");
							}
						});
	});

	function pw2Check() {
		//비밀번호 확인은 비밀번호 입력창 2개가 필요하다.
		var pwInput = document.querySelector("input[name=pw]");
		var pw2Input = document.querySelector("input[name=pw2]");
		var notice = pw2Input.nextElementSibling;

		//비밀번호 일치 = 입력창이 비어있지 않고 두 비밀번호 입력값이 같은 경우
		if (pwInput.value.length > 0 && pwInput.value == pw2Input.value) {
			notice.textContent = "";
			return true;
		} else {
			notice.textContent = "비밀번호가 일치하지 않습니다";
			return false;
		}
	}
</script>

<form action="<%=request.getContextPath()%>/member/join.kj"
	method="post">

	<div class="container-400 container-center">
		<div class="row center">
			<h2>회원 가입</h2>
		</div>
		<hr>
		<div class="row left">
			<h4>기본 정보</h4>
		</div>
		<div class="row">
			<label>아이디</label> <input type="text" name="id" required
				class="form-input" autocapitalize="off"> <span>확인용</span>
		</div>
		<div class="row">
			<label>비밀번호</label> <input type="password" name="pw" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>비밀번호 확인</label> <input type="password" name="pw2" required
				class="form-input" onblur="pw2Check();">
			<div class="notice"></div>
		</div>
		<div class="row">
			<label>이름</label> <input type="text" name="name" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>주소</label> <input type="text" name="address" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>휴대전화</label> <input type="tel" name="phone" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>이메일</label> <input type="text" name="email" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>생년월일</label> <input type="date" name="birth" required
				class="form-input"> <span>확인용</span>
		</div>
		<div class="row">
			<label>성별</label> <select name="gender">
				<option value="남" selected>남자</option>
				<option value="여">여자</option>
			</select>
		</div>
		<div class="row">
			<input type="submit" value="가입" class="form-btn">
		</div>

	</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>