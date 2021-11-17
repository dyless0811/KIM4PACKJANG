<%@page import="java.util.Arrays"%>
<%@page import="semi.beans.SmallTypeDao"%>
<%@page import="semi.beans.SmallTypeDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BigTypeDao"%>
<%@page import="semi.beans.BigTypeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	//타입 리스트 출력을 위한 dao, dto
	BigTypeDao bigTypeDao = new BigTypeDao();
	List<BigTypeDto> bigTypeList = bigTypeDao.list();
%>

<%
	//로그인 상태인지 아닌지 판정하는 코드
	String id = (String)session.getAttribute("loginId");
	boolean login = id != null;
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KIM4PARKJANG</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/commons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/layout.css">
    <!-- <link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/test.css">  -->
    <style>
        .logo-wrapper {
            width: 130px;
        }

        .logo-wrapper>img {
            width: 100%;
            height: 100%;
        }
        .contents > li > ol {
        	display: none;
        }
        .flexgrow{
        	flex-grow:1;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    $(function(){
	    $(".contents").find("li").click(function(e){
	        $(this).children("ol").slideToggle();
	        $(this).children("ol").css("display", "block");
	   });
    });
    </script>
</head>

<body>
    <!-- 가림막 템플릿 시작 -->
    <template>
        <div
            style="background-color: rgb(34, 34, 34); position: fixed; inset: 0px; opacity: 1; z-index: 9998; cursor: pointer;">
        </div>
    </template>
    <!-- 가림막 템플릿 끝 -->


    <!-- 햄버거 메뉴 시작 -->
    <div style="left: 60px; position: absolute; top: 129px; z-index: 9999; opacity: 0; display: none;">
        <div><span>Close</span></div>
        <div>
            <div>
                <div>ALL CATEGORY</div>
                <div>
                    <ul>
                        <li><a href="#JOIN">JOIN</a></li>
                        <li>I</li>
                        <li><a href="#LOGIN">LOGIN</a></li>
                        <li>I</li>
                        <li><a href="#ORDER">ORDER</a></li>
                    </ul>
                </div>
            </div>

            <div>
                <div>
                    <div>
                        <ul class="slide-menu">
                            <%for(BigTypeDto bigType : bigTypeList){ %>
                            <li><a href="#"><%=bigType.getName()%></a></li>
                            <ul>
                                <%SmallTypeDao smallTypeDao = new SmallTypeDao();  %>
                                <%List<SmallTypeDto> smallTypeList = smallTypeDao.searchSmallType(bigType.getNo());%>
                                <%for(SmallTypeDto smalltype: smallTypeList){ %>
                                <li>
                                    <a href="#"><%=smalltype.getName()%></a>
                                <li>
                                    <%} %>
                            </ul>
                            <%} %>
                        </ul>
                    </div>
                </div>
            </div>

            <div>
                <div>
                    <ul>
                        <li><a href="#인스타그램">인스타그램</a></li>
                        <li><a href="#페이스북">페이스북</a></li>
                        <li><a href="#카카오톡">카카오톡</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 햄버거메뉴 끝 -->

    <!-- 빠른 검색 시작 -->
    <div style="left: 94.5px; position: absolute; top: 360px; z-index: 9999; opacity: 0; display: none;">
        <div><span>Close</span></div>
        <form action="#search" method="get">
            <div>
                <input type="text" name="keyword" placeholder="" value=""><span>검색</span>
            </div>
        </form>
    </div>
    <!-- 빠른 검색 끝 -->


    <!-- 메인 시작 -->
    <main>

        <!-- 헤더 시작 -->
        <header>
            <div class="flex-container">
                <div class="flex-equal">
                    <span>&#9776;</span>
                </div>

                <div class="flex-equal center">
                    <a href="/kh8semi4"><img src="/kh8semi4/image/logo.png"></a>
                </div>

                <div class="flex-equal right">
                	<span>[<%=session.getAttribute("loginId")%>]님</span>
                	<%if(login) {%>
                	<a href="<%=request.getContextPath()%>/myshop/index.jsp">마이페이지</a>
                    <a href="<%=root%>/myshop/order/basket.jsp">장바구니</a>
                    <a href="<%=request.getContextPath()%>/member/logout.kj">로그아웃</a>
                    <a href="#검색">검색</a>
                	<%} else {%>
                	<a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a>
					<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
					<a href="#검색">검색</a>
					<%} %>
                </div>
                
                
            </div>
        </header>
        <!-- 헤더 끝 -->

        <!-- 네비게이션 시작 -->
        <nav>


            <ul class="slide-menu">
                <%for(BigTypeDto bigType : bigTypeList){ %>
                <li><a href="#"><%=bigType.getName()%></a>
                    <ul>
                        <%SmallTypeDao smallTypeDao = new SmallTypeDao();  %>
                        <%List<SmallTypeDto> smallTypeList = smallTypeDao.searchSmallType(bigType.getNo());%>
                        <%for(SmallTypeDto smalltype: smallTypeList){ %>
                        <li>
                            <a href="#"><%=smalltype.getName()%></a>
                        <li>
                        <%} %>
                    </ul>
                </li>
                <%} %>
                <li><a href="">COMMUNITY</a></li>
            </ul>

        </nav>
        <!-- 네비게이션 끝 -->


        <!-- 섹션 시작 -->
        <section>
