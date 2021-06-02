<%--평점, 리뷰 내용 입력받아 업데이트 하는 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<jsp:useBean id="TicketingBean" class="functions.TicketingBean" scope="request" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 성공</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String memID = (String)session.getAttribute("memID");
   TicketingBean tb = new TicketingBean();
   
   //입력받은 평점, 감상평
   
   double score = Double.parseDouble(request.getParameter("score"));
   String reContent = request.getParameter("reContent");
   
   //해당하는 tknum가져오기
   try{
      Connection conn = DBcinema.loadConnect();
      PreparedStatement pstmt = conn.prepareStatement("select tknum from ticketing where memID = '"+memID+"'");
      ResultSet rs = pstmt.executeQuery();
      while(rs.next()){
         tb.setTknum(rs.getString("tknum"));
      }
      DBcinema.disconnect();
   }catch(SQLException e) {
      e.printStackTrace();
   }
   
   Calendar now = Calendar.getInstance();
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
   String revDateString = format.format(now.getTime());
   java.sql.Date revDate;
   try {
      revDate = java.sql.Date.valueOf(revDateString);
   } catch(IllegalArgumentException e) {
      revDate = tb.getRevDate();
   }
   
   
    if(Review.enReview(tb.getTknum(), revDate, memID, reContent, score)) {
       int count = Review.cntReCnt(memID);
       Review.updateReCnt(count, memID);
       %>
       <script>
       alert("리뷰 등록을 완료했습니다");
       location.href="mypage.jsp";<%--마이 페이지로--%>
      </script>
    <%}else { %>
       <script>
       alert("리뷰 등록 오류!");
       location.href="mypage.jsp";<%--마이 페이지로--%>
      </script>
    <% }%>
</body>
</html>