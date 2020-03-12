<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Record</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value='/resources/css/default.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/team.css'/>">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value='/resources/js/team.js'/>"></script>
</head>
<body>
	<div class="container-xl container-fluid">
		<div class="row">
			<div class="col-12"><img src="<c:url value='/resources/img/logo.png'/>" alt="logo" id="logo"></div>
			<div class="col-xl-9 col-12" id="navi1">
				<a class="navibtn" href="/">경기</a>
				<a class="navibtn" style="background-color:#a0a0a0; color:white;" id="now">팀</a>
				<a class="navibtn" href="/goalRecord/goal">골</a>
				<a class="navibtn" onclick="alert('미구현 기능입니다.')">랭킹</a>
				<a class="navibtn" href="/management/curd">경기관리</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.loginId != null}">
					<div class="col-xl-3 ml-auto col-12" id="navi2">
						<a href="/user/logout" class="navibtn2">로그아웃</a>
						<a href="/user/myPage" class="navibtn2" style="color: brown;">${sessionScope.loginNick} <span style="color:black;">님</span><i></i></a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-xl-3 ml-auto col-12" id="navi2">
						<a href="/user/joinForm" class="navibtn2">회원가입</a>
						<a href="/user/loginForm" class="navibtn2">로그인<i></i></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 년도 컨테이너로 ajax적용 -->
	<div class="container-xl container-fluid">
		<div class="row" id="mainground">
			<div class="col-12" style="margin-top: 5%"></div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('강원')">
				<div class="team">
					<img alt="강원" src="<c:url value="/resources/img/teamlogo/강원.png"/>">
					<div class="teamNames">강원</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('경남')">
				<div class="team">
					<img alt="경남" src="<c:url value="/resources/img/teamlogo/경남.png"/>">
					<div class="teamNames">경남</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('대구')">
				<div class="team">
					<img alt="대구" src="<c:url value="/resources/img/teamlogo/대구.png"/>">
					<div class="teamNames">대구</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('상주')">
				<div class="team">
					<img alt="상주" src="<c:url value="/resources/img/teamlogo/상주.png"/>">
					<div class="teamNames">상주</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('서울')">
				<div class="team">
					<img alt="서울" src="<c:url value="/resources/img/teamlogo/서울.png"/>">
					<div class="teamNames">서울</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('성남')">
				<div class="team">
					<img alt="성남"  src="<c:url value="/resources/img/teamlogo/성남.png"/>">
					<div class="teamNames">성남</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('수원')">
				<div class="team">
					<img alt="수원" src="<c:url value="/resources/img/teamlogo/수원.png"/>">
					<div class="teamNames">수원</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('울산')">
				<div class="team">
					<img alt="울산" src="<c:url value="/resources/img/teamlogo/울산.png"/>">
					<div class="teamNames" >울산</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('인천')">
				<div class="team">
					<img alt="인천" src="<c:url value="/resources/img/teamlogo/인천.png"/>">
					<div class="teamNames">인천</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('전북')">
				<div class="team">
					<img alt="전북" src="<c:url value="/resources/img/teamlogo/전북.png"/>">
					<div class="teamNames">전북</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('제주')">
				<div class="team">
					<img alt="제주" src="<c:url value="/resources/img/teamlogo/제주.png"/>">
					<div class="teamNames">제주</div>
				</div>
			</div>
			<div class="col-xl-1 col-2 teams" onclick="teamClick('포항')">
				<div class="team">
					<img alt="포항" src="<c:url value="/resources/img/teamlogo/포항.png"/>">
					<div class="teamNames">포항</div>
				</div>
			</div>
			
			<div class="col-12" id="middleLine" style="margin-top: 5%"></div>
			
			<div class="col-xl-6 col-12 teamInfo" id="playerSelect" onclick="teamClick($('#now2 > .team').text())">
				<div>선수단</div>
			</div>
			<div class="col-xl-6 col-12 teamInfo" id="teamSelect" onclick="teamInfoClick($('#now2 > .team').text())">
				<div>팀정보</div>
			</div>
			 <div class="col-12" id="tableborder">
			 	<H1 style="text-align: center; margin: 15%; font-size: xx-large;">팀 로고를 클릭하여 정보를 확인해보세요.</H1>
			 </div>
			<div class="col-12" id="lastLine">제작 SW-DO-Master 3기 박세훈 | 정보 출처 : K league | @KR Record <div style="padding-top: 4px;">dldmswjd7067@naver.com</div></div>
		</div>
	</div>
</body>
</html>