<%--�α��� ��, �� ����������. ��ȭ ��� �����Ǿ� ���� mainBfLogin.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<jsp:useBean id="mvBean" class="functions.MovieBean" />

<!DOCTYPE html>
<html>
<%
   request.setCharacterEncoding("UTF-8");   
   ArrayList<Movie> marr = mvBean.getMovieList();
   String memID = (String)session.getAttribute("memID");
%>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/gallery.css">
    <title>��ȭ���� ���� ������</title>
</head>

<body> 
    <!-- logo -->
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    
    <p class="subtitle"><input type="image" src="image/l_movie.png"></p>
    <div class="menu"><strong>
        <a class="menu" href="mainAfLogin.jsp">��ȭ</a>
        <a class="menu" href="reserv.jsp">����</a>
        <a class="menu" href="theater.jsp">����</a>
        <%--�α��� ���� �α���, �Ŀ� ���������� ���� --%>
        <%if(memID != null) { %>
        	<a class="menu" href="mypage.jsp">����������</a><br>
        	<p><%=memID%>�� ȯ���մϴ�!
			<a href="sessionLogout.jsp">LOG OUT</a></p>
        	<%} 
        	else { %>
        <a class="menu" href="sessionLoginuser.jsp">�α���</a>
        <%} %>
    </div></strong>
	
	<div class="container">
    <div><%--�����ͺ��̽��� �ִ� ��ŭ�� ��ȭ ��� ���� --%>
        <%for(int i=0;i<4;i++)  {
           %>
        <div class="gallery">
        	<div class="no">No.<%=i+1%></div>
            <form action="movieDetail.jsp" method="post">
            
               <button type="submit" class="poster2" name="mno" value="<%=marr.get(i).getMno()%>">
                  <input type="image" class="poster" src="image/<%=marr.get(i).getMno() %>.jpg" width="200" height="300" >
               </button>
            </form>
            
            <div class="desc"><br>
                <strong><%=marr.get(i).getTitle()%></strong><br>
               	<%=marr.get(i).getStrDate() %> ����<br><br>
                <a class="book" href="reservation.html">����</a>
            </div>
        </div>
    </div>
<%} %>
        
    </div>

</body>

</html>