<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<jsp:useBean id="mb" class="functions.MbeanMovieScreening" scope="page"/>
<jsp:useBean id="mv" class="functions.MbeanMovie" scope = "page" />
<%
	request.setCharacterEncoding("utf-8");
	String adID = (String)session.getAttribute("adID");
	mb.setAdID(adID);

   mb.setEnno(request.getParameter("enno"));
   mb.setMno(request.getParameter("mno"));
   java.sql.Date scrDate;
   try {
      scrDate = java.sql.Date.valueOf(request.getParameter("scrDate"));
   } catch(IllegalArgumentException e) {
      scrDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setScrDate(scrDate);
   java.sql.Time scrTime;
   try {
      scrTime = java.sql.Time.valueOf(request.getParameter("scrTime"));
   } catch(IllegalArgumentException e) {
      scrTime = java.sql.Time.valueOf("13:00:00");
   }
   mb.setScrTime(scrTime);
   
   Calendar cal = Calendar.getInstance();
   java.util.Date utilScrDate = new java.util.Date(scrDate.getTime());
   cal.setTime(utilScrDate);
   int dayNum = cal.get(Calendar.DAY_OF_WEEK);
   if(Integer.parseInt((request.getParameter("scrTime")).substring(0,2))<11) {
      mb.setFee(mv.getEarlyCost());
   }
   else if(dayNum==1 || dayNum==7) {
      mb.setFee(mv.getWeekendCost());
   }
   else   mb.setFee(mv.getRgrCost());
   
   String city = request.getParameter("city");
   String area = request.getParameter("area");
   String tnumber = request.getParameter("tnumber");
   String sno = null;
   
   mb.setTname(area+"점");
   
   if(city.equals("서울")) {
      if(area.equals("강남")) {
         if(tnumber.equals("1관"))   sno = "C100-1";
         else if(tnumber.equals("2관")) sno = "C100-2";
         else if(tnumber.equals("3관")) sno = "C100-3";
      }
      else if(area.equals("명동")) {
         if(tnumber.equals("1관"))   sno = "C101-1";
         else if(tnumber.equals("2관")) sno = "C101-2";
         else if(tnumber.equals("3관")) sno = "C101-3";
      }
      else if(area.equals("송파")) {
         if(tnumber.equals("1관"))   sno = "C102-1";
         else if(tnumber.equals("2관")) sno = "C102-2";
         else if(tnumber.equals("3관")) sno = "C102-3";
      }
   }
   else if(city.equals("경기")) {
      if(area.equals("광교")) {
         if(tnumber.equals("1관"))   sno = "C200-1";
         else if(tnumber.equals("2관")) sno = "C200-2";
         else if(tnumber.equals("3관")) sno = "C200-3";
      }
      else if(area.equals("동탄")) {
         if(tnumber.equals("1관"))   sno = "C201-1";
         else if(tnumber.equals("2관")) sno = "C201-2";
         else if(tnumber.equals("3관")) sno = "C201-3";
      }
   }
   if(city.equals("인천")) {
      if(area.equals("계양")) {
         if(tnumber.equals("1관"))   sno = "C300-1";
         else if(tnumber.equals("2관")) sno = "C300-2";
         else if(tnumber.equals("3관")) sno = "C300-3";
      }
      else if(area.equals("부평")) {
         if(tnumber.equals("1관"))   sno = "C301-1";
         else if(tnumber.equals("2관")) sno = "C301-2";
         else if(tnumber.equals("3관")) sno = "C301-3";
      }
   }
   mb.setSno(sno);
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.insertMovieScreening(mb);
%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>상영 시간표</title>
</head>
<body>
   <div align="center">
      <h2>상영 시간표</h2>
      <table border="1">
         <thead>
            <tr>
               <th>등록번호</th>
               <th>영화번호</th>
               <th>상영 날짜</th>
               <th>상영 시간</th>
               <th>관람료</th>
               <th>총 예매 인원 수</th>
               <th>극장 이름</th>
               <th>상영관 번호</th>
               <th>등록 관리자</th>
            </tr>
         </thead>
 
<%
   try {
      while(rs.next())
       {
   
%>
      <tbody>
            <tr>
               <td><%= rs.getString("enno") %></td>
               <td><%= rs.getString("mno") %></td>
               <td><%= rs.getDate("scrDate") %></td>
               <td><%= rs.getTime("scrTime") %></td>
               <td><%= rs.getInt("fee") %></td>
               <td><%= rs.getInt("pCnt") %></td>
               <td><%= rs.getString("tname") %></td>
               <td><%= rs.getString("sno") %></td>
               <td><%= rs.getString("adID") %></td>
            </tr>
         <tbody>
<%
       }
      } catch(NullPointerException e) {
         System.out.println("nullPointerException");
      }
%>
      </table>
   </div>
   <form class="previous" action="manager2.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
</body>
</html>