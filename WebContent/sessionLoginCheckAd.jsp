<%--관리자 아이디, pw인자로 받아서  테이블에 존재하는지 여부 체크--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String adID = request.getParameter("adID");
	String adPW = request.getParameter("adPW");
	
	 if(LoginCheck.passAd(adID, adPW)) {
		session.setAttribute("adID", adID);
		session.setAttribute("adPW", adPW);
		 %>
		 <script>
		 alert("관리자 로그인 되었습니다.");
		 location.href="manager1.jsp";
		</script>
	 <%}else { %>
		 <script>
		 alert("관리자 아이디 혹은 비밀번호가 틀렸습니다.");
		 location.href="sessionLoginman.jsp";
		</script>
	 <% }%>
</body>
</html>