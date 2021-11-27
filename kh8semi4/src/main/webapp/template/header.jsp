<%@page import="semi.beans.BoardTypeDto"%>
<%@page import="semi.beans.BoardTypeDao"%>
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
	BoardTypeDao boardTypeDao = new BoardTypeDao();
	List<BoardTypeDto> boardTypeList = boardTypeDao.list();
%>

<%
	//로그인 상태인지 아닌지 판정하는 코드
	String id = (String)session.getAttribute("loginId");
	boolean login = id != null;
	//로그인 상태에 따라 슬라이드메뉴의 텍스트를 바꿔준다.
	String menuTitle = "";
	if(login){
		menuTitle = "회원 기능";
	} else{
		menuTitle = "비회원 기능";
	}
	
	
	//관리자인지 확인하는 코드
	String grade=(String)session.getAttribute("grade");
	boolean admin = grade != null && grade.equals("관리자");
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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/burgerking.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/linkstyle.css">
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/pagination.css">
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
        .one, .two{
        	position: absolute;
        }
        .one{
        	z-index: 1;
        }
        .two{
        	z-index:2;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/notice.css">
    <script>
    $(function(){
		$(".contents").find("li").click(function(e){
	        $(this).children("ol").slideToggle();
	        $(this).children("ol").css("display", "block");
		});
		$("#hamburger-btn").click(function(){
			var template = $("#shroud-template").html();
			$("body").append(template);
			$("#shroud").click(function(){
				$("#burgerking").attr("style","z-index: 9999; opacity: 0; display: none;");
				$(this).remove();
			});
			
			$("#burgerking").attr("style","z-index: 9999; opacity: 1; display: block;");
		});
    });
    </script>
</head>

<body>
    <!-- 가림막 템플릿 시작 -->
    <template id="shroud-template">
        <div id="shroud"
            style="background-color: rgb(34, 34, 34); position: fixed; inset: 0px; opacity: 1; z-index: 9998; cursor: pointer;">
        </div>
    </template>
    <!-- 가림막 템플릿 끝 -->


    <!-- 햄버거 메뉴 시작 -->
    <div id="burgerking" class="middle" style="z-index: 9999; opacity: 0; display: none;">
        <div class="container-1200">
            <div style="display:flex; justify-content: space-between;">
                <div class="left">
                	<ul style="display:flex">
                		<li>
                			&#9776;
                		</li>
                		<li>
                			ALL CATEGORY
 	               		</li>
                	</ul>
                </div>
                <div class="right">
                    <ul style="display:flex">
                        <li><a href="<%=request.getContextPath()%>/member/join.jsp">JOIN</a></li>
                        <li>I</li>
                        <li><a href="<%=request.getContextPath()%>/member/login.jsp">LOGIN</a></li>
                        <li>I</li>
                        <li><a href="<%=request.getContextPath()%>/myshop/order/basket.jsp">ORDER</a></li>
                    </ul>
                </div>
            </div>

            <div>
                <div>
                    <div style="display:flex;">
                    <%for(BigTypeDto bigType : bigTypeList){ %>
                        <ul>
                    		<li>
                    			<a style="" href="<%=request.getContextPath()%>/product/productlist.jsp?bigtypeno=<%=bigType.getNo()%>"><%=bigType.getName()%></a>
                        	</li>
                        	<%SmallTypeDao smallTypeDao = new SmallTypeDao();  %>
                            <%List<SmallTypeDto> smallTypeList = smallTypeDao.searchSmallType(bigType.getNo());%>
                            <%for(SmallTypeDto smalltype: smallTypeList){ %>    
                            <li>
                            	<a href="<%=request.getContextPath()%>/product/productlist.jsp?no=<%=smalltype.getNo()%>"><%=smalltype.getName()%></a>
                            </li>
                            <%} %>
                        </ul>
                    <%} %>
                		<ul>
   	                        <li>
   	                        	<a href="<%=request.getContextPath()%>/board/list.jsp?no=1">COMMUNITY</a>
                			</li>
                			<li>
                				<a href="<%=request.getContextPath()%>/board/review_list.jsp">review</a>
                			</li>
                			<%for(BoardTypeDto boardTypeDto : boardTypeList) {%>
                			<li>
                				<a href="<%=request.getContextPath()%>/board/list.jsp?no=<%=boardTypeDto.getNo()%>"><%=boardTypeDto.getName()%></a>
                			</li>
                			<%}%>
                		</ul>
                    </div>
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
                    <span id="hamburger-btn">&#9776;</span>
                </div>

                <div class="flex-equal center">
                    <a href="/kh8semi4"><img src="/kh8semi4/image/logo.png"></a>
                </div>

                <div class="flex-equal right">
             		  <%if(login) {%>
                	<span>[<%=session.getAttribute("loginId")%>]님</span>
                	<span>[<%=session.getAttribute("grade") %>]등급</span>
                	<%} %>
                </div>
                
                
            </div>
        </header>
        <!-- 헤더 끝 -->

		<!-- 네비게이션 시작 -->
		<nav>

			<ul class="slide-menu">
			<li><a href="<%=request.getContextPath()%>/product/productBset.jsp">Best</a>
				<%for(BigTypeDto bigType : bigTypeList){ %>
				<li><a
					href="<%=request.getContextPath()%>/product/productlist.jsp?bigtypeno=<%=bigType.getNo()%>"><%=bigType.getName()%></a>

					<ul>
						<%SmallTypeDao smallTypeDao = new SmallTypeDao();  %>
						<%List<SmallTypeDto> smallTypeList = smallTypeDao.searchSmallType(bigType.getNo());%>
						<%for(SmallTypeDto smalltype: smallTypeList){ %>
						<li><a
							href="<%=request.getContextPath()%>/product/productlist.jsp?no=<%=smalltype.getNo()%>"><%=smalltype.getName()%></a>
						<li>
							<%} %>
						
					</ul></li>

				<%} %>
				<li><a href="<%=request.getContextPath()%>/board/list.jsp?no=1">COMMUNITY</a>
					<ul>
						<li><a
							href="<%=request.getContextPath()%>/board/review_list.jsp">
								review </a></li>
						<%for(BoardTypeDto boardTypeDto : boardTypeList) {%>
						<li><a
							href="<%=request.getContextPath()%>/board/list.jsp?no=<%=boardTypeDto.getNo()%>"><%=boardTypeDto.getName()%></a>
						</li>
						<%}%>
					</ul></li>
					
                		<li><a href="#"><%=menuTitle%></a>
		                	<ul>
		                			<%if(login) {%>
		                		<li>
				                	<a href="<%=request.getContextPath()%>/myshop/index.jsp">마이페이지</a>
				                </li>
				                <li>
				                    <a href="<%=request.getContextPath()%>/myshop/order/basket.jsp">장바구니</a>
				                </li>
				                <li>
				                    <a href="<%=request.getContextPath()%>/member/logout.kj">로그아웃</a>
				                </li>
										<%if(session.getAttribute("grade").equals("관리자")){ %>
										<li>
											<a href="<%=request.getContextPath()%>/admin/adminmain.jsp">[관리자기능]</a>
										</li>										
										<%}%>
				                	<%} else {%>
				                <li>
				                		<a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a>
				                </li>
				                <li>
										<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
								</li>
									<%} %>
				
		                	</ul>
		                </li>
                	
					
			</ul>
			
		</nav>
		<!-- 네비게이션 끝 -->


		<!-- 섹션 시작 -->
        <section>
