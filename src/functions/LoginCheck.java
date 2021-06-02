package functions;

import cinema.DBcinema;
import java.sql.*;
//�α��� ���� ���� �Ǻ� Ŭ����
public class LoginCheck {
	public static boolean pass(String memID, String memPW) {//ȸ�� �α��� Ȯ��
		String password;
		
		Connection conn = DBcinema.loadConnect();
		
		String sql = "select * from member where memID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memID);
			ResultSet rs = pstmt.executeQuery();	//���� ������ ��ȯ
			rs.next();
			password= rs.getString("memPW");
			DBcinema.disconnect();
			if(password.equals(memPW)) {//��� ��ġ�ϸ� true
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean passAd(String adID, String adPW) {//������ �α��� Ȯ��
		String password;
		
		Connection conn = DBcinema.loadConnect();
		
		String sql = "select * from administrator where adID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adID);
			ResultSet rs = pstmt.executeQuery();	//���� ������ ��ȯ
			rs.next();
			password= rs.getString("adPW");
			DBcinema.disconnect();
			if(password.equals(adPW)) {//��� ��ġ�ϸ� true
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}

