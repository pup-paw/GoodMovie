<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<%
   request.setCharacterEncoding("utf-8");
   String memID = (String)session.getAttribute("memID");

   TicketingBean tb = (TicketingBean)session.getAttribute("tb");
   MbeanMovieScreening ms = (MbeanMovieScreening)session.getAttribute("ms");
   tb.setpNum(Integer.parseInt(request.getParameter("pNum")));
   
   java.sql.Time scrTime;
   try {
      scrTime = java.sql.Time.valueOf(request.getParameter("scrTime"));
   } catch(IllegalArgumentException e) {
      scrTime = java.sql.Time.valueOf("13:00:00");
   }
   ms.setScrTime(scrTime);
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
   String mno = "mno";
   String enno = "enno";
   try {
      while(rs.next()) {
         mno = rs.getString("mno");
         tb.setTotal(rs.getInt("fee")*tb.getpNum());
         tb.setEnno(rs.getString("enno"));
      }
   } catch(SQLException e) {
      System.out.println("sqlException");
   }
   if(tb.getTotal()<=13000*tb.getpNum()) {
      tb.setDiscount(true);
   }
   ResultSet rs2 = DBcinema.selectMovie(mno);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>movie reservation page</title>
<style type="text/css">
@import url("css/reservation.css");
</style>
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
    <table>
 			<thead height="40px">
 				<tr>
 					<th width="150">예매 정보</th>
 					<th width="80">총 결제금액</th>
 				</tr>
 			</thead>
 			<tbody height="300px">
 				<tr>
 					<td>
	<%
       try {
          while(rs2.next()) {
             %>
              영화 | <%=rs2.getString("title") %> <br>
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>
    <%
       rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
       try {
          while(rs.next()) {
             %>
              극장 | 영화좋다 <%=rs.getString("tname") %>
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>
    <%
       rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
       try {
          while(rs.next()) {
             %>
              <%=rs.getString("sno").substring(5) %>관 <br>
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>
    <%
       rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
       try {
          while(rs.next()) {
             %>
              일시 | <%=rs.getDate("scrDate") %>,
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>
    <%
       rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
       try {
          while(rs.next()) {
             %>
              <%=rs.getTime("scrTime") %> <br>
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>
    <%
       rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
       try {
          while(rs.next()) {
             %>
              인원 | <%=tb.getpNum() %>명
    <%
          }
       } catch(Exception e) {
          System.out.println("exception");
       }
    %>  
 					</td>
 					<td>
 						\ <%=tb.getTotal() %> 원
 					</td>
 				</tr>
 			</tbody>
 	</table><br>
   	
    <form action="payment.jsp" method="post">
    	<input  type="image" src="image/paycard.png" name="payMethod" width="180px">
    	<input  type="image" src="image/paycash.png" name="payMethod" width="180px">
    </form>
    
</body>
</html>