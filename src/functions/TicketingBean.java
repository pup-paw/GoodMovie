package functions;
import java.sql.*;

public class TicketingBean {
   private String tknum;   //���Ź�ȣ      
   private String memID = "ȸ��";   //ȸ��id
   private Boolean discount = false;   //���ο���
   private String payMethod;   //���� ���
   private int pNum;   //�ο���
   private int total;   //�ѱݾ�
   private java.sql.Date rsvDate;   //���ų�¥ Date??
   private String enno;      //��Ϲ�ȣ
   private String reno = "���� ���䰡 �Էµ��� �ʾҽ��ϴ�.";   //�����ȣ
   private String reContent = "���� ���䰡 �Էµ��� �ʾҽ��ϴ�.";   //���� ����
   private java.sql.Date revDate;   //���� �ۼ���¥ Date??
   private double score = 0.0;   //����
   
   public String getTknum() {
      return tknum;
   }
   public void setTknum(String tknum) {
      this.tknum = tknum;
   }
   public String getMemID() {
      return memID;
   }
   public void setMemID(String memID) {
      this.memID = memID;
   }
   public Boolean getDiscount() {
      return discount;
   }
   public void setDiscount(Boolean discount) {
      this.discount = discount;
   }
   public String getPayMethod() {
      return payMethod;
   }
   public void setPayMethod(String payMethod) {
      this.payMethod = payMethod;
   }
   public int getpNum() {
      return pNum;
   }
   public void setpNum(int pNum) {
      this.pNum = pNum;
   }
   public int getTotal() {
      return total;
   }
   public void setTotal(int total) {
      this.total = total;
   }
   public java.sql.Date getRsvDate() {
      return rsvDate;
   }
   public void setRsvDate(java.sql.Date rsvDate) {
      this.rsvDate = rsvDate;
   }
   public String getEnno() {
      return enno;
   }
   public void setEnno(String enno) {
      this.enno = enno;
   }
   public String getReno() {
      return reno;
   }
   public void setReno(String reno) {
      this.reno = reno;
   }
   public String getReContent() {
      return reContent;
   }
   public void setReContent(String reContent) {
      this.reContent = reContent;
   }
   public java.sql.Date getRevDate() {
      return revDate;
   }
   public void setRevDate(java.sql.Date revDate) {
      this.revDate = revDate;
   }
   public double getScore() {
      return score;
   }
   public void setScore(double score) {
      this.score = score;
   }
}