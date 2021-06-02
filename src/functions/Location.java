package functions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cinema.DBcinema;
import cinema.Theater;
//Movie객체 불러오기위한 클래스
public class Location {
	Connection con;	//데이터베이스에 접근할 수 있도록 설정
	PreparedStatement pstmt;	//데이터 베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs;	//데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	ArrayList<Theater> theaterlist = new ArrayList<Theater>();
	
	public ArrayList<Theater> getTheaterList() {//theater객체를 arraylist에 모두 저장하여 반환
		//빈타입 반환하는 벡터 생성
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
				
				//한 행의 영화 정보를 자바빈즈 객체에 저장
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
		//빈타입 반환하는 벡터 생성
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
			ResultSet rs = pstmt.executeQuery();	//실제 데이터 반환
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


	