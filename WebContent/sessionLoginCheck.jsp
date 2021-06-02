<%--회원 아이디, pw인자로 받아서  테이블에 존재하는지 여부 체크--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Member Login Check</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String memID = request.getParameter("memID");
	String memPW = request.getParameter("memPW");
	
	 if(LoginCheck.pass(memID, memPW)) {
		session.setAttribute("memID", memID);
		session.setAttribute("memPW", memPW);
		 %>
		 <script>
		 alert("<%=memID%>님 환영합니다!");
		 location.href="mainAfLogin.jsp";
		</script>
	 <%}else { %>
		 <script>
		 alert("회원 아이디 혹은 비밀번호가 맞지않습니다.");
		 location.href="sessionLoginuser.jsp";
		</script>
	 <% }%>
</body>
</html>