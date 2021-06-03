<!-- 관리자 - 예매 목록 조회 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<html>
<head><title>예매목록</title></head>
<body>
   <div align="center">
      <h2>영화 예매 목록</h2>
      <table border="1">
         <thead>
            <tr>
               <th>회원ID</th>
               <th>상영날짜</th>
               <th>상영관</th>
               <th>시간</th>
               <th>인원</th>
               <th>예약번호</th>
            </tr>
         </thead>
 
<%
	request.setCharacterEncoding("utf-8");
	String adID = (String)session.getAttribute("adID"); //session을 통해 로그인 되어있는 관리자 아이디를 가져옴

   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.lookUpMovie(request.getParameter("mno")); //이전 페이지의 mno를 받아 movie 테이블의 mno정보를 가져옴
   
   try {
      while(rs.next()) //rs의 끝까지
       {
   
%>
      <tbody>
            <tr>
               <td><%= rs.getString("memID") %></td>
               <td><%= rs.getDate("scrDate") %></td>
               <td><%= rs.getString("sno") %></td>
               <td><%= rs.getTime("scrTime") %></td>
               <td><%= rs.getInt("pNum") %></td>
               <td><%= rs.getString("tknum") %></td>
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
      <!-- 이전 페이지로 돌아가는 버튼 -->
      <form class="previous" action="manager3.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
</body>
</html>