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
                <img src="//www.bymono.com/web/upload/mg_img_new.jpg">
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
               <span id="xans_myshop_orderstate_shppied_before_count"><a href="<%=request.getContextPath()%>/myshop/order/basket.jsp"><%=myShopVo.getBasketCount() %></a></span>
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