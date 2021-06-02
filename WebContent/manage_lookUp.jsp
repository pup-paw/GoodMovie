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
	String adID = (String)session.getAttribute("adID");

   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.lookUpMovie(request.getParameter("mno"));
   
   try {
      while(rs.next())
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
      <form class="previous" action="manager3.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
</body>
</html>
         <%--
         request.setCharacterEncoding("euc-kr");
   
         String title = (String) request.getParameter("title");
   
         DBcinema.loadConnect();
         ResultSet rs = DBcinema.lookUpMovie(title);
   
         request.setAttribute("title", title+" 예매 현황 조회");
         request.setAttribute("RS", rs);
         request.getRequestDispatcher("manage_lookUp.jsp").include(request, response);
         
         //ServletContext sc = getServletContext();
         //RequestDispatcher rd = sc.getRequestDispatcher("/listRS.jsp");
         //rd.forward(request, response);
         //request.getRequestDispatcher("listRS.jsp").forward(request, response);
      --%>