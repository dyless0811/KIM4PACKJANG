<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="<%=request.getContextPath()%>/member/login.kj" method="post">
	
<div class="login">
    <div class="inner_login">
        <div class="login_tistory">
    			<div class="inp_text">
    			<h1>로그인</h1>
    			</div>
    			<fieldset>
                <legend class="screen_out">로그인 정보 입력폼</legend>
                <div class="box_login">
                    <div class="inp_text">
                    <label for="loginId" class="screen_out">아이디</label>
                    <input type="text" id="loginId" name="id" placeholder="ID" >
                    </div>
                    <div class="inp_text">
                    <label for="loginPw" class="screen_out">비밀번호</label>
                    <input type="password" id="loginPw" name="pw" placeholder="Password" >
                    </div>
                </div>
                <button class="btn_login" >로그인</button>
                <div class="login_append">
                    <div class="inp_chk"> <!-- 체크시 checked 추가 -->
                    <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                    <label for="keepLogin" class="lab_g">
            <span class="img_top ico_check"></span>
            <span class="txt_lab">로그인 상태 유지</span>
            </label>
                    </div>
                    <span class="txt_find">
                    <a href="./id/find_id.jsp" class="link_find">아이디</a>
                        / 
                    <a href="./pw/find_pw.jsp" class="link_find">비밀번호 찾기</a>
                    </span>
                </div>
                
                </fieldset>
          
            
        </div>
    </div>
</div>    

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>