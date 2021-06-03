<!-- mypage.jsp -->
<%--session 이용한 회원 로그인 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<%
   request.setCharacterEncoding("utf-8");
   String memID = (String)session.getAttribute("memID"); //session에서 로그인 되어있는 회원 ID를 가져옴

   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.selectTicketing(memID); //ticketing 테이블 중 memID로 예매된 정보를 select 함
   rs.last(); //rs의 가장 끝으로 감
   int cnt = rs.getRow(); //rs의 개수를 가져옴
   String[] enno = new String[cnt]; //등록번호 배열을 만듬(rs의 개수 만큼)
   int i = 0;
   rs = DBcinema.selectTicketing(memID); //ticketing 테이블 중 memID로 예매된 정보를 select 함
   try {
      while(rs.next()) { //rs에 다음 정보가 있으면 enno 배열에 rs의 등록번호 저장
         enno[i] = rs.getString("enno"); 
         i++;
      }
   } catch(Exception e) {
      System.out.println("exception");
   }
   String[] mno = new String[cnt]; //영화번호 배열을 만듬(rs의 개수 만큼)
   i = 0;
   ResultSet rs2; 
   try {
      for(i=0; i<cnt; i++) {
         rs2 = DBcinema.selectMovieScreening(enno[i]); //movieScreening 테이블에서 현재 enno에 해당하는 정보를 가져옴
         try {
            while(rs2.next()) {
               mno[i] = rs2.getString("mno"); //mno 배열에 select된 movieScreening 테이블의 정보 중 mno를 가져옴
               System.out.println(mno[i]);
            }
         } catch(Exception e) {
            System.out.println("excption!");
         }
      }
   } catch(Exception e) {
      System.out.println("exception0");
   }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
@import url("css/mypage.css");
</style>

<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>마이페이지</title>
  
</head>
<body>
<%
   if(memID == null){ //session을 통해 불러온 memID가 null이면
   %><script language="JavaScript">
   alert("로그인이 필요합니다!"); //로그인이 필요하다는 경고창을 띄움
   location.href = "sessionLogin.jsp"; //로그인 페이지로 이동
   </script>
<%} else {%>
   <!-- logo -->
    <div class="logo">
       <input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    
    <!-- 메뉴 -->
    <p class="subtitle"><input type="image" src="image/l_culture.png"></p>
    <div class="menu"><strong>
        <a class="menu" href="mainAfLogin.jsp">영화</a>
        <a class="menu" href="reservation.html">예매</a>
        <a class="menu" href="theater.jsp">극장</a>
        <%--로그인 전엔 로그인, 후엔 마이페이지 띄우기 --%>
        <%if(memID != null) { %>
        <!-- memID가 null이 아니면 마이페이지로 이동 -->
           <a class="menu" href="mypage.jsp">마이페이지</a><br>
           <p><%=memID%>님 환영합니다!
         <a href="sessionLogout.jsp">LOG OUT</a></p> 
           <%} 
           else { %>
           <!-- memID가 null이면 로그인 페이지로 이동 -->
        <a class="menu" href="sessionLoginuser.jsp">로그인</a>
        <%} %>
    </div></strong>
    
    <div class="container">
    <input type="image" src="image/bgticket.gif">
   <div class="meminform"><h1><%=memID%>님 안녕하세요!</h1><br>
      고객님은 현재 <b>RED</b> 등급 입니다. 
   </div><br><br>
   
   <!-- 로그인 되어있는 회원이 본 영화 목록을 보여줌 -->
   <div class="watch"><strong>내가 본 영화</strong></div><br>
   <div class="inform">
   <form action="movieDetail.jsp" method="post">
   <%for(int j=0; j<cnt; j++) {
      rs = DBcinema.selectMovie(mno[j]); //movie 테이블 중 mno[j]의  mno 값을 가진 영화 정보를 불러옴
      try {
         while(rs.next()) {
            %>
            영화 | <%=rs.getString("title") %><br>
            <%
         }
      } catch(Exception e) {
         System.out.println("exception1");
      }
      rs2 = DBcinema.selectMovieScreening(enno[j]); //movieScreening 테이블 중 enno[j]의  enno 값을 가진 영화상영 정보를 불러옴
      try {
         while(rs2.next()) {
            %>
            일시 | <%=rs2.getDate("scrDate") %>
            <%
         }
      } catch(Exception e) {
         System.out.println("excption2");
      }
      rs2 = DBcinema.selectMovieScreening(enno[j]);
      try {
         while(rs2.next()) {
            %>
            , <%=rs2.getTime("scrTime") %><br>
            <%
         }
      } catch(Exception e) {
        System.out.println("exceptoin3");
     }
      rs2 = DBcinema.selectMovieScreening(enno[j]);
      try {
         while(rs2.next()) {
            %>
            극장 | 영화좋다 <%=rs2.getString("tname") %> 
            <%
         }
      } catch(Exception e) {
        System.out.println("exceptoin4");
     }
      rs2 = DBcinema.selectMovieScreening(enno[j]);
      try {
         while(rs2.next()) {
            %>
            <%=rs2.getString("sno").substring(5) %>관<br>
            <%
         }
      } catch(Exception e) {
        System.out.println("exceptoin5");
     }
      rs = DBcinema.selectTicketing(memID, enno[j]); //ticketing 테이블 중 enno[j]의  enno 값과 memID 값을 가진 영화상영 정보를 불러옴
      try {
         while(rs.next()) {
            %>
            예약번호 | <%=rs.getString("tknum") %> 
            <%
         }
      } catch(Exception e) {
        System.out.println("exceptoin6");
     }
      %><br>
      </form><br>
   <%
      }
   %>
   </div>
   
   <!-- 해당 영화에 대한 해당 회원이 작성한 리뷰를 보여줌 -->
   <div class="r_w">
      <strong>내가 쓴 리뷰</strong><br><br>
      <% rs2 = DBcinema.selectReContentMem(memID);
      try {
         while(rs2.next()) {
            
            %>
            영화 : <%=rs2.getString("title")%><br>
            리뷰 : <%=rs2.getString("reContent") %><br><br>
            <%
         }
      } catch(Exception e) {
        System.out.println("exceptoin5");
     }
      %>
   </div><br><br>
<%} %>

   
</div>
</body>

</html>