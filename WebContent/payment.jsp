<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<%
   request.setCharacterEncoding("utf-8");

   TicketingBean tb = (TicketingBean)session.getAttribute("tb"); //session을 통해 이전 페이지의 tb 정보를 가져옴
   MbeanMovieScreening ms = (MbeanMovieScreening)session.getAttribute("ms"); //session을 통해 이전 페이지의 ms 정보를 가져옴
   String memID = (String)session.getAttribute("memID"); //session을 통해 로그인 되어있는 회원 아이디를 가져옴
   tb.setMemID(memID); //tb의 memID를 set
   
   tb.setPayMethod(request.getParameter("payMethod")); //이전 페이지의 payMethod를 가져와 tb에 set
   tb.setTknum(DBcinema.getRandomStr(4)); //tb의 Tknum를 랜덤한 4개의 문자로 set
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rst = DBcinema.insertTicketing(tb); //tb 정보를 ticketing 테이블엥 저장
   //movieScreening 테이블 중 mno, rsvDate, tname, scrTime을 갖는 정보를 가져옴
   ResultSet rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname(), ms.getScrTime());
   String mno = "mno";
   try {
      while(rs.next()) {
         mno = rs.getString("mno");
      }
   } catch(SQLException e) {
      System.out.println("sqlException");
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
    
    <p class="subtitle"><input type="image" src="image/l_ticket.png"></p>
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
 					<th width="150px">예매 정보</th>
 					<th width="80px">예약 번호</th>
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
 						<strong><%=tb.getTknum()%></strong>
 					</td>
 				</tr>
 			</tbody>
 	</table><br>   
 	</div>  
</body>
</html>