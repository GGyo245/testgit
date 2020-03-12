<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value='/resources/css/default.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="<c:url value='/resources/js/mypage.js'/>"></script>
</head>
<script>
	function deleteUserCheck(){
		if(confirm("정말 탈퇴하시겠습니까?\n(탈퇴 한 계정은 복구할 수 없습니다.)")){
			var popupX = (window.screen.width / 2) - (500 / 2);
			var popupY= (window.screen.height / 2) - (200 / 2);
			
			
			var openWin = window.open("/user/deleteUserCheck",
					"childForm", "width=500, height=200,left="+ popupX + ", top="+ popupY+",resizable = no, scrollbars = no");
		}
	}
	function deleteUser(){

		$.ajax({
			url:"/user/deleteUser"
			,type:"post"
			,data:$('#deleteUser').serialize()
			,success:function(fg){
				if(fg){
					alert("회원탈퇴 성공");
					location.href="/";
				}else{
					alert("회원탈퇴 실패\n(비밀번호를 확인해주세요.)");
				}
			}
			,error: function(){alert("실패")}
			
		})
		
	}
</script>
<script>

</script>
<body>
	<div class="container-xl container-fluid">
		<div class="row">
			<div class="col-12"><img src="<c:url value='/resources/img/logo.png'/>" alt="logo" id="logo"></div>
			<div class="col-xl-9 col-12" id="navi1">
				<a class="navibtn" href="/">경기</a>
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
					<script>
						alert('잘못된 요청')
						location.href="/";
					</script>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
	<div class="container-xl container-fluid">
		<div class="row" id="mainground">
			
		      <div class="col-12" id="myPageForm">
		      	<header>My Page</header>
		        <form action="/user/updateUser" name="Join" class="form-horizontal" method=POST
		          onsubmit='return mysubmit()'>
		          <div class="form group">
		            <label for="inputName" class="sr-only">이름</label>
		            <input name='name' type="text" id="inputName" class="form-control" readonly="readonly" value="${user.name}">
		          </div><span id="nameMsg" class="warning"></span>
		
		          <div class="form group">
		            <label for="inputEmail" class="sr-only" >이메일</label>
		            <input name='email' type="text" id="inputEmail" class="form-control" readonly="readonly" value="${user.email}">
		          </div><span id="emailMsg" class="warning"></span>
		
		          <div class="form group">
		            <label for="inputNickName" class="sr-only">닉네임</label>
		            <input name='nick' type="text" id="inputNickName" class="form-control" placeholder="${user.nick}">
		          </div><span id="idMsg" class="warning"></span>
		
		          <div class="form group">
		            <label for="inputPassword" class="sr-only">비밀번호</label>
		            <input name='pw' type="password" id="inputPassword" class="form-control" placeholder="변경하실 비밀번호">
		          </div><span id="pwMsg" class="warning"></span>
		
		          <div class="form group">
		            <label for="inputPassword" class="sr-only">비밀번호 확인</label>
		            <input name='pw2' type="password" id="inputPassword2" class="form-control" placeholder="변경하실 비밀번호 확인">
		          </div><span id="pwMsg2" class="warning"></span>
		
		          <div class="form group">
		            <button class="btn btn-lg btn-primary btn-block" type="submit" id="joinbtn">내 정보 수정</button>
		          </div>
		          <div class="text-right">
		        	  <a id="toDeleteUser" onclick="deleteUserCheck()">회원 탈퇴</a>
		     	  </div>
		        </form>
		          
		      </div>
			<form id="deleteUser">
				<input type="hidden" id="deleteUserEmail" name="email">
				<input type="hidden" id="deleteUserPw" name="pw">
			</form>
			<div class="col-12" id="lastLine">제작 SW-DO-Master 3기 박세훈 | 정보 출처 : K league | @KR Record<div
					style="padding-top: 4px;">dldmswjd7067@naver.com</div>
			</div>
		</div>
	</div>
	
	

  <script src="<c:url value="/resources/js/joincheck.js"/>"></script>
</body>
</html>