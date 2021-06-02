<%--관리자 메인 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mvBean" class="functions.MovieBean" />
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
	String adID = (String)session.getAttribute("adID");
	String memID = (String)session.getAttribute("memID");
	
	ArrayList<Movie> marr = mvBean.getMovieList();
%>
   <!-- logo -->
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='manager1.jsp'">
    </div>
    
    <p class="subtitle"><input type="image" src="image/l_manager.png"></p><br>
    <div class="menu"><strong>
        <a class="menu" href="manager1.jsp">1. 영화 등록</a>
        <a class="menu" href="manager2.jsp">2. 상영시간표 등록</a>
        <a class="menu" href="manager3.jsp">3. 예매현황조회</a><br>
        <br>관리자 <%= adID %> 님 환영합니다!
        <a href="sessionLogout.jsp">로그아웃</a>
    </div></strong><br>
    
    <div class="container"><br>
    	<form action="manage_lookUp.jsp" method="post">
            <div>
            	예매 현황 조회<br><br><br>
            	<select name="mno">
                  <option>영화 선택</option>
                        <%for(int i=0;i<marr.size();i++) { %>
                        <option value="<%=marr.get(i).getMno()%>"><%=marr.get(i).getTitle() %></option>
                        <% } %>
               </select><br><br>
               <input type="submit" value="조회하기">
            </div>
    	</form>
    </div>
    
</BODY>
</html>