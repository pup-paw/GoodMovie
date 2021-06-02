package functions;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MbeanMovie {
   private String mno;   //영화번호
   private String title;   //영화 제목
   private int rgrCost = 13000;   //정상가
   private int earlyCost = 10000;   //조조 할인가
   private int weekendCost = 14000;   //주말가격
   private String genre;   //장르
   private int runtime;   //러닝타임->int
   private double avgScore = 0.0;   //평균평점->double
   private java.sql.Date strDate;      //상영 시작일->date
   private java.sql.Date endDate;      //상영 종료일->date
   private int rcnt = 0;      //리뷰개수->int
   private String summary;      //줄거리
   private String director;   //감독
   
   Connection conn = null;
   Statement stmt = null;
   PreparedStatement pstmt = null;
   
   public void connect() {

      try {
         Context initContext = new InitialContext();
         Context envContext = (Context) initContext.lookup("java:/comp/env");
         DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
         conn = ds.getConnection();
      }

      catch (Exception e) {
         System.out.println(e);
         e.printStackTrace();
      }
   }
   
   public void disconnect() {
      try {
         if (conn != null)
            conn.close();
      }
      catch (SQLException e) {
         System.out.println(e);
      }
      System.out.println("close");
   }
   
   public void getData() {
      connect();
      try {
         stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from movie");
         rs.next();
         mno = rs.getString("mno");
         title = rs.getString("title");
         genre = rs.getString("genre");
         runtime = rs.getInt("runtime");
         strDate = rs.getDate("strDate");
         endDate = rs.getDate("endDate");
         summary = rs.getString("summary");
         director = rs.getString("director");
      }
      catch (Exception e) {
         System.out.println(mno + title + genre + runtime + runtime
               + strDate + endDate + summary + director);
         System.out.println(e);
      }
      finally {
         disconnect();
      }
   }
   
   
   public String getMno() {
      return mno;
   }
   public void setMno(String mno) {
      this.mno = mno;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public int getRgrCost() {
      return rgrCost;
   }
   public void setRgrCost(int rgrCost) {
      this.rgrCost = rgrCost;
   }
   public int getEarlyCost() {
      return earlyCost;
   }
   public void setEarlyCost(int earlyCost) {
      this.earlyCost = earlyCost;
   }
   public int getWeekendCost() {
      return weekendCost;
   }
   public void setWeekendCost(int weekendCost) {
      this.weekendCost = weekendCost;
   }
   public String getGenre() {
      return genre;
   }
   public void setGenre(String genre) {
      this.genre = genre;
   }
   public int getRuntime() {
      return runtime;
   }
   public void setRuntime(int runtime) {
      this.runtime = runtime;
   }
   public double getAvgScore() {
      return avgScore;
   }
   public void setAvgScore(double avgScore) {
      this.avgScore = avgScore;
   }
   public java.sql.Date getStrDate() {
      return strDate;
   }
   public void setStrDate(java.sql.Date strdate) {
      this.strDate = strdate;
   }
   public java.sql.Date getEndDate() {
      return endDate;
   }
   public void setEndDate(java.sql.Date enddate) {
      this.endDate = enddate;
   }
   public int getRcnt() {
      return rcnt;
   }
   public void setRcnt(int rcnt) {
      this.rcnt = rcnt;
   }
   public String getSummary() {
      return summary;
   }
   public void setSummary(String summary) {
      this.summary = summary;
   }
   public String getDirector() {
      return director;
   }
   public void setDirector(String director) {
      this.director = director;
   }
   
}