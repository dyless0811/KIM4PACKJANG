//주소 찾기   	
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

	//아이디 중복확인 Ajax
    $(function(){
    	$("input[name=id]").on("blur", function(){
    		var inputId = $("input[name=id]").val();
    		$.ajax({
    			url : "<%=root%>/member/ajax_id_check.kj",
				type : "get",
				data : {//전송 시 첨부할 파라미터 정보
					id : inputId
				},
				success : function(resp) {
					if (resp == "YESICAN") {//사용가능
					} else if (resp == "NONONO") {//사용불가능
						$("input[name=id]").next().text("아이디가 이미 사용중입니다.");
					}
				},
				error : function(err) {//통신이 실패했다.
				}
			});
		});
	});
	//핸드폰번호 중복확인 Ajax
    $(function(){
    	$("input[name=phone]").on("blur", function(){
    		var inputPhone = $("input[name=phone]").val();
    		$.ajax({
    			url : "<%=root%>/member/ajax_phone_check.kj",
				type : "get",
				data : {//전송 시 첨부할 파라미터 정보
					phone : inputPhone
				},
				success : function(resp) {
					if (resp == "YESICAN") {//사용가능
					} else if (resp == "NONONO") {//사용불가능
						$("input[name=phone]").next().text("사용중인 휴대폰번호입니다.");
					}
				},
				error : function(err) {//통신이 실패했다.
				}
			});
		});
	});
	//아이디 정규표현식
	$(function() {
		$("input[name=id]").on("input", function() {
			var regex = /^[a-z][a-z0-9-_]{5,19}$/;
			var id = $(this).val();
			$(this).removeClass("success").removeClass("fail");
			if (regex.test(id)) {
				$("input[name=id]").addClass("success");
			} else {
				$("input[name=id]").addClass("fail");
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
			} else {
				$("input[name=pw]").addClass("fail");
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
			} else {
				$("input[name=pw2]").addClass("fail");
			}
		});
	});
	//이름 정규표현식
	$(function() {
		$("input[name=name]").on("input", function() {
			var regex = /^[가-힣]{2,17}$/;
			var name = $(this).val();
			$(this).removeClass("success").removeClass("fail");
			if (regex.test(name)) {
				$("input[name=name]").addClass("success");
			} else {
				$("input[name=name]").addClass("fail");
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
			} else {
				$("input[name=phone]").addClass("fail");
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
			} else {
				$("input[name=email]").addClass("fail");
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
		} else {
			$("input[name=birth]").addClass("fail");
		}
	});
});