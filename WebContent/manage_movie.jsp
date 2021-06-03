<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<!-- JAVA Bean으로 MbeanMovie의 영화 정보를 저장할 객체를 불러옴 -->
<jsp:useBean id="mb" class="functions.MbeanMovie" scope = "page" />
<%
    request.setCharacterEncoding("utf-8");
	String adID = (String)session.getAttribute("adID");	//session에서 로그인 되어있는 관리자 아이디 가져오기

   mb.setMno(request.getParameter("mno")); //mb의 mno를 이전 페이지에서 받아온 mno로 set
   mb.setTitle(request.getParameter("title")); //mb의 title을 이전 페이지에서 받아온 title로 set
   mb.setDirector(request.getParameter("director")); //mb의 director을 이전 페이지에서 받아온 director로 set
   mb.setGenre(request.getParameter("genre")); //mb의 genre를 이전 페이지에서 받아온 genre로 set
   mb.setSummary(request.getParameter("summary")); //mb의 summary를 이전 페이지에서 받아온 summary로 set
   //이전 페이에서 받아온 rutime을 int형으로 바꿔 mb의 runtime으로 set
   String runtimeString = request.getParameter("runtime"); 
   int runtime = 0;
   try {
      runtime = Integer.parseInt(runtimeString);
   } catch(NumberFormatException e) {
      runtimeString = "0";
      runtime = Integer.parseInt(runtimeString);
   }
   mb.setRuntime(runtime);
   //이전 페이지에서 받아온 strDate를 java.sql.Date형으로 바꿔 mb의 strDate로 set
   java.sql.Date strDate;
   try{
      strDate = java.sql.Date.valueOf(request.getParameter("strDate"));
   } catch(IllegalArgumentException e) {
      strDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setStrDate(strDate);
 //이전 페이지에서 받아온 endDate를 java.sql.Date형으로 바꿔 mb의 endDate로 set
   java.sql.Date endDate;
   try{
      endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
   } catch(IllegalArgumentException e) {
      endDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setEndDate(endDate);

   Connection cn = DBcinema.loadConnect();
   //Movie 테이블에 mb를 추가
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
	<!-- 등록된 영화 목록을 보여줌 -->
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
   <!-- 이전 페이지로 이동하는 버튼 -->
   <form class="previous" action="manager1.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
   
</body>
</html>