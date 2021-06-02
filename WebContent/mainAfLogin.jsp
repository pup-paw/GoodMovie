<%--로그인 전, 후 메인페이지. 영화 목록 나열되어 있음 mainBfLogin.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<jsp:useBean id="mvBean" class="functions.MovieBean" />

<!DOCTYPE html>
<html>
<%
   request.setCharacterEncoding("UTF-8");   
   ArrayList<Movie> marr = mvBean.getMovieList();
   String memID = (String)session.getAttribute("memID");
%>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/gallery.css">
    <title>영화좋다 메인 페이지</title>
</head>

<body> 
    <!-- logo -->
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    
    <p class="subtitle"><input type="image" src="image/l_movie.png"></p>
    <div class="menu"><strong>
        <a class="menu" href="mainAfLogin.jsp">영화</a>
        <a class="menu" href="reserv.jsp">예매</a>
        <a class="menu" href="theater.jsp">극장</a>
        <%--로그인 전엔 로그인, 후엔 마이페이지 띄우기 --%>
        <%if(memID != null) { %>
        	<a class="menu" href="mypage.jsp">마이페이지</a><br>
        	<p><%=memID%>님 환영합니다!
			<a href="sessionLogout.jsp">LOG OUT</a></p>
        	<%} 
        	else { %>
        <a class="menu" href="sessionLoginuser.jsp">로그인</a>
        <%} %>
    </div></strong>
	
	<div class="container">
    <div><%--데이터베이스에 있는 만큼의 영화 목록 띄우기 --%>
        <%for(int i=0;i<4;i++)  {
           %>
        <div class="gallery">
        	<div class="no">No.<%=i+1%></div>
            <form action="movieDetail.jsp" method="post">
            
               <button type="submit" class="poster2" name="mno" value="<%=marr.get(i).getMno()%>">
                  <input type="image" class="poster" src="image/<%=marr.get(i).getMno() %>.jpg" width="200" height="300" >
               </button>
            </form>
            
            <div class="desc"><br>
                <strong><%=marr.get(i).getTitle()%></strong><br>
               	<%=marr.get(i).getStrDate() %> 개봉<br><br>
                <a class="book" href="reservation.html">예매</a>
            </div>
        </div>
    </div>
<%} %>
        
    </div>

</body>

</html>