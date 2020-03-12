<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePlayer</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<c:url value='/resources/js/updatePlayer.js'/>"></script>
</head>
<body>
	이름 : <input id="name" name="name" type="text"><br/>
	생년월일 : <input id="birth" name="birth" type="date"><br/>
	데뷔 : <input id="debut" name="debut" type="date"><br/>
	은퇴 : <input id="retire" name="retire" type="date"><br/>
	<input id="pk" name="playernum" type="hidden">
	<input type="button" style="width: 39.9%;margin-top: 1.5%;" onclick="sendDate()" value="수정"/><br/>
	※은퇴 정보는 입력하지 않을 시 현역선수로 등록됩니다.
</body>
</html>