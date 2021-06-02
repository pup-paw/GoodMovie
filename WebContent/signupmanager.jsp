<%--관리자 회원가입 페이지. 회원가입 성공시 로그인페이지로 이동, 실패시 회원가입 페이지 다시 로드 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <link rel="stylesheet" href="css/tab.css"><style type="text/css">
    	@import url("css/signup.css");
	</style>
   <title>관리자 회원가입</title>
</head>
<body>
   <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    <p class="subtitle"><input type="image" src="image/l_culture.png"></p><br>
    <div class="menu"><strong>
        <a href="mainAfLogin.jsp">영화</a>
        <a href="reserv.jsp">예매</a>
        <a href="theater.jsp">극장</a>
        <a href="sessionLogin.jsp">로그인</a>
    </div></strong>
	
	<div class="container">
       		 관리자 회원가입<br><br>
        
            <form action="signupCheckAd.jsp" method="post">
                <div>
                    <label for="adID"><b>아이디</b></label><br>
                    <input class="signup" type="text" placeholder="아이디를 입력하세요" name="adID" required><br><br>
            
                    <label for="adPW"><b>비밀번호</b></label><br>
                    <input class="signup" type="password" placeholder="비밀번호를 입력하세요" name="adPW" required><br><br>

                    <label for="adName"><b>이름</b></label><br>
                    <input class="signup" type="text" placeholder="이름을 입력하세요" name="adName" required><br><br>

                    <label for="adno"><b>사원번호</b></label><br>
                    <input class="signup" type="text" placeholder="사원번호를 입력하세요" name="adno" required><br><br>
					
					<br>
                    <input type="submit" value="회원가입">
                </div>
            </form>
        
     </div>
</body>
</html>