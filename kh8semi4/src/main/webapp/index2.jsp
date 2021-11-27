<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
  *{margin:0;padding:0;}
  ul,li{list-style:none;}
  #slide{height:300px;position:relative;overflow:hidden;}
  #slide ul{width:400%;height:100%;transition:1s;}
  #slide ul:after{content:"";display:block;clear:both;}
  #slide li{float:left;width:25%;height:100%; animation:slide 8s infinite;}
  #slide li:nth-child(1){background:#faa; animation-delay:0s}
  #slide li:nth-child(2){background:#ffa; animation-delay:2s}
  #slide li:nth-child(3){background:#faF; animation-delay:4s}
  #slide li:nth-child(4){background:#aaf; animation-delay:6s}
  #slide input{display:none;}
  #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;
</style>
<div class="container-1400 container-center">
	<div id="slide">
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  <ul>
    <li><img src="/kh8semi4/image/banner1.jpg"  width="100%" height="100%"></li>
    <li><img src="/kh8semi4/image/center-1.jpg" width="100%" height="100%"></li>
    <li><img src="/kh8semi4/image/center-2.jpg" width="100%" height="100%"></li>
    <li><img src="/kh8semi4/image/center-3.jpg" width="100%" height="100%"></li>
  </ul>
  <p class="pos">
    <label for="pos1"></label>
    <label for="pos2"></label>
    <label for="pos3"></label>
    <label for="pos4"></label>
  </p>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
		