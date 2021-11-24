<%@page import="java.time.LocalDate"%>
<%@page import="semi.vo.MemberAgeVo"%>
<%@page import="java.util.List"%>
<%@page import="semi.vo.PopularItemVo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.Format"%>
<%@page import="semi.beans.StatisticsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StatisticsDao statisticsDao = new StatisticsDao();
	Format d = new DecimalFormat("#,##0");
	List<PopularItemVo> itemList = statisticsDao.popularList();
	String m = "남 ", w = "여 ";
	int mCount = statisticsDao.memberGenderCount(m);
	int wCount = statisticsDao.memberGenderCount(w);
	int totalGender = mCount + wCount;
	
	//횐님덜 나이구하는 메소드
	List<MemberAgeVo> ageList = statisticsDao.memberAge();
	//계산을 위해 현재 년도 구해오기
	LocalDate now = LocalDate.now();
	int nowYear = now.getYear();

	//구간별 매출 검색을 했는지 확인을 위해 price파라미터를 검사
	String price = request.getParameter("price");
	//만약 price가 null이면 검사를 실시하지 않은것
	int termToTermPrice;
	if(price == null){
		//null이라면 그냥 금일 매출 메소드를 실행해서 찍어준다.
		termToTermPrice = statisticsDao.toDaySales();
	} else {
		termToTermPrice = Integer.parseInt(price);
	}
%> 
 
<jsp:include page="/template/header.jsp"></jsp:include>

<h1>통계 현황</h1>
<h2>금일 매출 : <%=d.format(statisticsDao.toDaySales())%>원</h2>
<h2>월별 매출 : <%=d.format(statisticsDao.toMonthSales())%>원</h2>
<h2>연간 매출 : <%=d.format(statisticsDao.toYearSales())%>원</h2>
<h2>구간별 매출 확인하기</h2>
<form action="convert.kj" method="post">
	시작일<input type="date" name="start">~ 종료일<input type="date" name="end">
	<input type="submit" value="검색">                      
</form>
<h2>구간별 매출 : <%=d.format(termToTermPrice)%>원</h2>
<h2>인기 상품</h2>
<table>
	<thead>
		<tr>
			<th>상품명</th>
			<th>팔린갯수</th>
		</tr>
	</thead>
	<tbody>
		<%for(PopularItemVo popular : itemList){ %>
		<tr>
			<td><%=popular.getItemName()%></td>
			<td><%=popular.getCount()%>개</td>
		</tr>
		<%} %>
	</tbody>
</table>
<h2>총 회원 수 : <%=d.format(statisticsDao.memberCount())%>명</h2>
<h2>총 방문자 수 : <%=d.format(statisticsDao.totalVisitantCount())%>명</h2>
<h2>금일 방문자 수 : <%=d.format(statisticsDao.todayVisitantCount())%>명</h2>
<h2>홈페이지 성 비율</h2>
<h2>남 : <%=d.format(mCount)%>명 / 여 : <%=d.format(wCount)%>명</h2>
<h2>횐님덜 나이</h2>
<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody>
		<%for(MemberAgeVo memberAge : ageList){ %>
		<tr>
			<td><%=memberAge.getMemberid()%></td>
			<td><%=nowYear - Integer.parseInt(memberAge.getYearBirth()) + 1%>세</td>
		</tr>
		<%} %>
	</tbody>
</table>
<h2>횐님덜 연령대 분포도</h2>
<h2>영유아(1~10세) : <%=d.format(statisticsDao.memberAgeGroup(1, 10))%>명</h2>
<h2>10대(10~19세) : <%=d.format(statisticsDao.memberAgeGroup(10, 19))%>명</h2>
<h2>20대(20~29세) : <%=d.format(statisticsDao.memberAgeGroup(20, 29))%>명</h2>
<h2>30대(30~39세) : <%=d.format(statisticsDao.memberAgeGroup(30, 39))%>명</h2>
<h2>40대(40~49세) : <%=d.format(statisticsDao.memberAgeGroup(40, 49))%>명</h2>
<h2>50대(50~59세) : <%=d.format(statisticsDao.memberAgeGroup(40, 49))%>명</h2>
<jsp:include page="/template/footer.jsp"></jsp:include>