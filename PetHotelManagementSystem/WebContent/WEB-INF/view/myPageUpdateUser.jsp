<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Font Icon -->
<link rel="stylesheet" href="/css/insert_css/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/css/insert_css/vendor/jquery-ui/jquery-ui.min.css">
<!-- Main css -->
<link rel="stylesheet" href="/css/insert_css/css/style.css">
<title>myPageUpdateUser</title>
</head>
<body>
  <header id="header">
    <h2>pethotel</h2>
    <nav>
      <ul>
        <div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
            <rect id="set_7_button1" height="50" width="120"></rect>
          </svg>
          <li id="set_7_text"><a href="#intro">LOGIN</a></li>
        </div>
        <div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
            <rect id="set_7_button3" height="50" width="120"></rect>
          </svg>
          <li id="set_7_text"><a href="#work">SERVICE</a></li>
        </div>
        <div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
            <rect id="set_7_button4" height="50" width="120"></rect>
          </svg>
          <li id="set_7_text"><a href="#contact">MY PAGE</a></li>
        </div>
        <div class="set_7_btn-wrapper"> <svg height="50" width="120" xmlns="#">
            <rect id="set_7_button5" height="50" width="120"></rect>
          </svg>
          <li id="set_7_text"><a href="#two">고객센터</a></li>
        </div>
      </ul>
    </nav>
  </header>
  <div class="main">

    <section class="signup">
      <div class="container">
        <div class="signup-content">
          <form action="/my/myPageUpdate" method="post" class="signup-form">
            <h1>회원정보수정</h1>

            <div class="form-row">
              <div class="form-group">
                <label for="id">id</label>
                <input type="text" class="form-input" name="uId" value="${user.uId }" readonly />
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-input" name="uPwd" title="비밀번호를 8자 이상 특수문자, 숫자를 포함해 주세요" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" placeholder="비밀번호를 다시 한번 입력해주세요"/>
              </div>
            </div>

            <div class="form-row">
              <div class="form-group">
                <label for="name">name</label>
                <input type="text" class="form-input" name="uName" value="${user.uName }" readonly />
              </div>
              <div class="form-group">
                <label for="re_password"> Email</label>
                <input type="text" class="form-input" name="uEmail" value="${user.uEmail }" readonly/>
              </div>
            </div>


          	 <div class="form-group">
              <label for="name">Phone number</label>
              <input type="text" class="form-input" name="uPhone" value="${user.uPhone }" readonly/>
            </div>

            <div class="form-row">
              <div class="form-group form-icon">
                <label for="uBirthStr">Birth date</label>
                <input type="text" class="form-input" name="uBirthStr" id="uBirthStr" value="${user.uBirth }"/>
              </div>
              <div class="form-group">
                <label for="re_password"> Gender</label>
                <input type="text" class="form-input" name="uGender" value="${user.uGender }" readonly/>
              </div>
            </div>
            <div class="form-group">
              <input type="submit" name="submit" id="join" class="form-submit" value="회원정보수정" />
            </div>
          </form>
        </div>
      </div>
    </section>


  </div>

<%-- 	<form action="/my/myPageUpdate" method="post">
		<input type="text" name="uNum" value="${user.uNum }" readonly>
		<input type="text" name="uId" value="${user.uId }" readonly>
		<input type="password" name="uPwd" placeholder="비밀번호를 다시 한번 입력해주세요">
		<input type="text" name="uName" value="${user.uName }">
		<input type="text" name="uGender" value="${user.uGender }" readonly>
		<input type="text" name="uPhone" value="${user.uPhone }" readonly>
		<input type="text" name="uEmail" value="${user.uEmail }" readonly>
		<input type="date" name="uBirthStr" value="${user.uBirth }">
		<input type="submit" value="수정">
	</form> --%>
	
  <!-- JS -->
  <script src="/css/insert_css/vendor/jquery/jquery.min.js"></script>
  <script src="/css/insert_css/vendor/jquery-ui/jquery-ui.min.js"></script>
  <script src="/css/insert_css/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="/css/insert_css/vendor/jquery-validation/dist/additional-methods.min.js"></script>
  <script src="/css/insert_css/js/main.js"></script>	
</body>
</html>