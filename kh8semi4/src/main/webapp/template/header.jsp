<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KIM4PARKJANG</title>
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/layout.css">
<!-- <link rel="stylesheet" type="text/css" href="<%=root%>/resource/css/test.css">  -->
<style>

	.logo-wrapper {
		width:130px;
	}
	.logo-wrapper > img {
		width:100%;
		height:100%;
	}

</style>
</head>
<body>

<!-- 가림막 템플릿 시작 -->
<template>
<div style="background-color: rgb(34, 34, 34); position: fixed; inset: 0px; opacity: 1; z-index: 9998; cursor: pointer;"></div>
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
                    <ul>
                      	<li><a href="#BEST"><b>BEST</b></a></li>
                        <li><a href="#BASIC"><b>BASIC</b></a></li>
                        <li><a href="#SUIT"><b>SUIT</b></a></li>
                        <li><a href="#TRAINING"><b>TRAINING</b></a></li>
                    </ul>
                    <ul>
                        <li><a href="#OUTER"><b>OUTER</b></a></li>
						<li><a href="#블레이져">블레이져</a></li>
                        <li><a href="#코트">코트</a></li>
                        <li><a href="#패딩">패딩</a></li>
                    </ul>
                    <ul>
                        <li><a href="#KNIT"><b>KNIT</b></a></li>
						<li><a href="#니트">니트</a></li>
						<li><a href="#가디건">가디건</a></li>
                        <li><a href="#목폴라">목폴라</a></li>
                    </ul>
                    <ul>
                        <li><a href="#T-SHIRT"><b>T-SHIRT</b></a></li>
                        <li><a href="#긴팔티">긴팔티</a></li>
                        <li><a href="#맨투맨">맨투맨</a></li>
                        <li><a href="#후리스">후리스</a>
                    </ul>
                    <ul>
                        <li><a href="#SHIRT"><b>SHIRT</b></a></li>
                        <li><a href="#베이직 카라셔츠">베이직 카라셔츠</a></li> 
                        <li><a href="#반팔">반팔</a></li>
                    </ul>
                    <ul>
                        <li><a href="#PANTS"><b>PANTS</b></a></li>
                        <li><a href="#슬랙스">슬랙스</a></li>
                        <li><a href="#청바지">청바지</a></li>
                        <li><a href="#반바지">반바지</a></li>
                    </ul>
                    <ul>
                        <li><a href="#SHOES"><b>SHOES</b></a></li>
                        <li><a href="#스니커즈">스니커즈</a></li>
                    	<li><a href="#구두">구두</a></li>
                    </ul>
                    <ul>
                       	<li><a href="#ACCESSORY"><b>ACCESSORY</b></a></li>
                        <li><a href="#벨트">벨트</a></li>
                    	<li><a href="#모자">모자</a></li>
                    </ul>
                    <ul>
                       	<li><a href="#COMMUNITY"><b>COMMUNITY</b></a></li>
                      	<li><a href="#해피고객센터">해피고객센터</a></li>
                      	<li><a href="#입고지연상품">입고지연상품</a></li>
                 		<li><a href="#상품구매후기">상품구매후기</a></li>
                        <li><a href="#공지사항">공지사항</a></li>
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
			   	<a href="#마이페이지">마이페이지</a>
				<a href="#장바구니">장바구니</a>
				<a href="#검색">검색</a>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->	
	
	
	<!-- 네비게이션 시작 -->
	<nav>
		<ul class="slide-menu">
        	<li><a href="#BEST">BEST</a></li>
            <li><a href="#BASIC">BASIC</a></li>
            <li><a href="#SUIT">SUIT</a></li>
            <li><a href="#TRAINING">TRAINING</a></li>
            
 			<li>
 				<a href="#OUTER">OUTER</a>
            	<ul>                       
				<li><a href="#블레이져">블레이져</a></li>
                    <li><a href="#코트">코트</a></li>
                    <li><a href="#패딩">패딩</a></li>
            	</ul>
            </li>
            
            <li>
            	<a href="#KNIT">KNIT</a>
            	<ul>         
					<li><a href="#니트">니트</a></li>
					<li><a href="#가디건">가디건</a></li>
                    <li><a href="#목폴라">목폴라</a></li>
            	</ul>
            </li>
            
            <li>
            	<a href="#T-SHIRT">T-SHIRT</a>
            	<ul>
                    <li><a href="#긴팔티">긴팔티</a></li>
                    <li><a href="#맨투맨">맨투맨</a></li>
                    <li><a href="#후리스">후리스</a>
            	</ul>
            </li>
            
            <li>
            	<a href="#T-SHIRT">T-SHIRT</a>
                <ul>
                    <li><a href="#긴팔티">긴팔티</a></li>
                    <li><a href="#맨투맨">맨투맨</a></li>
                    <li><a href="#후리스">후리스</a>
                </ul>
            </li>
            
            <li>
            	<a href="#PANTS">PANTS</a>
            	<ul>
                    <li><a href="#슬랙스">슬랙스</a></li>
                    <li><a href="#청바지">청바지</a></li>
                    <li><a href="#반바지">반바지</a></li>
                </ul>
            </li>
            
            <li>
            	<a href="#SHOES">SHOES</a>
                <ul>
                    <li><a href="#스니커즈">스니커즈</a></li>
                	<li><a href="#구두">구두</a></li>
                </ul>
            </li>
            
            <li>
            	<a href="#ACCESSORY">ACCESSORY</a>
                <ul>
                    <li><a href="#벨트">벨트</a></li>
                	<li><a href="#모자">모자</a></li>    	
                </ul>
            </li>  
            
            <li>
            	<a href="#COMMUNITY">COMMUNITY</a>
            	<ul>
            		<li><a href="#해피고객센터">해피고객센터</a></li>
                  	<li><a href="#입고지연상품">입고지연상품</a></li>
             		<li><a href="#상품구매후기">상품구매후기</a></li>
                    <li><a href="#공지사항">공지사항</a></li>
                </ul>
            </li>  
		</ul>
	</nav>
	<!-- 네비게이션 끝 -->
	
	
	<!-- 섹션 시작 -->
	<section>