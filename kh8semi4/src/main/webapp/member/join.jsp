<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
function pwCheck(){
    var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
    var input = document.querySelector("input[name=pw]");
    //var notice = document.querySelector("input[name=memberPw] + .notice");
    var notice = input.nextElementSibling;

    if(regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
        return false;
    }
}
    //아이디 중복확인 Ajax
    $(function(){
    	$("input[name=id]").on("blur", function(){
    		
    		var inputId = $("input[name=id]").val();
    		
    		$.ajax({
    			url : "<%=request.getContextPath()%>/member/ajax_id_check.kj",
    			type:"get",
    				data:{//전송 시 첨부할 파라미터 정보
                        id : inputId
    				},
    				success:function(resp) {
    					if(resp =="YESICAN") {
    						$("input[name=id]").next().text("아이디 사용 가능");
    					} 
    					else if(resp == "NONONO") {
    						$("input[name=id]").next().text("아이디가 이미 사용중입니다");
    				}
    				},
    				error:function(err){//통신이 실패했다.
                        
                    }	
    	});
    		
    	});
    });
    

function pw2Check(){
    //비밀번호 확인은 비밀번호 입력창 2개가 필요하다.
    var pwInput = document.querySelector("input[name=pw]");
    var pw2Input = document.querySelector("input[name=pw2]");
    var notice = pw2Input.nextElementSibling;

    //비밀번호 일치 = 입력창이 비어있지 않고 두 비밀번호 입력값이 같은 경우
    if(pwInput.value.length > 0 && pwInput.value == pw2Input.value){
        notice.textContent = "";
        return true;
    }
    else{
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
				class="form-input" autocapitalize="off"> 
				<span></span>
		</div>
		<div class="row">
			<label>비밀번호</label> <input type="password" name="pw" required
				class="form-input">
		</div>
		<div class="row">
			<label>이름</label> <input type="text" name="name" required
				class="form-input">
		</div>
		<div class="row">
			<label>주소</label> <input type="text" name="address" required
				class="form-input">
		</div>
		<div class="row">
			<label>휴대전화</label> <input type="tel" name="phone" required
				class="form-input">
		</div>
		<div class="row">
			<label>이메일</label> <input type="text" name="email" required
				class="form-input">
		</div>
		<div class="row">
			<label>생년월일</label> <input type="date" name="birth" required
				class="form-input">
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