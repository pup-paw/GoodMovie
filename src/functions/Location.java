package functions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cinema.DBcinema;
import cinema.Theater;
//Movie��ü �ҷ��������� Ŭ����
public class Location {
	Connection con;	//�����ͺ��̽��� ������ �� �ֵ��� ����
	PreparedStatement pstmt;	//������ ���̽����� ������ ��������ִ� ��ü
	ResultSet rs;	//�����ͺ��̽��� ���̺��� ����� ���Ϲ޾� �ڹٿ� �������ִ� ��ü
	ArrayList<Theater> theaterlist = new ArrayList<Theater>();
	
	public ArrayList<Theater> getTheaterList() {//theater��ü�� arraylist�� ��� �����Ͽ� ��ȯ
		//��Ÿ�� ��ȯ�ϴ� ���� ����
		con = null;
		pstmt = null;
		rs = null;
		
		try {
			con = DBcinema.loadConnect();
			String sql = "select * from theater";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Theater th = new Theater();
				
				//�� ���� ��ȭ ������ �ڹٺ��� ��ü�� ����
				th.setTno(rs.getString("tno"));
				th.setLocation(rs.getString("location"));
				th.setTname(rs.getString("tname"));
				
				theaterlist.add(th);
		}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	return theaterlist;
	}
	
	
	public Theater getInform(int n) {
		//��Ÿ�� ��ȯ�ϴ� ���� ����
		ArrayList<Theater> thlist = getTheaterList();
		return theaterlist.get(n);
	}
	
	public ArrayList<Theater> getSeoulList(String city) {
		con = null;
		pstmt = null;
		rs = null;
		ArrayList<Theater> lclist = new ArrayList<Theater>();
		
		try {
			con = DBcinema.loadConnect();
			String sql = "select * from theater where location = ?";
			
		
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, city);
			ResultSet rs = pstmt.executeQuery();	//���� ������ ��ȯ
			Theater t = new Theater();
			while(rs.next()) {
				t.setTno(rs.getString("tno"));
				t.setLocation(rs.getString("location"));
				t.setTname(rs.getString("tname"));
				lclist.add(t);
			}
			con.close();
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	return lclist;
		
	}
}


	