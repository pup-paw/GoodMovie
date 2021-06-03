<%--관리자 메인 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 페이지</title>
<style type="text/css">
@import url("css/tab.css");
@import url("css/manager.css");
</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/location.js"></script>
<script src="js/tab.js"></script>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#datepicker").datepicker();
   });
</script>

</HEAD>
<BODY>
<%
	request.setCharacterEncoding("UTF-8");

	String adID = (String)session.getAttribute("adID"); //session에서 로그인 되어있는 관리자 아이디 가져오기
	String memID = (String)session.getAttribute("memID"); //session에서 로그인 되어있는 회원 아이디 가져오기
%>
   <!-- logo -->
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='manager1.jsp'">
    </div>
    
    <p class="subtitle"><input type="image" src="image/l_manager.png"></p><br>
    <!-- 메뉴 -->
    <div class="menu"><strong>
        <a class="menu" href="manager1.jsp">1. 영화 등록</a>
        <a class="menu" href="manager2.jsp">2. 상영시간표 등록</a>
        <a class="menu" href="manager3.jsp">3. 예매현황조회</a><br>
        <br>관리자 <%= adID %> 님 환영합니다!
        <a href="sessionLogout.jsp">로그아웃</a>
    </div></strong><br>
    
    <!-- 관리자 영화 등록 -->
    <div class="container"><br>
            <form action="manage_movie.jsp" method="post"> <!-- 제출시 manage_movie로 이어짐 -->
                <div>
                    <label><b>영화 번호</b></label><br>
                    <input type="text" class="text" name="mno"><br>
					<label><b>제목</b></label><br>
                    <input type="text" class="text" name="title"><br>
                    <label><b>감독</b></label><br>
                    <input type="text" class="text" name="director"><br>
                    <label><b>장르</b></label><br>
                    <input type="text" class="text" name="genre"><br>
                    <label><b>줄거리</b></label><br>
                    <input type="text" class="text" name="summary"><br>
                    <label><b>러닝타임</b></label><br>
                    <input type="text" class="text" name="runtime"><br>
                    <label><b>상영시작일</b></label><br>
                    <input type="date" class="text" name="strDate" value="2021-06-01"/><br>
                    <label><b>상영종료일</b></label><br>
                    <input type="date" class="text" name="endDate" value="2021-06-08"/><br>
                    
                    <br><br>
					<input type="submit" value="영화 등록하기">
           
                </div>
            </form>
    </div>
</BODY>
</html>