package functions;
import java.util.*;
import cinema.*;
import java.sql.*;
//Movie객체 불러오기위한 클래스
public class MovieBean {
	Connection con;	//데이터베이스에 접근할 수 있도록 설정
	PreparedStatement pstmt;	//데이터 베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs;	//데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	ArrayList<Movie> movielist = new ArrayList<Movie>();
	
	public ArrayList<Movie> getMovieList() {
		//빈타입 반환하는 벡터 생성
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
				
				//한 행의 영화 정보를 자바빈즈 객체에 저장
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
	public Movie getMovies(int n) {//n번째 Movie객체 반환
		ArrayList<Movie> mvlist = getMovieList();
		return mvlist.get(n);
	}
}
