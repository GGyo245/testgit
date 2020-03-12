<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value='/resources/css/default.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/curd.css'/>">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="<c:url value="/resources/js/curd.js"/>"> </script> 
	<title>KL CURD</title>
</head>
<script>
	
	function homeTeamChange(){
		$('#insertHomePoint').remove();
		if($('#homeTeamChoice').val() == 'default'){
			var homePoint = '<div id="insertHomePoint">팀을 선택하세요</div>'
			$('#homeTeamBoard').append(homePoint);
		}else if($('#homeTeamChoice').val() ==$('#awayTeamChoice').val()){
			alert('같은 팀은 선택할 수 없습니다.');
			var homePoint = '<div id="insertHomePoint">다시 선택하세요</div>'
			$('#homeTeamBoard').append(homePoint);
		}else{
			var homePoint = '<input id="insertHomePoint" type="text" placeholder="점수를 입력하세요" onkeyup="insertHomePoint()"/>'
			$('#homeTeamBoard').append(homePoint);
		}
	}
	function awayTeamChange(){
		$('#insertawayPoint').remove();
		if($('#awayTeamChoice').val() == 'default'){
			var awayPoint = '<div id="insertawayPoint">팀을 선택하세요</div>'
			$('#awayTeamBoard').append(awayPoint);
		}else if($('#homeTeamChoice').val() == $('#awayTeamChoice').val()){
			alert('같은 팀은 선택할 수 없습니다.');
			var awayPoint = '<div id="insertawayPoint">다시 선택하세요</div>'
			$('#awayTeamBoard').append(awayPoint);
		}else{
			var awayPoint = '<input id="insertawayPoint" type="text" placeholder="점수를 입력하세요" onkeyup="insertAwayPoint()"/>'
			$('#awayTeamBoard').append(awayPoint);
		}
	}
	function insertHomePoint(){

		var ck = $('#insertHomePoint').val();
		
		if(isNaN(ck)){
			alert('숫자로만 입력하세요.')
			$('#insertHomePoint').remove();
			var homePoint = '<input id="insertHomePoint" type="text" placeholder="점수를 입력하세요" onkeyup="insertHomePoint()"/>'
			$('#homeTeamBoard').append(homePoint);
		}else{
			
		}
	}
	function insertAwayPoint(){
		var ck = $('#insertawayPoint').val();
		
		if(isNaN(ck)){
			alert('숫자로만 입력하세요.')
			$('#insertawayPoint').remove();
			var awayPoint = '<input id="insertawayPoint" type="text" placeholder="점수를 입력하세요" onkeyup="insertAwayPoint()"/>'
			$('#awayTeamBoard').append(awayPoint);
		}else{
			
			
		}
	}
	function addHomePlayer(){
	
		if($('#homeTeamChoice').val() == 'default'){
			alert("팀부터 선택하세요")
		}else{
			var hometeamname = $('#homeTeamChoice').val();
			
			$.ajax({
				url:"/teamRecord/playerList?teamName="+hometeamname+""
				,type:"post"
				,dateType:"json"
				,success : function(list){

					var str = '<select>'

					$(list).each(function(index,item){

						str += '<option value='+item.PLAYERNUM+'>'
						str += item.NAME
						str += '</option>'
							
					})
					str += '</select>'
					$('#homePlayers').append(str)
					$('#homePlayers').append('<input class="homeTeamGoals" type="text" placeholder="골 수 입력"><br/>')
					$('body').trigger( "create" );
				}
				,error : function() {
					alert("실패");
				}
			})
		}
	}
	function addAwayPlayer(){

		if($('#awayTeamChoice').val() == 'default'){
			alert("팀부터 선택하세요")
		}else{
			var awayteamname = $('#awayTeamChoice').val()
			
			$.ajax({
				url:"/teamRecord/playerList?teamName="+awayteamname+""
				,type:"post"
				,dateType:"json"
				,success : function(list){

					var str = '<select>'
					
					$(list).each(function(index,item){

						str += '<option value='+item.PLAYERNUM+'>'
						str += item.NAME
						str += '</option>'
							
					})
					str += '</select>'
					$('#awayPlayers').append(str);
					$('#awayPlayers').append('<input class="awayTeamGoals" type="text" placeholder="골 수 입력"><br/>')
					$('body').trigger( "create" );
				}
				,error : function() {
					alert("실패");
				}
			})
		}
	}
	function lastCheck(){
		
		var homegoal = $('#homePlayers > input');
		var homescore = parseInt($('#insertHomePoint').val());
		var hometotal = 0;
		
		for(let i = 0; i < homegoal.length; i++){
			hometotal += homegoal[i].value;
		}
		parseInt(hometotal);
		if(homescore != hometotal){
			alert('경기 점수와 선수들의 득점 총합이 일치하지 않습니다.')
			return false;
		}

		
		var awaygoal = $('#awayPlayers > input');
		var awayscore = parseInt($('#insertawayPoint').val());
		var awaytotal = 0;
		
		for(let i = 0; i < awaygoal.length; i++){
			awaytotal += awaygoal[i].value;
		}
		parseInt(awaytotal);
		if(awayscore != awaytotal){
			alert('경기 점수와 선수들의 득점 총합이 일치하지 않습니다.')
			return false;
		}
		return true;
	}

	function insertGame(){

		if(lastCheck()){
			var gamedate = $('#gameDate').val();
			var homescore = parseInt($('#insertHomePoint').val());
			var awayscore = parseInt($('#insertawayPoint').val());
			var hometeam = $('#homeTeamChoice').val();
			var awayteam = $('#awayTeamChoice').val();
			
			if(homescore > awayscore){
				$.ajax({
					url:"/gameRecord/updateWin?team="+hometeam+""
					,type:"post"
					,dataType:"json"
					,success: function(fg){
						if(fg){
							console.log('홈팀 승리 등록 완료');
						}else{
							console.log('홈팀 승리 등록 실패');
						}
					}
					,error : function() { alert ("실패") }
				})
				$.ajax({
					url:"/gameRecord/updateLose?team="+awayteam+""
					,type:"post"
					,dataType:"json"
					,success: function(fg){
						if(fg){
							console.log('어웨이팀 패 등록 완료');
						}else{
							console.log('어웨이팀 패 등록 실패');
						}
					}
					,error : function() { alert ("실패") }
				})
			}else if(homescore < awayscore){
				$.ajax({
					url:"/gameRecord/updateWin?team="+awayteam+""
					,type:"post"
					,dataType:"json"
					,success: function(fg){
						if(fg){
							console.log('어웨이팀 승리 등록 완료');
						}else{
							console.log('어웨이팀 승리 등록 실패');
						}
					}
					,error : function() { alert ("실패") }
				})
				$.ajax({
					url:"/gameRecord/updateLose?team="+hometeam+""
					,type:"post"
					,dataType:"json"
					,success: function(fg){
						if(fg){
							console.log('홈팀 패 등록 완료');
						}else{
							console.log('홈팀 패 등록 실패');
						}
					}
					,error : function() { alert ("실패") }
				})
			}else{
				alert('준비중');
			}
			
			var homeplayer = $('#homePlayers > select');
			var awayplayer = $('#awayPlayers > select');
			
			var homegoal = $('#homePlayers > input');
			var awaygoal = $('#awayPlayers > input');
		}else{
			console.log('테스트 통과 못함')
		}
	
		
	}
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
				<a class="navibtn" style="background-color:#a0a0a0; color:white;" id="now">경기관리</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.loginId != null}">
					<div class="col-xl-3 ml-auto col-12" id="navi2">
						<a href="/user/logout" class="navibtn2">로그아웃</a>
						<a href="/user/myPage" class="navibtn2" style="color: brown;">${sessionScope.loginNick} <span
								style="color:black;">님</span><i></i></a>
					</div>
				</c:when>
				<c:otherwise>
					<script>
						alert('권한이 없습니다.')
						location.href="/user/loginForm";
					</script>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<div class="container-xl container-fluid">
		<div class="row" id="mainground">
			<div class="col-12" style="margin-top: 5%"></div>
			<div class="col-xl-6 col-12 naviRecord" id="selectPlayer" onclick="teamChange()">
				<div>Player</div>
			</div>
			<div class="col-xl-6 col-12 naviRecord" id="selectGame" onclick="clickGame()">
				<div>Game</div>
			</div>
			

			<div class="col-12" id="GameTableBorder">
				<div class="text-center">
					<table id="gametable">
						<tr>
							<th colspan="4" style="color: red;">미완성 기능입니다.</th>
						</tr>
						<tr>
							<th colspan="2">Home</th>
							<th colspan="2">Away</th>
						</tr>
						<tr>
							<th>
								<select id="homeTeamChoice" class="gameTeamChoice" onchange="homeTeamChange()">
									<option value="default" selected="selected">home팀 선택</option>
									<option value="서울">서울</option>
									<option value="전북">전북</option>
									<option value="울산">울산</option>
									<option value="포항">포항</option>
									<option value="대구">대구</option>
									<option value="강원">강원</option>
									<option value="상주">상주</option>
									<option value="수원">수원</option>
									<option value="성남">성남</option>
									<option value="인천">인천</option>
									<option value="경남">경남</option>
									<option value="제주">제주</option>
								</select>
							</th>
							<th id="homeTeamBoard"><div id="insertHomePoint">팀을 선택하세요</div></th>
							<th id="awayTeamBoard"><div id="insertawayPoint">팀을 선택하세요</div></th>
							<th>
								<select id="awayTeamChoice" class="gameTeamChoice" onchange="awayTeamChange()">
									<option value="default" selected="selected">away팀 선택</option>
									<option value="서울">서울</option>
									<option value="전북">전북</option>
									<option value="울산">울산</option>
									<option value="포항">포항</option>
									<option value="대구">대구</option>
									<option value="강원">강원</option>
									<option value="상주">상주</option>
									<option value="수원">수원</option>
									<option value="성남">성남</option>
									<option value="인천">인천</option>
									<option value="경남">경남</option>
									<option value="제주">제주</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>
								<button onclick="addHomePlayer()">득점 추가</button>
							</th>
							<th id="homePlayers">
								
							</th>
							<th id="awayPlayers">
							</th>
							<th>
								<button onclick="addAwayPlayer()">득점 추가</button>
							</th>
						</tr>
						<tr>
							<th colspan="4">
								경기 날짜 : <input type="date" id="gameDate">
							</th>
						</tr>
					</table>
					<button onclick="insertGame()" class="btn btn-lg btn-primary btn-block" id="insertButton">등록</button>
				</div>
			</div>

			<div class="col-12" id="PlayerTableBorder">

				<select id="teamChoice" onchange="teamChange()">
					<option value="서울" selected="selected" style="height: 4.7%">서울</option>
					<option value="전북" style="height: 4.7%">전북</option>
					<option value="울산">울산</option>
					<option value="포항">포항</option>
					<option value="대구">대구</option>
					<option value="강원">강원</option>
					<option value="상주">상주</option>
					<option value="수원">수원</option>
					<option value="성남">성남</option>
					<option value="인천">인천</option>
					<option value="경남">경남</option>
					<option value="제주">제주</option>
				</select>
				<button id="insertPlayerButton" class="btn btn-outline-success" style="margin-bottom: 0.6%;" onclick="insertPlayer()">선수 등록</button>
				<table id="insertDate">
					<tr class="attribute">
						<td>이름</td>
						<td>생년월일</td>
						<td>데뷔</td>
						<td>은퇴</td>
						<th>수정</th>
					</tr>
				</table>
			</div>
			<form id="updatePlayer">
				<input id="name" name="name" type="hidden">
				<input id="birth" name="birth" type="hidden">
				<input id="debut" name="debut" type="hidden">
				<input id="retire" name="retire" type="hidden">
				<input id="pk" name="playernum" type="hidden">
			</form>
			
			<form id="insertPlayer">
				<input id="nameNew" name="name" type="hidden">
				<input id="teamNew" name="team" type="hidden">
				<input id="birthNew" name="birth" type="hidden">
				<input id="debutNew" name="debut" type="hidden">
				<input id="retireNew" name="retire" type="hidden">
			</form>
			
			<div class="col-12" id="lastLine">제작 SW-DO-Master 3기 박세훈 | 정보 출처 : K league | @KR Record<div
					style="padding-top: 4px;">dldmswjd7067@naver.com</div>
			</div>
		</div>
	</div>
</body>

</html>