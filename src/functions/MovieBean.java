package functions;
import java.util.*;
import cinema.*;
import java.sql.*;
//Movie��ü �ҷ��������� Ŭ����
public class MovieBean {
	Connection con;	//�����ͺ��̽��� ������ �� �ֵ��� ����
	PreparedStatement pstmt;	//������ ���̽����� ������ ��������ִ� ��ü
	ResultSet rs;	//�����ͺ��̽��� ���̺��� ����� ���Ϲ޾� �ڹٿ� �������ִ� ��ü
	ArrayList<Movie> movielist = new ArrayList<Movie>();
	
	public ArrayList<Movie> getMovieList() {
		//��Ÿ�� ��ȯ�ϴ� ���� ����
		con = null;
		pstmt = null;
		rs = null;
		
		try {
			con = DBcinema.loadConnect();
			String sql = "select * from movie";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Movie mv = new Movie();
				
				//�� ���� ��ȭ ������ �ڹٺ��� ��ü�� ����
				mv.setMno(rs.getString("mno"));
				mv.setTitle(rs.getString("title"));
				mv.setRgrCost(rs.getInt("rgrCost"));
				mv.setEarlyCost(rs.getInt("earlyCost"));
				mv.setWeekendCost(rs.getInt("weekendCost"));
				mv.setGenre(rs.getString("genre"));
				mv.setRuntime(rs.getInt("runtime"));
				mv.setAvgScore(rs.getDouble("avgScore"));
				mv.setStrDate(rs.getDate("strDate"));
				mv.setEndDate(rs.getDate("endDate"));
				mv.setRcnt(rs.getInt("rcnt"));
				mv.setSummary(rs.getString("summary"));
				mv.setDirector("director");
				
				movielist.add(mv);
		}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	return movielist;
	}
	public Movie getMovies(int n) {//n��° Movie��ü ��ȯ
		ArrayList<Movie> mvlist = getMovieList();
		return mvlist.get(n);
	}
}
