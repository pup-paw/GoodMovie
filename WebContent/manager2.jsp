<%--관리자 메인 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mvBean" class="functions.MovieBean" />
<!DOCTYPE html>
<html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 페이지</title>
<style type="text/css">
@import url("css/tab.css");
@import url("css/manager.css");
</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/location.js"></script>
<script src="js/tab.js"></script>
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

</HEAD>
<BODY>
<%
	request.setCharacterEncoding("UTF-8");
	String adID = (String)session.getAttribute("adID");
	
	//추가한부분
	ArrayList<Movie> marr = mvBean.getMovieList();
%>
   <!-- logo -->
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='manager1.jsp'">
    </div>
    
    <p class="subtitle"><input type="image" src="image/l_manager.png"></p><br>
    <div class="menu"><strong>
        <a class="menu" href="manager1.jsp">1. 영화 등록</a>
        <a class="menu" href="manager2.jsp">2. 상영시간표 등록</a>
        <a class="menu" href="manager3.jsp">3. 예매현황조회</a><br>
        <br>관리자 <%= adID %> 님 환영합니다!
        <a href="sessionLogout.jsp">로그아웃</a>
    </div></strong><br>
    
    <!-- 상영시간표 등록 -->
    <div class="container"><br>
    		<!-- 입력시 manage_movieScreening으로 이동 -->
            <form action="manage_movieScreening.jsp" method="post">
            
            <table>
 			<thead height="40px">
 				<tr>
 					<th width="30px">영화 포스터</th>
 					<th width="80px">영화 선택</th>
 					<th width="250px">상영관 선택</th>
 					<th width="150px">상영 날짜</th>
 					<th width="150px">상영 시간</th>
 					<th width="70px">등록 번호
 				</tr>
 			</thead>
 			<tbody height="300px">
 				<tr>
 				<!-- 영화 포스터 첨부 -->
               	<td><div id="poster">
                     <input type="file" id="image" accept="image/*"
                        onchange="setThumbnail(event);" />
                     <script>
                            function setThumbnail(event) {
                                var reader = new FileReader();
                                reader.onload = function (event) {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", event.target.result);
                                    document.querySelector("div#poster").appendChild(img);
                                };
                                reader.readAsDataURL(event.target.files[0]);
                            }
                        </script>
                        </div>
                  </td>
                  
                  <!-- 영화 선택 -->
                  <td>
                  <select name="mno">
                        <option>영화 선택</option>
                        <%for(int i=0;i<marr.size();i++) { %>
                        <option value="<%=marr.get(i).getMno()%>"><%=marr.get(i).getTitle() %></option>
                        <% } %>
                        
                  </select>
                  </td>

                 <!-- 상영관 선택 -->
                 <td>
                 <select name="city" onchange="city_choice(this)">
                        <option>지역 선택</option>
                        <option value="서울">서울</option>
                        <option value="경기">경기</option>
                        <option value="인천">인천</option>
                 </select>
                 <select name="area" id="area" onchange="area_choice(this)">
                        <option>극장 선택</option>
                 </select>
                 <select name="tnumber" id="tnumber">
                        <option>관 선택</option>
                 </select>
                 </td>
                  <!-- 날짜 선택 -->
                  <td>
                  		<input type="date" name="rsvDate" value="2021-06-01"> <br>
                  </td>
                  <td>
                  		<input id="clock" type="time" name="scrTime" value="13:00:00"> <br>
                  </td>
                  <td>
                   		<input id="txt" type="text" name="enno">
                  </td>
                  </tr>
               	</tbody>
             	</table><br><br>
                 <input type="submit" value="등록">
            </form>
    </div>
</BODY>
</html>