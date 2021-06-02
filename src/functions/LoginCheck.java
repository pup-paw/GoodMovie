package functions;

import cinema.DBcinema;
import java.sql.*;
//로그인 성공 여부 판별 클래스
public class LoginCheck {
	public static boolean pass(String memID, String memPW) {//회원 로그인 확인
		String password;
		
		Connection conn = DBcinema.loadConnect();
		
		String sql = "select * from member where memID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memID);
			ResultSet rs = pstmt.executeQuery();	//실제 데이터 반환
			rs.next();
			password= rs.getString("memPW");
			DBcinema.disconnect();
			if(password.equals(memPW)) {//비번 일치하면 true
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean passAd(String adID, String adPW) {//관리자 로그인 확인
		String password;
		
		Connection conn = DBcinema.loadConnect();
		
		String sql = "select * from administrator where adID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adID);
			ResultSet rs = pstmt.executeQuery();	//실제 데이터 반환
			rs.next();
			password= rs.getString("adPW");
			DBcinema.disconnect();
			if(password.equals(adPW)) {//비번 일치하면 true
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}

