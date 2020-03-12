<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/joinStyle.css"/>">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

  <title>Join</title>
</head>

<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <header class="header_logo">
          <div class="text-center">
            <h1 id="headLine" onclick='location.href="/"'>KL Record</h1>
          </div>
        </header>
        <div class="text-center">
          <h4 class="form-signin-heading" id="subheadLine">hellow</h4>
        </div>
        <form action="/user/join" name="Join" class="form-horizontal" method=POST
          onsubmit='return mysubmit()'>
          <div class="form group">
            <label for="inputName" class="sr-only">이름</label>
            <input name='name' type="text" id="inputName" class="form-control" placeholder="이름">
          </div><span id="nameMsg" class="warning"></span>

          <div class="form group">
            <label for="inputEmail" class="sr-only">이메일</label>
            <input name='email' type="text" id="inputEmail" class="form-control" placeholder="이메일">
          </div><span id="emailMsg" class="warning"></span>

          <div class="form group">
            <label for="inputNickName" class="sr-only">닉네임</label>
            <input name='nick' type="text" id="inputNickName" class="form-control" placeholder="닉네임">
          </div><span id="idMsg" class="warning"></span>

          <div class="form group">
            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input name='pw' type="password" id="inputPassword" class="form-control" placeholder="비밀번호">
          </div><span id="pwMsg" class="warning"></span>

          <div class="form group">
            <label for="inputPassword" class="sr-only">비밀번호 확인</label>
            <input name='pw2' type="password" id="inputPassword2" class="form-control" placeholder="비밀번호 확인">
          </div><span id="pwMsg2" class="warning"></span>

          <div class="form group">
            <button class="btn btn-lg btn-primary btn-block" type="submit" id="joinbtn">Join Now</button>
          </div>
        </form>
        <div class="text-right" id="tologin">
          <a href="/user/loginForm"><strong>로그인 창으로</strong></a>
        </div>
      </div>
      <div class="col-md-4"></div>
    </div>
  </div>

  <script src="<c:url value="/resources/js/joincheck.js"/>"></script>

</body>

</html>