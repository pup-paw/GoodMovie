package functions;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MbeanMovieScreening {
   private String enno;   //��Ϲ�ȣ
   private String mno;      //��ȭ ��ȣ
   private java.sql.Date scrDate;   //�� ��¥. Date�ڷ���??
   private java.sql.Time scrTime;      //�� �ð�. Time �ڷ��� ??
   private int fee;      //������
   private int pCnt = 0;   //�ѿ����ο���
   private String tname;   //���� �̸�
   private String sno;      //�󿵰���ȣ
   private String adID = "������";   //������id
   
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
         enno = rs.getString("enno");
         mno = rs.getString("mno");
         scrDate = rs.getDate("scrDate");
         scrTime = rs.getTime("scrTime");
         fee = rs.getInt("fee");
         tname = rs.getString("tname");
         sno = rs.getString("sno");
         adID = rs.getString("adID");
      }
      catch (Exception e) {
         System.out.println(enno + mno + scrDate + scrTime + fee + tname + sno + adID);
         System.out.println(e);
      }
      finally {
         disconnect();
      }
   }
   
   public String getEnno() {
      return enno;
   }
   public void setEnno(String enno) {
      this.enno = enno;
   }
   public String getMno() {
      return mno;
   }
   public void setMno(String mno) {
      this.mno = mno;
   }
   public java.sql.Date getScrDate() {
      return scrDate;
   }
   public void setScrDate(java.sql.Date scrDate) {
      this.scrDate = scrDate;
   }
   public java.sql.Time getScrTime() {
      return scrTime;
   }
   public void setScrTime(java.sql.Time scrTime) {
      this.scrTime = scrTime;
   }
   public int getFee() {
      return fee;
   }
   public void setFee(int fee) {
      this.fee = fee;
   }
   public int getpCnt() {
      return pCnt;
   }
   public void setpCnt(int pCnt) {
      this.pCnt = pCnt;
   }
   public String getTname() {
      return tname;
   }
   public void setTname(String tname) {
      this.tname = tname;
   }
   public String getSno() {
      return sno;
   }
   public void setSno(String sno) {
      this.sno = sno;
   }
   public String getAdID() {
      return adID;
   }
   public void setAdID(String adID) {
      this.adID = adID;
   }
   
}