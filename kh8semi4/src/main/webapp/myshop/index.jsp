<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@page import="semi.beans.MemberTotalPriceVo"%>
<%@page import="semi.beans.MyshopVo"%>
<%@page import="semi.beans.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.ProductDao"%>
<%@page import="semi.beans.MemberDto"%>
<%@page import="semi.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
Format d = new DecimalFormat("#,##0");
%>
<%-- 입력 : 현재 로그인한 회원ID - String id --%>
<%
String id = (String)session.getAttribute("loginId");
%>
<%-- 처리 --%>
<%
//로그인된 회원 정보 단일 조회
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(id);
	MyshopVo myShopVo = memberDao.getMyShopVo(memberDto.getId());
	MemberTotalPriceVo memberTotalPriceVo = memberDao.MemberTotalPrice(id);
%>
<style>
.titleArea {
    min-height: 30px;
    margin: 50px 0 20px;
    border-bottom: 0;
    text-align: center;
}
.ec-base-box.typeMember .information {
    display: table;
    table-layout: fixed;
    padding: 10px 0;
    width: 100%;
    box-sizing: border-box;
}
.ec-base-box.typeMember .information > .title, .ec-base-box.typeMember .information > .thumbnail {
    display: table-cell;
    padding: 0 15px;
    width: 70px;
    text-align: center;
    vertical-align: middle;
}
.ec-base-box.typeMember .information .description {
    display: table-cell;
    padding: 0 10px;
    width: auto;
    line-height: 1.5em;
    border-left: 1px solid #e8e8e8;
    vertical-align: middle;
}
  .ec-base-box {
    padding: 20px;
    margin-left: auto;
    margin-right: auto;
    border: 5px solid #e8e8e8;
    color: #404040;
}
/*여기까지가 마이쇼핑 스타일*/
.xans-myshop-asyncbankbook {
    overflow: hidden;
    padding: 15px 0px 15px 0px;
    margin: 20px auto 0 auto;
    border: 1px solid #dedede;
    border-top: 1px solid #000;
    background: #fff;
}
.xans-myshop-asyncbankbook ul {
    float: right;
    width: 240px;
}
.xans-myshop-asyncbankbook .title {
    float: left;
    width: 40%;
    font-weight: normal;
    box-sizing: border-box;
}
.xans-myshop-asyncbankbook ul li {
    float: left;
    margin: 5px 0;
    padding: 0 45px;
    width: 100%;
    height: 20px;
    font-size: 12px;
    line-height: 1.6;
    vertical-align: top;
    box-sizing: border-box;
}
/*여기까지가 마이페이지 스타일*/  
#myshopMain {
    margin: 30px 0 0;
}
#myshopMain .shopMain:hover {
    border: 1px solid #999;
}
#myshopMain .shopMain {
    float: left;
    width: 18%;
    height: 265px;
    margin: 0 1% 20px 1%;
    padding: 40px 15px;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
    text-align: center;
}
#myshopMain .shopMain h3 {
    position: relative;
    font-size: 12px;
    color: #333;
    font-weight: normal;
}
#myshopMain .shopMain h3 strong {
    font-size: 18px;
}
사용자 에이전트 스타일시트
strong {
    font-weight: bold;
}
#myshopMain .shopMain h3 span {
    display: block;
    padding: 6px 0 0;
}
#myshopMain .shopMain p a {
    font-size: 12px;
    line-height: 18px;
    color: #8f8f8f;
}
#myshopMain .shopMain h3 a {
    display: block;
    padding: 0 0 25px;
}
a, a:hover {
    text-decoration: none;
}
/*여기까지가 마이페이지 메뉴 스타일*/
.xans-myshop-orderstate {
            margin: 20px auto 0;
            border: 1px solid #dedede;
            border-top: 1px solid #353535;
            width: 100%;
        }
        .xans-myshop-orderstate .title {
    padding: 11px 21px;
    margin: 0;
    border-bottom: 1px solid #e9e9e9;
    background: #f6f6f6;
}
.xans-myshop-orderstate .state {
    overflow: hidden;
    padding: 19px 0;
}
.xans-myshop-orderstate .order li {
    float: left;
    width: 25%;
    padding: 0 0 4px;
    margin: 0 -1px 0 0;
    border-right: 1px dotted #c9c7ca;
    text-align: center;
}
.xans-myshop-orderstate .order li strong {
    display: block;
    margin: 2px 0 7px;
    font-size: 14px;
    color: #353535;
}
.xans-myshop-orderstate .desc em, .xans-myshop-orderstate .cs .count, .xans-myshop-orderstate .order .count {
    color: #111;
}
.xans-myshop-orderstate .order .count {
    font-weight: bold;
    font-size: 24px;
    color: #008bcc;
    
}
/*여기까지가 배송상태 스타일*/
</style>
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-1300 container-center">
		
<!-- 마이 쇼핑 자리 -->
	<div class="titleArea">
        <h2>마이 쇼핑</h2>
    </div>
    
    <div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
        <div class="ec-base-box typeMember gMessage ">
        <div class="information">
            <p class="thumbnail">
                <img src="//www.bymono.com/web/upload/mg_img_new.jpg" alt="" onerror="this.src='//img.echosting.cafe24.com/skin/base/member/img_member_default.gif';">
            </p>
            <div class="description">
                <span>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong>
                <span><span><%=memberDto.getName()%></span>
                </span></strong> 님은 <strong>[<span>
                </span><span>NEW</span>
                <span> / 배송비 무료</span>]
                </strong><%=memberDto.getGrade() %>이십니다.</span>
            </div>
            </div>
        </div>
     
	<!-- 마이페이지 자리 -->		
	<div class="xans-element- xans-myshop xans-myshop-asyncbankbook"><div>
		<h2>MY <span>PAGE</span>
</h2>
<p>마이페이지</p>
		
	</div>
<ul>
<li>
            <strong class="title">가용적립금</strong>
            <strong class="data use">&nbsp;<span id="xans_myshop_bankbook_avail_mileage"><%=d.format(memberDto.getPoint())%>P</span></strong>
       </li>
       <li>
            <strong class="title">총 주문 : </strong>
            <strong class="data"><span id="xans_myshop_bankbook_order_price"><%=d.format(memberTotalPriceVo.getMemberTotal())%>원</span></strong>
        </li>
         </ul>
</div>		
</div>			
<!-- 주문현황 자리 -->	
<div class="xans-element- xans-myshop xans-myshop-orderstate "><div class="title">
        <h3>나의 주문처리 현황 <span class="desc">(최근 <em>3개월</em> 기준)</span>
</h3>
    </div>
<div class="state">
        <ul class="order">
<li>
                <strong>장바구니</strong>
               <span id="xans_myshop_orderstate_shppied_before_count"><%=myShopVo.getBasketCount() %></span>
            </li>
            <li>
                <strong>배송전</strong>
                <span id="xans_myshop_orderstate_shppied_standby_count"><%=myShopVo.getReadyCount() %></span>
            </li>
            <li>
                <strong>배송중</strong>
                <span id="xans_myshop_orderstate_shppied_begin_count"><%=myShopVo.getShippingCount() %></span>
            </li>
            <li>
                <strong>배송완료</strong>
                <span id="xans_myshop_orderstate_shppied_complate_count"><%=myShopVo.getBoughtCount() %></span>
            </li>
        </ul>

</div>
</div>

<!-- 메뉴 자리 -->	
<div id="myshopMain" class="xans-element- xans-myshop xans-myshop-main"><ul>
    <li class="shopMain order">
                <h3><a href="<%=root%>/myshop/order/list.jsp?"><strong>Order</strong><span>주문내역 조회</span></a></h3>
                <p><a href="<%=root%>/myshop/order/list.jsp?">고객님께서 주문하신 상품의<br>주문내역을 확인하실 수 있습니다.</a></p>
            </li>
            <li class="shopMain profile">
                <h3><a href="<%=root%>/member/modify.jsp"><strong>Profile</strong><span>회원 정보</span></a></h3>
                <p><a href="<%=root%>/member/modify.jsp">회원이신 고객님의 개인정보를<br> 관리하는 공간입니다.</a></p>
            </li>
            <li class="shopMain wishlist">
                <h3><a href="<%=root%>/myshop/wish_list.jsp"><strong>Wishlist</strong><span>관심 상품</span></a></h3>
                <p><a href="<%=root%>/myshop/wish_list.jsp">관심상품으로 등록하신<br> 상품의 목록을 보여드립니다.</a></p>
            </li>
         	<li class="shopMain board">
                <h3><a href="<%=root%>/myshop/board/myboard.jsp?memberId=<%=id%>"><strong>Board</strong><span>게시물 관리</span></a></h3>
                <p><a href="<%=root%>/myshop/board/myboard.jsp?memberId=<%=id%>">고객님께서 작성하신 게시물을<br> 관리하는 공간입니다.</a></p>
            </li>
            
                </ul>
    </div>
</div>		
				
				
	

<jsp:include page="/template/footer.jsp"></jsp:include>