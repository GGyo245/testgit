<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>KL Record</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value='/resources/css/default.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/FIFAHome.css'/>">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<c:url value='/resources/js/FIFAHome.js'/>"></script>
</head>
<body>
	<div class="container-xl container-fluid">
		<div class="row">
			<div class="col-12"><img src="<c:url value='/resources/img/logo.png'/>" alt="logo" id="logo"></div>
			<div class="col-xl-9 col-12" id="navi1">
				<a class="navibtn" style="background-color:#a0a0a0; color:white;" id="now">경기</a>
				<a class="navibtn" href="/teamRecord/team">팀</a>
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
	<div class="container-xl container-fluid">
		<div class="row" id="mainground">
			<div class="col-12" style="margin-top: 5%"></div>
			<div class="col-xl-6 col-12 yearDays">
				<div class="yearDay">
					<a class="movebtn" onclick="Change(1)"><</a><a>&nbsp&nbsp</a><a id="selectYear">2019</a><a>년&nbsp&nbsp</a><a class="movebtn" onclick="Change(2)">></a>
				</div>
			</div>
			<div class="col-xl-6 col-12 yearDays">
				<div class="yearDay">
					<a class="movebtn" onclick="Change(3)"><</a><a>&nbsp&nbsp</a><a id="selectMonth">11</a><a>월&nbsp&nbsp</a><a class="movebtn" onclick="Change(4)">></a>
				</div>
			</div>
			
			<div class="col-12" style=" margin-top: 1%">
				<div style="text-align: right;">
					※ 홈 vs 어웨이 순으로 정렬됩니다.
				</div>
			</div>
			
			<div class="col-12" id="lastLine">제작 SW-DO-Master 3기 박세훈 | 정보 출처 : K league | @KR Record<div style="padding-top: 4px;">dldmswjd7067@naver.com</div></div>
		</div>
	</div>
</body>
</html>




