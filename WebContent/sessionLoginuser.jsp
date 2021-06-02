<%--session 이용한 회원 로그인 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>

<%
	String memID = (String)session.getAttribute("memID");
	if(memID != null) {
%>
	<script language="JavaScript">
	alert("회원 로그인 되었습니다");
	location.href = "sessionLoginOK.jsp";
	</script>
<%} else{ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/tab.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/tab.js"></script>
<style type="text/css">
    @import url("css/login.css");
</style>
<title>Member Login</title>
</head>
<body>

	<div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    <p class="subtitle"><input type="image" src="image/l_culture.png"></p>
    <div class="menu"><strong>
        <a class="menu" href="mainAfLogin.jsp">영화</a>
        <a class="menu" href="reserv.jsp">예매</a>
        <a class="menu" href="theater.jsp">극장</a>
        <%if(memID != null) { %>
        	<a class="menu" href="mypage.jsp">마이페이지</a><br>
        	<p class="info"><%=memID%>님 환영합니다!
			<a href="sessionLogout.jsp">LOG OUT</a></p>
        	<%} 
        	else { %>
        <a class="menu" href="sessionLoginuser.jsp">로그인</a>
        <%} %>
    </div></strong>
    
    <div class="container">
		<button id="userlogin" onclick="location.href='sessionLoginuser.jsp'">로그인</button>
		<button id="adlogin" onclick="location.href='sessionLoginman.jsp'">관리자 로그인</button><hr>
		<br>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.<br><br>
            <form action="sessionLoginCheck.jsp" method="post">
                <input type="text" name="memID" placeholder="ID"><br>
                <input type="password" name="memPW" placeholder="PW"><br>
                <input type="submit" value="로그인">
            </form>
            or<br>
            <input type="button" value="회원가입" onClick="location.href='signup.jsp'"><br>
    <hr style="margin-top: 40px;";>
    </div>
</body>
</html>
</html>
<%}%>