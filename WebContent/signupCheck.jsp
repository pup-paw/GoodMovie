<%--회원 아이디, pw, 이름, 전화번호 입력받아서 회원가입--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Member Sign up Check</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String memID = request.getParameter("memID");
	String memPW = request.getParameter("memPW");
	String memName = request.getParameter("memName");
	String telno = request.getParameter("telno");
	
	 if(signupCheck.signupMem(memID, memPW, memName, telno)) {
		 %>
		 <script>
		 alert("회원가입 완료! 로그인 후 이용하세요");
		 location.href="sessionLoginuser.jsp";
		</script>
	 <%}else { %>
		 <script>
		 alert("회원가입 실패! 정보를 다시 입력해주시기 바랍니다");
		 location.href="signup.jsp";
		</script>
	 <% }%>
</body>
</html>