<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
%>
 <jsp:include page="/template/header.jsp"></jsp:include>
<form action="<%=root%>/member/login.kj" method="post">
<div class="container-400 container-center">	
		<div class="titleArea">
        	<h2>로그인</h2>
		</div>
		<div class="snapsync-form-wrapper">
        			<input type="text" name="id" placeholder="아이디" autocomplete="off" required>
        			<input type="password" name="pw" placeholder="비밀번호"required>
        			<%if(request.getParameter("error") != null){ %>
				<div class="row center">
						<h4 class="notice">로그인 정보가 일치하지 않습니다.</h4>
				</div>
					<%}%>
       				<button class="snap-sync-btn-submit">로그인</button>
        			
        			<ul class="snapsync-member-nav">
        				<li><a href="<%=root%>/member/id/find_id.jsp">아이디 찾기</a></li>
            			<li><a href="<%=root%>/member/pw/find_pw.jsp">비밀번호 찾기</a></li>
            			<li><a href="<%=root%>/member/join.jsp">회원가입</a></li>
          		</ul>
       	</div>
</div>    
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>