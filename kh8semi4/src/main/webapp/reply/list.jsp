<%@page import="semi.beans.ReplyListVo"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.ReplyDto"%>
<%@page import="semi.beans.ReplyDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%--입력 --%>

<%--처리 --%>

<% 
int p;
int psize=12;

try{
	p=Integer.parseInt(request.getParameter("p"));
	//강제예외
	if(p<0){
		throw new Exception();
	}
}catch(Exception e){
	p=1;
}

int end =p * psize;
int begin = end-(psize-1);
%>
p=<%=p%> begin=<%=begin %> end=<%=end%>

<% 
ReplyDao replyDao = new ReplyDao();
List<ReplyListVo> replyVoList = replyDao.listByReplyTime(begin, end);
int i = 0;

%>
<%--출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-1400 container-center">
    <div class="row flex-container">
    <%for(ReplyListVo replyListVo : replyVoList){ 
    	if(i % 4 == 0) {%>
    		</div>
    		<div class="row flex-container">
    	<%}%>
    		<div class="row flex-gro">
	    	<table class="table table-border table-hover">
		    	<tbody>
		    		<tr height="400px">
		    			<td>이미지영역</td>
		    		</tr>
		    		<tr>
		    			<td><%=replyListVo.getName()%><br><%=replyListVo.getPrice() %></td>
		    		</tr>
		    		<tr>
		    			<td><%=replyListVo.getStarpoint() %><br> <%=replyListVo.getReplyCount() %></td>
		    		</tr>
		    		<tr>
		    			<td>이미지, 리뷰들</td>
		    		</tr>
		    	</tbody>
		    </table>
    	</div>
    	<%i++; } %>
    </div>
</div>
<%i = 0; %>


<!-- 페이지네이션 -->


<jsp:include page="/template/footer.jsp"></jsp:include>