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
<script>
	//탈퇴 메세지
	$(function() {
		$(".confirm-link").click(function(e) {
			if (!confirm("정말 탈퇴하시겠습니까?")) {
				e.preventDefault();
			}
		});
	});
	//비밀번호 정규표현식
	$(function() {
		$("input[name=pw]").on("input", function() {
			var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
			var pw = $(this).val();
			$(this).removeClass("success").removeClass("fail");
			if (regex.test(pw)) {
				$("input[name=pw]").addClass("success");
				return true;
			} else {
				$("input[name=pw]").addClass("fail");
				return false;
			}
		});
	});
	//비밀번호 확인
	$(function(){
		$("input[name=pw2]").on("blur",function(){
			var pwInput = $("input[name=pw]").val();
			var pw2Input = $("input[name=pw2]").val();
			$(this).removeClass("success").removeClass("fail");
			if (pwInput.length > 0 && pwInput == pw2Input) {
				$("input[name=pw2]").addClass("success");
				return true;
			} else {
				$("input[name=pw2]").addClass("fail");
				return false;
			}
		});
	});
	
		//전화번호 정규표현식
		$(function() {
			$("input[name=phone]").on("input", function() {
				var regex = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
				var phone = $(this).val();
				$(this).removeClass("success").removeClass("fail");
				if (regex.test(phone)) {
					$("input[name=phone]").addClass("success");
					return true;
				} else {
					$("input[name=phone]").addClass("fail");
					return false;
				}
			});
		});
		//이메일 정규표현식
		$(function() {
			$("input[name=email]").on("input",function() {
				var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
				var email = $(this).val();
				$(this).removeClass("success").removeClass("fail");
				if (regex.test(email)) {
					$("input[name=email]").addClass("success");
					return true;
				} else {
					$("input[name=email]").addClass("fail");
					return false;
				}
			});
		});
		//생년월일 정규표현식
		$(function() {$("input[name=birth]").on("input",function() {
			var regex = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var birth = $(this).val();
			$(this).removeClass("success").removeClass("fail");
			if (regex.test(birth)) {
				$("input[name=birth]").addClass("success");
				return true;
			} else {
				$("input[name=birth]").addClass("fail");
				return false;
			}
		});
		
		$("form").submit(function(){
        	return 
        });
		
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

	<div class="container-400 container-center">
		<div class="titleArea">
        <h2>회원정보 수정</h2>
    </div>
		<div class="row">
			<label for="id">아이디</label>  
			<input type="text" name="id" required class="form-input"  autocomplete="off" id="id" value="<%=memberDto.getId()%>" readonly>
		</div>
		<div class="row">
			<label for="pw">비밀번호</label>
			<input type="password" name="pw" required class="form-input" id="pw">
			<span class="success"></span>
            <span class="fail">8~16자 이내 영문,숫자,특수문자로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="pw2">비밀번호 확인</label> 
			<input type="password"  name="pw2" required class="form-input" id="pw2">
			<span class="success"></span>
            <span class="fail">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="row">
			<label for="name">이름</label>
			<input type="text" name="name" required class="form-input" autocomplete="off" id="name" value="<%=memberDto.getName()%>" readonly>
		</div>
		<div class="row">
			<label for="address">주소</label>
			<input type="text" name="address" required class="form-input" value="<%=memberDto.getAddress()%>" readonly>
			<button type="button" class="find-address-btn snap-sync-btn-submit" style="width:30%" id="address">주소찾기</button>
		</div>
		<div class="row">
			<label for="phone">휴대전화</label>
			<input type="tel" name="phone" required class="form-input" id="phone" autocomplete="off" value="<%=memberDto.getPhone()%>">
			<span class="success"></span>
            <span class="fail">(-)포함  11자리로 작성하세요!</span>
		</div>
		<div class="row">
			<label for="email">이메일</label>
			<input type="text" name="email" required class="form-input" id="email" autocomplete="off" value="<%=memberDto.getEmail()%>">
			<span class="success"></span>
            <span class="fail">이메일 형식이 올바르지 않습니다.</span>
		</div>
		<div class="row">
			<label for="birth">생년월일</label>
			<input type="date" name="birth" required class="form-input" id="birth" autocomplete="off" value="<%=memberDto.getBirth()%>">
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
			<button class="snap-sync-btn-submit">수정</button>
		</div>

		<%if (request.getParameter("error") != null) {%>
		<div class="row center">
			<h4 class="error">비밀번호가 일치하지 않습니다</h4>
		</div>
		<%}%>
		
		<a href="<%=root%>/member/quit.kj?pw=<%=memberDto.getPw()%>" class="confirm-link">회원 탈퇴</a>
	
	</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>