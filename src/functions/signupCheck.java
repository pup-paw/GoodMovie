package functions;
//ȸ������ ���� ���� �Ǻ� Ŭ����
import cinema.DBcinema;
import java.sql.*;

public class signupCheck {
	public static boolean signupMem(String memID, String memPW, String memName, String telno) {
		//ȸ�� ȸ������ ������ ����
		
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		String sql = "INSERT INTO member values ('" + memID + "'," + "'" + memPW + "'," 
                + "'" + memName + "'," + "'" + telno + "',0,0)";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count == 1) {//ȸ������ ������ true ����
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
	public static boolean signupAd(String adName, String adID, String adPW, String adno) {
		//������ ȸ������ ������ ����
		int count =0;
		Connection conn = DBcinema.loadConnect();
		PreparedStatement pstmt=null;
		String sql = "INSERT INTO administrator values ('" + adName + "'," + "'" + adID + "'," 
                + "'" + adPW + "'," + "'" + adno + "')";
		try {
			pstmt = conn.prepareStatement(sql);
        	count = pstmt.executeUpdate(); 	
        	DBcinema.disconnect();
        	if(count == 1) {//ȸ������ ������ true ����
        		return true;
        	}
		}catch (SQLException e) {
			e.printStackTrace();
			  }
		return false;
	}
}

