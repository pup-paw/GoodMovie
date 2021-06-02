<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<jsp:useBean id="mb" class="functions.MbeanMovie" scope = "page" />
<%
    request.setCharacterEncoding("utf-8");
	String adID = (String)session.getAttribute("adID");	

   mb.setMno(request.getParameter("mno"));
   mb.setTitle(request.getParameter("title"));
   mb.setDirector(request.getParameter("director"));
   mb.setGenre(request.getParameter("genre"));
   mb.setSummary(request.getParameter("summary"));
   String runtimeString = request.getParameter("runtime");
   int runtime = 0;
   try {
      runtime = Integer.parseInt(runtimeString);
   } catch(NumberFormatException e) {
      runtimeString = "0";
      runtime = Integer.parseInt(runtimeString);
   }
   mb.setRuntime(runtime);
   java.sql.Date strDate;
   try{
      strDate = java.sql.Date.valueOf(request.getParameter("strDate"));
   } catch(IllegalArgumentException e) {
      strDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setStrDate(strDate);
   java.sql.Date endDate;
   try{
      endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
   } catch(IllegalArgumentException e) {
      endDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setEndDate(endDate);

   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.insertMovie(mb);
%>
<!DOCTYPE html>
<html>
<head>
	<style>
	.previous {
	align: center;
	}
	</style>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>등록 영화</title>
</head>
<body>
   <div align="center">
      <h2>등록 영화 목록</h2>
      <table border="1">
         <thead>
            <tr>
               <th>영화번호</th>
               <th>영화제목</th>
               <th>정상가</th>
               <th>조조 할인가</th>
               <th>주말가</th>
               <th>장르</th>
               <th>러닝타임</th>
               <th>평점</th>
               <th>상영 시작일</th>
               <th>상영 종료일</th>
               <th>줄거리</th>
               <th>감독</th>
            </tr>
         </thead>
 
<%
   try {
      while(rs.next())
       {
   
%>
      <tbody>
            <tr>
               <td><%= rs.getString("mno") %></td>
               <td><%= rs.getString("title") %></td>
               <td><%= rs.getInt("rgrCost") %></td>
               <td><%= rs.getInt("earlyCost") %></td>
               <td><%= rs.getInt("weekendCost") %></td>
               <td><%= rs.getString("genre") %></td>
               <td><%= rs.getInt("runtime") %></td>
               <td><%= rs.getDouble("avgScore") %></td>
               <td><%= rs.getDate("strDate") %></td>
               <td><%= rs.getDate("endDate") %></td>
               <td><%= rs.getString("summary") %></td>
               <td><%= rs.getString("director") %></td>
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
   <form class="previous" action="manager1.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
   
</body>
</html>