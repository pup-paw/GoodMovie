<%--영화 상세페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="TicketingBean" class="functions.TicketingBean" scope="request" />
<%
	request.setCharacterEncoding("UTF-8");
   	String memID = (String)session.getAttribute("memID"); //session을 통해 로그인 되어있는 회원 아이디를 가져옴
   	DBcinema.connect();
   	String mno = request.getParameter("mno"); //이전 페이지에서 mno를 가져옴
   	System.out.println(request.getParameter("mno"));
   	ResultSet rs = DBcinema.selectMovie(mno); //movie 테이블에서 mno의 값을 가지고 있는 정보를 가져옴
%>
<!DOCTYPE html>
<html>

<head>
    <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/star.css">
    <link href="css/movie_detail.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <title>
   <%
      try {
         while(rs.next()) {
            rs.getString("title");
         }
      } catch(Exception e) {
         System.out.println("exception");
      }
   %>상세
   </title>
   
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
        <%if(memID != null) { %> <!-- memID가 null이 아니면 -->
        	<!-- 마이페이지 표시 -->
        	<a class="menu" href="mypage.jsp">마이페이지</a><br>
        	<p><%=memID%>님 환영합니다!
			<a href="sessionLogout.jsp">LOG OUT</a></p>
        	<%} 
        	else { %> <!-- memID가 null이면 -->
        	<!-- 로그인 페이지 표시 -->
        <a class="menu" href="sessionLoginuser.jsp">로그인</a>
        <%} %>
    </div></strong>
   
        <div class="container">
        
            <!-- 영화 정보 출력 div -->
            <div class="movie_poster">
            <!-- mno.jpg로 저장되어 있는 영화 포스터를 불러옴 -->
                <img src="image/<%=mno%>.jpg" alt="영화포스터" width="200"> 
            </div>
            <div class="movie_detail">
                 <%
                 	//타이틀, 현재 상영중, 예매
                    rs = DBcinema.selectMovie(mno); //movie 테이블에서 mno값을 갖는 정보를 가져옴
                    try{
                       while(rs.next()) { //rs의 끝까지
                          %>
                          <h1><%=rs.getString("title") %>
                          <img src="image/screening.png" alt="현재상영중" width="80px"><br></h1>
                          <a class="book" href="reserv.jsp">예매</a><br><br><hr>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception1");
                    }
                    //개봉일
                    rs = DBcinema.selectMovie(mno); 
                    try {
                       while(rs.next()) {
                          %>
                          개봉 : <%=rs.getDate("strDate") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception2");
                    }
                    //평점
                    rs = DBcinema.selectMovie(mno);
                    try {
                       while(rs.next()) {
                          %>
                          평점 : <%=rs.getDouble("avgScore") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception3");
                    }
                    //장르
                    rs = DBcinema.selectMovie(mno);
                    try {
                       while(rs.next()) {
                          %>
                          장르 : <%=rs.getString("genre") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception4");
                    }
                    //러닝타임
                    rs = DBcinema.selectMovie(mno);
                    try {
                       while(rs.next()) {
                          %>
                          러닝타임 : <%=rs.getInt("runtime") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception5");
                    }
                    //감독
                    rs = DBcinema.selectMovie(mno);
                    try {
                       while(rs.next()) {
                          %>
                          감독 : <%=rs.getString("director") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception6");
                    }
                    
                    //내용
                    rs = DBcinema.selectMovie(mno);
                    try {
                       while(rs.next()) {
                          %>
                          정보 : <%=rs.getString("summary") %><br>
                          <%
                       }
                    } catch(Exception e) {
                       System.out.println("exception7");
                    }
                 %>
            </div>
            <hr><br>
            <!-- 리뷰 작성 div -->
        	<form action="review.jsp" method="post">
        	<div class="review">
        	<%if(memID == null){%> <!-- memID가 null이면 -->
           	<div class="review_up">
           		리뷰를 남기시려면 로그인이 필요합니다!!!<br><br>
            	<img src="image/profile.png" alt="아이디이미지" width="90">
            </div>
        	<%} else{%> <!-- memID가 null이 아니면 -->
            <div class="review_up">
            	<div class="profile">           		
                	<img src="image/profile.png" alt="아이디이미지" width="90">
                	<strong><%=memID %></strong>
            	</div>
            	<div class="review_contents">
            		<input type="text" id="star" placeholder="평점을 입력해주세요 " name="score"><br>
            		<textarea id="com" placeholder="감상평을 남겨주세요" name="reContent"></textarea><br>
                	<input type="submit" id="submit" value=" 등록 ">
            	</div>
            </div>
        	
        	<%} %>
        	</form>
        	</div>
        	<div class="printreview">
        	<!-- 리뷰 출력 div -->
        	<h2>다른 회원들의 리뷰</h2>
			<% 
        	rs = DBcinema.selectReContent(mno); //mno 값을 갖는 리뷰를 가져옴
                    try {
                       while(rs.next()) {
                          String rv = rs.getString("reContent");
                          if(rv.equals("아직 리뷰가 입력되지 않았습니다.")!=true) {
                          %>
                    <%=rs.getString("memID") %> :  <%=rs.getString("reContent") %><br><br>
                          <%
                          }
                       }
                    } catch(Exception e) {
                       System.out.println("exception8");
                    } %>
        	</div><br><br><br>
        </div>

</body>
</html>