<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.util.*" %>
<%@ page import="functions.*" %>
<!-- Java Bean으로 movieScreening, movie 테이블의 정보를 담을 객체를 생성 -->
<jsp:useBean id="mb" class="functions.MbeanMovieScreening" scope="page"/>
<jsp:useBean id="mv" class="functions.MbeanMovie" scope = "page" />
<%
	request.setCharacterEncoding("utf-8");
	String adID = (String)session.getAttribute("adID"); //session을 통해 로그인 되어있는 관리자 아이디를 불러옴
	mb.setAdID(adID); //movieScreenig 객체의 adID를 불러온 아이디로 set

   mb.setEnno(request.getParameter("enno")); //이전 페이지에서 받아온 enno 값을 mb 객체의 enno로 set
   mb.setMno(request.getParameter("mno")); //이전 페이지에서 받아온 mno 값을 mb 객체의 mno로 set
   //이전 페이지에서 받아온 scrDate를 java.sql.Date형으로 변환 후 mb 객체의 scrDate로 set
   java.sql.Date scrDate;
   try {
      scrDate = java.sql.Date.valueOf(request.getParameter("scrDate"));
   } catch(IllegalArgumentException e) {
      scrDate = java.sql.Date.valueOf("2021-05-26");
   }
   mb.setScrDate(scrDate);
 //이전 페이지에서 받아온 scrTime를 java.sql.Time형으로 변환 후 mb 객체의 scrTime로 set
   java.sql.Time scrTime;
   try {
      scrTime = java.sql.Time.valueOf(request.getParameter("scrTime"));
   } catch(IllegalArgumentException e) {
      scrTime = java.sql.Time.valueOf("13:00:00");
   }
   mb.setScrTime(scrTime);
   
   //예매하려는 상영 날짜, 상영 시간 정보를 이용해 예매가를 결정
   Calendar cal = Calendar.getInstance();
   java.util.Date utilScrDate = new java.util.Date(scrDate.getTime());
   cal.setTime(utilScrDate);
   int dayNum = cal.get(Calendar.DAY_OF_WEEK);
   if(Integer.parseInt((request.getParameter("scrTime")).substring(0,2))<11) { //11시 전 영화이면
      mb.setFee(mv.getEarlyCost()); //mv에 저장된 조조가로 mb의 fee를 set
   }
   else if(dayNum==1 || dayNum==7) { //토요일 또는 일요일 영화이면
      mb.setFee(mv.getWeekendCost()); //mv에 저장된 주말가로 mb의 fee를 set
   }
   else   mb.setFee(mv.getRgrCost()); //그 이외에는 모두 mv에 저장된 정상가로 mb의 fee를 set
   
   String city = request.getParameter("city"); //이전 페이지에서 받아온 지역 정보를 city에 저장
   String area = request.getParameter("area"); //이전 페이지에서 받아온 시/군 정보를 area에 저장
   String tnumber = request.getParameter("tnumber"); //이전 페이지에서 받아온 극장 번호 정보를 tnumber로 추가
   String sno = null; 
   
   mb.setTname(area+"점"); //mb의 tname을 area+"점"으로 set
   
   if(city.equals("서울")) { //city가 서울이면
      if(area.equals("강남")) { //area가 강남이면
    	  //tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C100-1";
         else if(tnumber.equals("2관")) sno = "C100-2";
         else if(tnumber.equals("3관")) sno = "C100-3";
      }
      else if(area.equals("명동")) { //area가 명동이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C101-1";
         else if(tnumber.equals("2관")) sno = "C101-2";
         else if(tnumber.equals("3관")) sno = "C101-3";
      }
      else if(area.equals("송파")) { //area가 송파이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C102-1";
         else if(tnumber.equals("2관")) sno = "C102-2";
         else if(tnumber.equals("3관")) sno = "C102-3";
      }
   }
   else if(city.equals("경기")) { //city가 경기이면
      if(area.equals("광교")) { //area가 광교이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C200-1";
         else if(tnumber.equals("2관")) sno = "C200-2";
         else if(tnumber.equals("3관")) sno = "C200-3";
      }
      else if(area.equals("동탄")) { //area가 동탄이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C201-1";
         else if(tnumber.equals("2관")) sno = "C201-2";
         else if(tnumber.equals("3관")) sno = "C201-3";
      }
   }
   if(city.equals("인천")) { //city가 인천이면
      if(area.equals("계양")) { //area가 계양이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C300-1";
         else if(tnumber.equals("2관")) sno = "C300-2";
         else if(tnumber.equals("3관")) sno = "C300-3";
      }
      else if(area.equals("부평")) { //area가 부평이면
    	//tnumber에 따라 sno를 설정
         if(tnumber.equals("1관"))   sno = "C301-1";
         else if(tnumber.equals("2관")) sno = "C301-2";
         else if(tnumber.equals("3관")) sno = "C301-3";
      }
   }
   mb.setSno(sno); //mb의 sno를 조건문으로 얻어낸 sno로 설정
   
   Connection cn = DBcinema.loadConnect();
   ResultSet rs = DBcinema.insertMovieScreening(mb); //mb에 저장된 정보를 movieScreening 테이블 에 insert
%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>상영 시간표</title>
</head>
<body>
   <div align="center">
      <h2>상영 시간표</h2>
      <table border="1">
         <thead>
            <tr>
               <th>등록번호</th>
               <th>영화번호</th>
               <th>상영 날짜</th>
               <th>상영 시간</th>
               <th>관람료</th>
               <th>총 예매 인원 수</th>
               <th>극장 이름</th>
               <th>상영관 번호</th>
               <th>등록 관리자</th>
            </tr>
         </thead>
 
<%
   try {
      while(rs.next()) //rs의 끝까지
       {
   
%>
      <tbody>
            <tr>
               <td><%= rs.getString("enno") %></td>
               <td><%= rs.getString("mno") %></td>
               <td><%= rs.getDate("scrDate") %></td>
               <td><%= rs.getTime("scrTime") %></td>
               <td><%= rs.getInt("fee") %></td>
               <td><%= rs.getInt("pCnt") %></td>
               <td><%= rs.getString("tname") %></td>
               <td><%= rs.getString("sno") %></td>
               <td><%= rs.getString("adID") %></td>
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
   <!-- 누르면 이전 페이지로 이동하는 버튼 -->
   <form class="previous" action="manager2.jsp" method="post">
    	<input  type="image" src="image/previous.png" name="payMethod" width="150px">
    </form>
</body>
</html>