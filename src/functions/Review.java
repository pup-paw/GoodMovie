package functions;
import cinema.*;
import java.sql.*;
import java.util.*;


public class Review {
	public static boolean enReview(String tknum, java.sql.Date revDate, String memID, String reContent, double score) {
		//리뷰 등록 성공시 true, 실패시 false반환하는 함수
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		//리뷰번호, 리뷰날짜, 리뷰내용, 평점 업데이트 
		String sql = "update ticketing set reno = 'R"+tknum+"', revDate = '"+revDate+"', "
				+ " reContent='"+reContent+"', score="+score+" where memID='"+memID+"'"
						+ "and tknum = '"+tknum+"';";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count != 0) {//리뷰 등록 성공시 true 리턴
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
	public static int cntReCnt(String memID) {//멤버별로 리뷰개수 리턴
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
	
	public static void updateReCnt(int recnt, String memID) {//입력받은 recnt만큼 memID의 reCnt update
		int count=0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		//리뷰번호, 리뷰날짜, 리뷰내용, 평점 업데이트 
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
