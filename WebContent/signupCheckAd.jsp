<%--관리자 이름, 아이디, pw, 사원번호 입력받아서 회원가입--%>
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
	response.setCharacterEncoding("UTF-8");	

	String adName = request.getParameter("adName");
	String adID = request.getParameter("adID");
	String adPW = request.getParameter("adPW");
	String adno = request.getParameter("adno");
	
	 if(signupCheck.signupAd(adName, adID, adPW, adno)) {
		 %>
		 <script>
		 alert("관리자 회원가입 완료! 관리자로 로그인 해주세요");
		 location.href="sessionLoginman.jsp";
		</script>
	 <%}else { %>
		 <script>
		 alert("관리자 회원가입 실패! 다시 정보 입력 바랍니다.");
		 location.href="signup_manager.jsp";
		</script>
	 <% }%>
</body>
</html>