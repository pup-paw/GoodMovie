<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<jsp:useBean id="ms" class="functions.MbeanMovieScreening" scope="page"/>
<jsp:useBean id="tb" class="functions.TicketingBean" scope="page" />
<%
   request.setCharacterEncoding("utf-8");
   session.setAttribute("ms", ms);
   session.setAttribute("tb", tb);
   String memID = (String)session.getAttribute("memID");

   ms.setMno(request.getParameter("mno"));
   String city = request.getParameter("city");
   String area = request.getParameter("area");
   ms.setTname(area+"점");
   java.sql.Date rsvDate;
   try {
      rsvDate = java.sql.Date.valueOf(request.getParameter("rsvDate"));
   } catch(IllegalArgumentException e) {
      rsvDate = java.sql.Date.valueOf("2021-06-01");
   }
   tb.setRsvDate(rsvDate);
   String enno = null;
   try{
   		Connection con = DBcinema.loadConnect();
   		PreparedStatement pstmt = con.prepareStatement("select enno from moviescreening where tname='"+ms.getTname()+"' and mno='"+ms.getMno()+"'");
   		ResultSet rsc = pstmt.executeQuery();
   		while(rsc.next()) {
   			enno = rsc.getString("enno");
   		}
   }catch(SQLException e) {
	      e.printStackTrace();
	  }
   int pCntSum = DBcinema.selectSumpCnt(enno);
   DBcinema.updatepCnt(enno, pCntSum);  
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname());
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
    </div></strong><br>
  
    <div class="container">
    <form action="reservation.jsp" method="post">
     <table>
 			<thead height="40px">
 				<tr>
 					<th width="70px">예매 인원</th>
 					<td width="100px">요금 정보</td>
 					<th width="100px">시간</th>
 				</tr>
 			</thead>
 			<tbody height="300px">
 				<tr>
 				<td>
 					<input type="button" value="-" onClick="javascript:this.form.pNum.value--;">
          			<input type="text" readonly="readonly" name="pNum" value="2" style="text-align:center;">
         			<input type="button" value="+" onClick="javascript:this.form.pNum.value++;">
 				</td>
 				<td>	
 					조조 : 10000 원<br>
 					평일 : 13000 원<br>
 					주말 : 14000 원<br>			
 				
 				</td>
 				
 				<td>
 					<%
             try {
                while(rs.next()) {
          %>
              <%=rs.getString("sno").substring(5)%>관<br>
              <div class="tm">
             <input type="submit" id="time" name="scrTime" value="<%=rs.getTime("scrTime") %>">
               (<%=70-rs.getInt("pCnt") %>/70석)<br><br>
            <%   }
             } catch(NullPointerException e) {
                System.out.println("nullPointerException");
             }
          %>
          </div>
 				</td>
 				</tr>
 			</tbody>
 			</table>
    </form>
    </div>
</body>
</html>