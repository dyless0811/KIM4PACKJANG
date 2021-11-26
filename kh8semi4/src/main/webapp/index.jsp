<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
  <style>
    *{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 16s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 4);height:300px;}

    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
  </style>
<div class="container-1500 container-center">
	<div class="slide">
	    <ul>
	      <li><img src="/kh8semi4/image/banner1.jpg"  width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/center-1.jpg" width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/center-2.jpg" width="100%" height="100%"></li>
	      <li><img src="/kh8semi4/image/center-3.jpg" width="100%" height="100%"></li>
	    </ul>
	  </div>
</div>
  
  <div class="container-1500 container-center">
   <div class="center">
   	<img src="/kh8semi4/image/BEST.png">
   </div>	
  </div>
 <hr style="color:navy;">



<jsp:include page="/template/footer.jsp"></jsp:include>
			