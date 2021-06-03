<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<!-- Java Bean을 통해 movieScreening, ticketing 객체를 생성 -->
<jsp:useBean id="ms" class="functions.MbeanMovieScreening" scope="page"/>
<jsp:useBean id="tb" class="functions.TicketingBean" scope="page" />
<%
   request.setCharacterEncoding("utf-8");
   session.setAttribute("ms", ms); //session을 통해 movieScreening 객체 정보를 ms에 저장
   session.setAttribute("tb", tb); //session을 통해 ticketing 객체 정보를 tb에 저장
   String memID = (String)session.getAttribute("memID"); //session을 통해 로그인된 회원 아이디의 정보를 가져옴

   ms.setMno(request.getParameter("mno")); //이전 페이지의 mno를 ms의 mno로
   String city = request.getParameter("city"); //이전 페이지의 city를 가져옴
   String area = request.getParameter("area"); //이전 페이지의 area를 가져옴
   ms.setTname(area+"점"); //tname을 area+"점" 으로 set
   //이전 페이지의 rsvDate를 가져와 java.sql.Date형으로 변환 후 tb의 rsvDate 로 set
   java.sql.Date rsvDate;
   try {
      rsvDate = java.sql.Date.valueOf(request.getParameter("rsvDate"));
   } catch(IllegalArgumentException e) {
      rsvDate = java.sql.Date.valueOf("2021-06-01");
   }
   tb.setRsvDate(rsvDate);
   //movieScreening 테이블 중 tname과 mno의 정보를 갖는 정보들을 select
   String enno = null;
   try{
   		Connection con = DBcinema.loadConnect();
   		PreparedStatement pstmt = con.prepareStatement("select enno from moviescreening where tname='"+ms.getTname()+"' and mno='"+ms.getMno()+"'");
   		ResultSet rsc = pstmt.executeQuery();
   		//가져온 정보 중 enno를 저장
   		while(rsc.next()) {
   			enno = rsc.getString("enno");
   		}
   }catch(SQLException e) {
	      e.printStackTrace();
	  }
   int pCntSum = DBcinema.selectSumpCnt(enno); //enno의 총 예약자 수를 구함
   DBcinema.updatepCnt(enno, pCntSum); //enno 등록번호를 갖고있는 정보의 예약자 수를 업데이트함
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.selectMovieScreening(ms.getMno(), tb.getRsvDate(), ms.getTname()); //movieScreening 테이블 중 mno, rsvDate, tname을 갖는 정보를 가져옴
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
    <!-- 제출시 reservation으로 이동 -->
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