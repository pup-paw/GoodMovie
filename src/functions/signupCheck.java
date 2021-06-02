package functions;
//회원가입 성공 여부 판별 클래스
import cinema.DBcinema;
import java.sql.*;

public class signupCheck {
	public static boolean signupMem(String memID, String memPW, String memName, String telno) {
		//회원 회원가입 데이터 삽입
		
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		String sql = "INSERT INTO member values ('" + memID + "'," + "'" + memPW + "'," 
                + "'" + memName + "'," + "'" + telno + "',0,0)";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count == 1) {//회원가입 성공시 true 리턴
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
	public static boolean signupAd(String adName, String adID, String adPW, String adno) {
		//관리자 회원가입 데이터 삽입
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		String sql = "INSERT INTO administrator values ('" + adName + "'," + "'" + adID + "'," 
                + "'" + adPW + "'," + "'" + adno + "')";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count == 1) {//회원가입 성공시 true 리턴
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
}

