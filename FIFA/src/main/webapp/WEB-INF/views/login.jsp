<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="<c:url value='/resources/css/login.css'/>">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  
  <title>Login</title>
</head>

<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <header class="header_logo">
          <h1 class="text-center" id="logo" onclick='location.href="/"'>KL Record</h1>
        </header>
        <div>
          <div class="text-center">
            <h3 class="form-signin-heading" style="color:#1892ed">Welcome ddddd</h3>
          </div>

          <form action="/user/login" method="POST" class="form-signin action">
            <label for="inputEmail" class="sr-only">이메일</label>
            <input name="email" type="email" id="inputEmail" class="form-control" placeholder="이메일" required autofocus>
            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input name="pw" type="password" id="inputPassword" class="form-control" placeholder="패스워드" required>
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me"> 로그인 상태 유지
              </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit" id="loginbtn">로그인</button>
            <div id="errMsg" style="color:red; margin-top: 1%;"><c:if test="${errMsg != null}">${errMsg}</c:if></div>
          </form>
        </div>
        <br>
        <div class="text-center">
          <a href="#">아이디 찾기</a>｜
          <a href="#">비밀번호 찾기</a>｜
          <a href="/user/joinForm">회원가입</a>
        </div>
      </div>
      <div class="col-md-4"></div>
    </div>
  </div>

</body>

</html>