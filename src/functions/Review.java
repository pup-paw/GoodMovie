package functions;
import cinema.*;
import java.sql.*;
import java.util.*;


public class Review {
	public static boolean enReview(String tknum, java.sql.Date revDate, String memID, String reContent, double score) {
		//���� ��� ������ true, ���н� false��ȯ�ϴ� �Լ�
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		//�����ȣ, ���䳯¥, ���䳻��, ���� ������Ʈ 
		String sql = "update ticketing set reno = 'R"+tknum+"', revDate = '"+revDate+"', "
				+ " reContent='"+reContent+"', score="+score+" where memID='"+memID+"'"
						+ "and tknum = '"+tknum+"';";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count != 0) {//���� ��� ������ true ����
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
	public static int cntReCnt(String memID) {//������� ���䰳�� ����
		Connection conn = DBcinema.loadConnect();
		int cnt = 0;
		try {
			Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery("select count(reno) from ticketing where memID='"+memID+"'");
	         rs.next();
	         cnt = rs.getInt("count(reno)");
		}catch(Exception e) {
			e.printStackTrace();
		}return cnt;
	}
	
	public static void updateReCnt(int recnt, String memID) {//�Է¹��� recnt��ŭ memID�� reCnt update
		int count=0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		//�����ȣ, ���䳯¥, ���䳻��, ���� ������Ʈ 
		String sql = "update member set reCnt = '"+recnt+"' where memID='"+memID+"'";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
     
		}catch (SQLException e) {
			e.printStackTrace();
			  }
	}
}
