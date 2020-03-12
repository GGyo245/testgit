<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Withdrawal</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		
	 	document.getElementById('userEmail').value = opener.document.getElementById('inputEmail').value;
		
	})
function sendDate(){
	
	opener.document.getElementById("deleteUserEmail").value = $('#userEmail').val();
	opener.document.getElementById("deleteUserPw").value = $('#userPw').val();

	opener.deleteUser();

	window.close();
}
</script>
</head>
<body>
	탈퇴 ID : <input id="userEmail" type="text" readonly="readonly"/><br/>
	PW입력 : <input id="userPw" type="password" placeholder="비밀번호 입력"><br/>
	<button onclick="sendDate()">탈퇴</button>
</body>
</html>