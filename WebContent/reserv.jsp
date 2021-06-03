<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!-- Java Bean을 이용해 movie 객체를 생성 -->
<jsp:useBean id="mvBean" class="functions.MovieBean" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 페이지</title>
<style type="text/css">
@import url("css/tab.css");
@import url("css/reservation.css");
</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/location.js"></script>
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#datepicker").datepicker();
   });
</script>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String adID = (String)session.getAttribute("adID"); //session을 통해 로그인 된 관리자 아이디를 가져옴
	String memID = (String)session.getAttribute("memID"); //session을 통해 로그인 된 회원 아이디를 가져옴
	
	ArrayList<Movie> marr = mvBean.getMovieList(); //movie 정보를 갖는 ArrayList를 생성
%>

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
    <!-- 제출하면 showMovie 페이지로 넘어감 -->
    <form action="showMovie.jsp" method="post">
    <table>
 			<thead height="40px">
 				<tr>
 					<th width="200">영화</th>
 					<th width="80">지역</th>
 					<th width="100">극장</th>
 					<th width="50">날짜</th>
 				</tr>
 			</thead>
 			<tbody height="300px">
 				<tr>
 				<!-- 영화 선택 -->
               	<td><select name="mno">
                        <option>영화를 선택해주세요</option>
                        <%for(int i=0;i<marr.size();i++) { %> <!-- ArrayList의 크기만큼 -->
                        <!-- 옵션태그의 value를 movie의 mno로 설정, title을 보여줌 -->
                        <option value="<%=marr.get(i).getMno()%>"><%=marr.get(i).getTitle() %></option>
                        <% } %>
               		</select><br><br>
                     </select>
                  </td>

                 <!-- 상영관 선택 -->
                 <td><select name="city" onchange="city_choice(this)">
                        <option>지역을 선택해주세요</option>
                        <option value="서울">서울</option>
                        <option value="경기">경기</option>
                        <option value="인천">인천</option>
                     </select> 
                 <!-- 극장 선택 -->
                 <td><select name="area" id="area" onchange="area_choice(this)">
                 		<option>극장을 선택해주세요</option>
                     </select>
                  </td>
                  
                  <!-- 날짜 선택 -->
                  <td>
                  		<input type="date" name="rsvDate" value="2021-06-01"> <br>
                  </td>
                  </tr>
                  </tbody>
                  </table><br><br>
         <!-- 다음 단계 -->
         <%if(memID != null) { %>
         	<input  TYPE="image" src="image/seat.png" name="submit" value="submit" class="submit">
        	<%} 
        	else { %>
        	<img src="image/seat.png" onclick="alert('로그인 후 예매할 수 있습니다!');" style="cursor:pointer;" />
        <%} %>       
    </form>
       
    </div>
</body>
</html>